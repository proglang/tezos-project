Thanks to the reviewers for their insightful comments.
In a revision, we will address all specific comments.

# Review 18A
1. Handling loops in our implementation:
For loops, we unfold the symbolic value once, execute the loop to determine the operation function f, and then abstract the stack and loop condition as function results. The loop condition function is recorded in the path condition. This approach helps detect unbounded loops by checking if not (loop-condition) is unsatisfiable.

2. The limitations of our tool:
Our tool relies on Z3, which may struggle with very large or complex problems, returning "unknown" if it cannot determine satisfiability. Additionally, the tool does not yet handle gas consumption or include external calls.
# Review 18B
We use Z3 to discard unsatisfiable branches. For loop instructions, we unfold the symbolic value once, then abstract the loop condition and stack as function results. This method reduces the number of branches compared to unfolding the symbolic value multiple times.

Our experiments showed significant state reduction. For example, the transfer entrypoint saw states reduced from 24,700 to 323 (87%), and for the approve entrypoint from 98 to 54 (45% ). This reduction depends on the number of branch and loop instructions and significantly reduces when the same condition is checked multiple times.
# Review 18C
(W1) Please see the comment on review 18B.
(W2) In separate work to be presented at another conference this year, we have designed a dynamic logic for Michelson as a formal foundation for SCV. This logic encompasses calls between contracts and extends beyond the current implementation discussed in this paper. We have formalized a soundness proof using the Agda proof assistant.

This paper focuses on the practical side of SCV, and the revised version will reference the other work. Upon request, we can share the anonymized paper and the Agda formalization with the reviewers.

(W3) The notation "(%a -> %a) with p" indicates that it is possible to call the same entrypoint %a after an invocation of %a, provided that p holds.

Define Pa as the condition required to invoke %a given symbolic values, and Qa as the predicate that holds after a successful call to %a, denoted as Pa[%a]Qa​. The notation "(%a -> %a) with p" signifies that p and Qa  imply Pa: (p ∧ Qa) => Pa. Since Qa holds after an invocation of %a, (p ∧ Qa) => Pa holds, thus satisfying the condition to invoke %a. Consequently, the entrypoint %a can be called again. Therefore, "(%a -> %a) with p" represents an unbounded number of invocations to %a.

(W4) The iContract work and our work differ in target language, DSL design, and functionality.

Our DSL is separate from the code and focuses on I/O constraints, whereas the iContract language requires modifying the code and relies on predefined functions.

Our tool's ability to generate failure conditions is particularly useful for verifying access control properties. To our knowledge, no other tool offers this feature.
