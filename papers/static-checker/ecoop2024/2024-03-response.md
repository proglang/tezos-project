
# General comments

Thanks to the reviewers for their extensive comments.

We will address all writing issues highlighted by the reviewers to enhance the presentation quality. 
Our responses focus on the technical questions.


# Review 7A

    I miss some validation of the symbolic semantics with respect to some other definition of Michelson semantics. Two related works have formulated parts of the language and there is  informal technical documentation. It should be possible to create a test suite to increase  confidence that the semantics is accurate.

The types, symbolic terms, and semantics of the symbolic rules for the instructions adhere to the formal definitions of the Michelson language as outlined in  [1] and [2]. Additionally, we have developed numerous test cases in preparation for implementing the instructions. These tests are aimed at validating the symbolic semantics and providing confidence in their accuracy. This comprehensive test suite will be part of our artifact submission.

* [1] <https://tezos.gitlab.io/active/michelson.html>
* [2] <https://tezos.gitlab.io/michelson-reference/>

        I am also a little unsatisfied with what is and is not said about unbounded loops. Sect 6.2.5 makes clear the LOOP instructions admit unbounded and non-terminating computation. So exhaustive symbolic execution is not possible in general, yet the focus is on verification. Do the case studies only involve bounded iteration? Were they in fact exhaustively analyzed?

We analyze two scenarios for unbounded loops depending on the input term:

* When the input to the symbolic execution consists of concrete values, an unbounded loop causes the interpreter to iterate for a significant number of times until it halts with an exception indicating an unfinished loop. This mirrors the behavior observed in the actual execution of Tezos contracts, where the loop continues until it runs out of gas, terminating the computation with an out-of-gas error.
* For a symbolic value, the stack type is determined before the loop is executed. We abstract the result of the loop as the abstract function result. Initially, we execute the loop to determine the semantic of the function, and then we present the stack result as the function result. Redundant function iterations are eliminated. Additionally, the loop condition is abstracted as a function result. For future improvements, this abstraction helps detect whether the loop is unbounded, such as when the result of the function is always true. In such cases, we can check if (not loop condition) is unsatisfiable. This abstraction enables the tool to detect undefined loops, which we are currently implementing improvements for in the tool.


        I miss some discussion on how much of Michelson is handled. The conclusion mentions a substantial missing feature, i.e., the instruction by which a contract can be called from within another contract invocation. Are there other major features missing? Are there difficulties handling them?

We have implemented approximately 85% of the Michelson instructions in our tool. We are confident that most of the major-use instructions are included. The reason for not implementing all instructions is primarily due to time constraints rather than technical limitations. We continuously strive to add as many instructions as possible over time. The remaining instructions that have not been implemented are either used for specific purposes or have been recently added to Michelson, such as the instructions related to tickets (JOIN_TICKETS, READ_TICKET, SPLIT_TICKET, and TICKET) or those related to timelocks (OPEN_CHEST).


    The case studies provide positive evidence that some interesting properties can be specified, but I miss some assessment of what portion of actual requirements can be specified in SCV; for example, does the lack of quantifiers get in the way? Presumably some requirements would involve properties of token transfers or other operations triggered by contracts, which is beyond current SCV and was not discussed. Section 8 mentions specifying allowed sequences of entry invocations as future work; might one also want liveness properties?

Since SCV utilizes an SMT solver, namely the Z3 solver, the tool can handle properties that can be expressed and handled by the Z3 solver. Considering the requirements from the Michelson language, all basic types of Michelson, such as bool, integer, string, bytes, and data structures such as pair, option, set, list, and map, are convertible to the corresponding theories in Z3, such as boolean, integer, sequence, tuple, list, and set. Other blockchain-related types, such as address, can be converted using basic theories in Z3.

For the two case studies conducted, there was no need to use quantifiers, but at this moment these qualifiers have been implemented in SCV, making them available for use. Upon considering several smart contracts and their required properties, we observed that SCV is capable of expressing and verifying a variety of properties for smart contracts. However, for properties that involve operations triggered by the contract requiring interaction with other smart contract code, the tool is not yet able to handle them, which we intend to address in future work.

It is worth considering liveness properties. In the current version, the tool can handle some very simple liveness properties, but users need to perform different checks for all entrypoints. When the tool can handle external smart contract calls, it will be possible to specify and check more complex liveness properties.


    Another kind of contribution would be findings about flaws. The last paragraph of sect 5 describes a flaw that was found in one contract, but that's all.

The two case studies involve real smart contracts that have been operational on the Tezos blockchain for some time. We believe these smart contracts underwent numerous tests. Despite that, a flaw was reported in the Kolibri oracle contract. We plan to conduct additional case studies on real contracts to detect any flaws that may exist. Additionally, we intend to conduct tests on contracts that have already been flagged with flaws to demonstrate the tool's ability to detect them.


    l400 about values of contract type not being storable, how do we know which types are storable? Fig 1 distinguishes comparable types but not storables.

Most of the basic types are storable, except for the `contract ty` type and operation type. Additionally, for data types such as pair type 1 (ty1) and type 2 (ty2), and list type (ty), they are storable only when the type (ty) itself is storable. This clarification is stated in [2], and we will ensure to make this clear in the paper.


# Review 7B

    In Section 2, the authors briefly present the Michelson language and operational semantics, reviewing the main instructions. The rules of the semantics are not given, nor are pointers for where they can be found.

The types, symbolic terms, and semantics of the symbolic rules for the instructions adhere to the formal definitions of the Michelson language as outlined in [1] and [2].

    The design rationale and the sources of inspiration for the DSL are not provided.

The intention of the DSL's design is to be able to express and verify contract lifecycles such as those shown in the figures. 
The design of the logic part is pretty much determined by legal Z3 formulas, taking into consideration the Michelson data  types and terms.
We'll make sure that this comes across more clearly in the final paper.
 

    the relationship of the symbolic semantics presented with the formal semantics of the language is also not even discussed. It is thus difficult to judge the adequacy of the semantics supporting the verification approach.

In separate work (which is currently in submission), we have designed a dynamic logic tailored to Michelson as a formal foundation for the implementation of SCV. This logic encompasses calls between contracts, i.e., it goes beyond the state of the implementation as reported in this paper.
We have a soundness proof of this logic formalized in the Agda proof assistant.
Our approach is inspired by work on the key project <https://www.key-project.org/>, which is based on symbolic execution using (another) dynamic logic.

The present work is meant to present the practical side of SCV. If we were to discuss soundness in depth, we would have to discuss the dynamic logic along with it, which does not fit for space reasons. 

We'll be happy to include a (very brief) sketch of the soundness proof.
We'll also be happy to share the Agda formalization of the proof with the reviewers.
 
# Review 7C

    How SCV puts these pieces together to do verification. Can you provide a system diagram and a description of it so I can better understand how the tool is implemented/works?

Unfortunately, we cannot put a diagram in the response (but it will be put in the revised paper).
Here is a description: The tool comprises four main components. Firstly, a user specification in the DSL provides input terms (storage and parameter) along with the code to the symbolic interpreter, while the output term and the pre- and post-conditions are fed to the static checker. The symbolic interpreter then runs symbolic execution on the code with the provided input. At each step of the symbolic execution, when a branch occurs, the interpreter sends the path condition to the Z3 converter to convert it to Z3 formulas, which are then passed to the Z3 solver to check whether the path conditions are satisfied. The result of the check determines the action taken by the interpreter; if satisfied, the branch is added, otherwise it is abandoned. In our experiments, this branch check significantly reduces the number of execution states, especially for stack-based languages like Michelson, where the programmer may need to perform the same check multiple times.

Once the symbolic execution finishes, the results (i.e., all reachable states) are sent to the static checker. Each state contains the post-storage updated after the execution, the list of operations to emit, and the path conditions. The static checker then performs three different functions: output check, property check, and generation of all fail conditions.

The output check compares the output pattern specified in the user specification with the output represented in the post-storage to detect whether they match (including type matching).

The property check initially sends the pre- and post-conditions, the path conditions, and the symbolic results to the Z3 converter to convert them to Z3 formulas, which are then passed to the Z3 solver to check the property.

Lastly, the tool generates fail conditions by analyzing all the fail states of the symbolic result to generate all fail conditions.

    Lns 632-643, is this paragraph referring to a bug found or oversight found in the Kolibri oracle?

yes, indeed. The constraint aims to ensure the validity of the returned data. Following this, we specified the corresponding property and conducted the check. However, the result of the property check was false, signifying that the property did not hold. Furthermore, we generated fail conditions for two related entrypoints to ascertain if this condition was reported, but none were identified. Upon delving deeper into the code, we confirmed the presence of the flaw.

    How are the non-deterministic rules (such as loop) handled in implementation?

See the paragraph provided in the previous response serves as a response to the first reviewer comment, addressing concerns about unbounded loops.

    Do you have a proof of soundness of your verification system?

Yes. See last comment to review 7B.

    I don’t really see the practical benefits of this work over HELMHOLTZ. The paper argues that one practical benefit is that users don’t need to modify within the code, but I suspect most non-formal methods users won’t be specifying Michelson code, but specifying higher-level code that will compile down to one of these two tools.


The DSL enables users to specify properties with an basic understanding of Michelson data types, which are also present in higher-level languages. There is no need to modify the Michelson code. Therefore, to verify a smart contract written in a higher-level language, the only requirement is a tool that compiles code from a higher-level language to Michelson, which mostly already exists. This leads us to the idea of combining all these steps into a unified tool that allows users to directly verify smart contracts in a higher-level language.

In contrast, Helmholtz requires users to write properties in a refinement type as input, which definitely necessitates formal method experts. Users are required to be Michelson programmers to integrate the property specifications into the code.

