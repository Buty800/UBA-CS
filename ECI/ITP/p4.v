Unset Universe Checking.
Require Export UniMath.Foundations.All.

(* Instructions: there are 10 exercises. Succesfully completing x exercises will earn you a grade of x. (No partial credit will be given.) Please alter the following comment to tell me which exercises you completed below.*)

(* I completed 3 exercises: Exercise 1, 3, 4.*)

(* Exercise 1 *)

Theorem comp_app { P Q R : UU } (f : P → Q) (g : Q → R) (p : P) : R.
Proof.
  exact (g (f p)).
Defined.

(* Exercise 2 *)

Lemma path_combination {A : UU} {a a' b : A} (p : a = b) (q: a' = b) : a = a'.
(* Another way to combine paths. *)
Proof.
  induction q.
  exact p.
Defined.

(* Exercise 3 *)

Lemma path_combination_fact {A : UU} {a b : A} (p : a = b) : idpath a = path_combination p p.
(* Check that the above way of combining paths does the `right thing'. *)
Proof.
  induction p.
  simpl.
  apply idpath.
Defined.

(* Exercise 4 *)

Theorem exp : nat → nat → nat.
Proof.
  intro n.
  intro m.
  induction m.
  -exact 1.
  -exact (IHm * n). 
  
Defined.

Compute (exp 5 1).

Compute (exp 3 2).

(* Exercise 5 *)

Theorem curried_proj {P Q R : UU} : (P → (Q × R)) → (P → Q).
Proof.
  intro f.
  intro p.
  set (qr := f p).
  induction qr as [q r].
  exact q.
Defined.

(* Exercise 6 *)

Search (∏ X Y : UU, ∏ f : X → Y, ∏ x y : X, x = y → (f x) = (f y)).
Search (∏ x y z : nat, (x*y)*z=x*(y*z)).

(* This command searches the library for functions of this kind. You should see in the output that ~maponpaths~ is of this kind. You can then print ~maponpaths~ (i.e. write "Print maponpaths.") to see the definition.

You can use this to find other lemmas from the library. You can use any facts without proof from the library about addition and multiplication as well as ~maponpaths~.*)

Theorem exp_hom {l m n : nat} : exp l (m + n) = (exp l m) * (exp l n).
(* `exp l` takes addition to multiplication.*)
Proof.
  induction m.
  - simpl.
    apply idpath.
  - rewrite natmultcomm.
    simpl.
    apply pathsinv0.
    rewrite natmultcomm.
    rewrite natmultassoc.
    rewrite natmultcomm.
    apply pathsinv0.
    rewrite natmultcomm.
    rewrite natmultassoc.
    apply maponpaths.
    rewrite natmultcomm.
    exact IHm.
Defined.

(* Exercise 7 *)

(* isaprop is defined differently in UniMath than we defined in lectures. Show that these two definitions are the the same. *)

(* Note that this is the hardest exercise, but the ones following depend on it. Feel free to leave it admitted and use the result without proof in the following exercises. *)

Lemma contr_is_prop {C : UU} (h : iscontr C) : isaprop C.
Proof.
    unfold isaprop.
    simpl.
    intros x y.
    unfold iscontr.
    use tpair.
    induction h as [cntr p].
    + exact (path_combination (p x) (p y)).
    + simpl.
      intro t.
      induction t.
      exact (path_combination_fact (pr2 h x)).
Defined.


Theorem prop_thm {P : UU} : isaprop P <-> (∏ x y : P, x = y).
(* The different definitions of isaprop are logically equivalent. *)
Proof.
split.
- intros p x y.
  induction (p x y) as [e _].
  exact e.
- intro e.
  unfold isaprop.
  simpl.
  intros x.
  apply contr_is_prop.
  unfold iscontr.
  use tpair.
+ exact x.
+ simpl.
  intro.
  exact (e t x).
Defined.

(* Exercise 8 *)

(* Show that the dependent product type former commutes with `isaprop`.*)

Theorem prop_commutes_Π {A : UU} {B : A → UU} (p : ∏ x : A, isaprop (B x)) : isaprop (∏ x : A, (B x)).
Proof.
Admitted.


(* Exercise 9 *)

(* Show that isweq f is a proposition. *)

(* Use ~isapropisofhlevel~ from the library. *)

Print isapropisofhlevel.

Theorem isweq_is_prop {A B : UU} (f : A → B) : isaprop (isweq f).
Proof.
unfold isweq.
apply prop_commutes_Π.
intro.
assert (contr_lvl0 : iscontr = isofhlevel 0).
{
  apply idpath.
}
rewrite contr_lvl0.
apply isapropisofhlevel.
Defined.

(* Exercise 10 *)

(* You are allowed to use isweq_iso from the library in this proof: it says if f is a quasiequivalence, then f is an equivalence in that sense.*)

Print isweq_iso.

Lemma inverse {A B : UU} (e : A ≃ B) : B → A.
Proof.
    unfold weq in e.
    induction e as [f w].
    intro b.
    unfold isweq in w.
    unfold iscontr in w.
    induction (w b) as [cntr _].
    unfold hfiber in cntr.
    induction cntr as [x _].
    exact x.
Defined.

Theorem prop_equiv_to_log_equiv (P Q : hProp) : (P ≃ Q) <-> (P <-> Q).
(* An equivalence between propositions is (logically equivalent to) a logical equivalence. *)
Proof.
split.
- intro eq.
  split.
+ intro p.
  exact (eq p).
+ use inverse.
  exact eq.
- intro sii.
  induction sii as [f g].
  unfold weq.
  use tpair.
+ exact f.
+ simpl.
  unfold hProp in P,Q.
  induction P as [T1 P1], Q as [T2 P2].
  simpl in g,f.
  use isweq_iso.
* exact g.
* intro x.
  simpl in x.
  apply prop_thm.
  simpl.
  exact P1.
* intro y.
  simpl in y.
  apply prop_thm.
  simpl.
  exact P2.
Defined.
