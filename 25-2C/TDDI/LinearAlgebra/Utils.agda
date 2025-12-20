open import Level using (Level; _⊔_) renaming (suc to sucₗ)
open import Data.Product using (Σ-syntax; _×_; _,_; proj₁; proj₂)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
open import Data.Nat using (ℕ)
open import Data.Vec using (Vec; []; _∷_)

module LinearAlgebra.Utils {ℓ : Level} where 
isProp : Set ℓ → Set ℓ
isProp A = {x y : A} → x ≡ y

isProp-≡ : {A : Set ℓ} {x y : A} → isProp (x ≡ y)
isProp-≡ {A} {x} {y} {refl} {refl} = refl 

Pred : Set ℓ → Set (sucₗ ℓ)
Pred A = Σ[ f ∈ (A → Set ℓ) ] ({a : A} → isProp (f a))

Sub : (A : Set ℓ) → Pred A → Set ℓ
Sub A p = Σ[ v ∈ A ] (proj₁ p) v

transport : {A : Set ℓ} (B : A → Set ℓ) {x y : A} (p : x ≡ y) → B x → B y
transport _ refl b = b

Σ≡ : 
    {A : Set ℓ} {B : A → Set ℓ} {a b : A} {p : B a} {q : B b} → 
    (eq : a ≡ b) → transport B eq p ≡ q → (a , p) ≡ (b , q)
Σ≡ refl refl = refl

∷-cong : {n : ℕ} {A : Set ℓ} { x y : A } { xs ys : Vec A n} → x ≡ y → xs ≡ ys → (x ∷ xs) ≡ (y ∷ ys) 
∷-cong refl refl = refl  

postulate funext : {A : Set ℓ} {B : A → Set ℓ} {f g : (a : A) → B a}
                → ((a : A) → f a ≡ g a)
                → f ≡ g