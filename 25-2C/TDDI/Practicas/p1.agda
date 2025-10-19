--1 
flip : {A B C : Set} -> (A -> B -> C) -> B -> A -> C
flip f b a = f a b 

compose : {A B C : Set} -> (B -> C) -> (A -> B) -> A -> C
compose f g a = f (g a) 

--2
 
data Bool : Set where
    false : Bool
    true : Bool

recBool : {C : Set} -> C -> C -> Bool -> C
recBool a _ true = a 
recBool _ b false = b
  
not : Bool -> Bool
not = recBool false true

data _×_ (A B : Set) : Set where
    _,_ : A -> B -> A × B


recProduct : {A B C : Set} -> (A -> B -> C) -> A × B -> C
recProduct f (a , b) = f a b

indProduct : {A B : Set} {C : A × B -> Set } -> ((a : A) (b : B) -> C (a  , b)) -> (x : A × B) -> C x
indProduct f (a , b) = f a b

i : {A B : Set} -> A × B -> A 
i p = recProduct (λ a b -> a) p

ii : {A B : Set} -> A × B -> B
ii p = recProduct (λ a b -> b) p

iii : {A B : Set} {C : A × B -> Set } -> ((x : A × B) -> C x) -> (a : A) (b : B) -> C (a  , b)
iii f a b = f (a , b)

-- iv = indProduct 

data ⊥ : Set where

⊥-elim : {C : Set} -> ⊥ -> C
⊥-elim ()

b : {A B : Set} -> (A -> ⊥) -> A -> B 
b f a = ⊥-elim (f a) 

--5 

data Unit : Set where
    tt : Unit

indUnit : {C : Unit -> Set} → C tt -> (x : Unit) → C x
indUnit t tt = t 

--6

data Σ (A : Set) (B : A → Set) : Set where
    _,_ : (a : A) → B a → Σ A B

indΣ : {A : Set} {B : A → Set} {C : Σ A B → Set} → ((a : A) (b : B a) → C (a , b)) → (p : Σ A B) → C p
indΣ f (a , b) = f a b

proj₁ : {A : Set} {B : A -> Set} -> Σ A B -> A 
proj₁ = indΣ (λ a b -> a) 

proj₂ : {A : Set} {B : A -> Set} -> (p : Σ A B) → B (proj₁ p) 
proj₂ = indΣ (λ a b -> b) 

weak_choice : {A B : Set} {C : A -> B -> Set} -> ((a : A) -> Σ B (C a)) -> Σ (A → B) (λ f → (a : A) → C a (f a))
weak_choice f = (λ a -> proj₁ (f a)) , (λ a -> proj₂ (f a)) 
