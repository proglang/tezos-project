(** This module implements the transformation of the assertion formula. It also identifies
    conditions on predicates of quantifiers (i.e. their bounds) and assigns them to the
    respective quantifier.

    The transformation T is defined as follows:
    - Quantifiers and their bodies are negated; for assertions a without
      quantifiers, T(a) = a
    - T(forall(body)) = exists (T(body)); T(exists(body)) = forall (T(body))
    - T(condition) = condition
    - T(=) = <>, T(<>) = =, T(>) = <=, T(<=) = >, T(<) = >=, T(>=) = <
    - T(&&) = ||, T(||) = &&, T(Not(x)) = x, T(x : bool) = Not(x)
    - T(true) = false, T(false) = true

   The bounds are assigned as follows:
   - predicates in a condition are identified
   - assign the bound to the innermost (deepest nested) quantifier defining one
     of the identified predicates
   - conditions containing certain operators are not merged due to higher complexity;
     these include: = <> || xor
   - example:
     (entrypoint _
       (forall (x: int)
          (forall (y: int)
            (if (gt y x)
               (assert ...)))))

     the bound y>x is assigned to the quantifier (forall (y: int) (...)).
*)

open Parsing.Assertion

val transform: assertion_ast list -> assertion_ast list
