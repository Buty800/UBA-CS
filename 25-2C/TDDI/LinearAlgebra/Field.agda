open import Level using (Level; _⊔_) renaming (suc to sucₗ)
open import Relation.Nullary using (¬_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong; subst)
open import Data.Product using (Σ-syntax; _×_; _,_; proj₁; proj₂)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

module LinearAlgebra.Field 
    {ℓ : Level}
    where
-- Cuerpo Algebraico 
record Field : Set (sucₗ ℓ) where
    infixr 40 _+_
    infixr 50 _*_
    field
        𝕂       : Set ℓ
        _+_ _*_ : 𝕂 → 𝕂 → 𝕂
        𝟘 𝟙     : 𝕂

        +-assoc         : {x y z : 𝕂} → (x + y) + z ≡ x + (y + z)
        +-comm          : {x y : 𝕂} → x + y ≡ y + x
        +-identity-r    : {x : 𝕂} → x + 𝟘 ≡ x
        +-inverse       : {x : 𝕂} → Σ[ -x ∈ 𝕂 ] x + (-x) ≡ 𝟘
        
        *-assoc         : {x y z : 𝕂} → (x * y) * z ≡ x * (y * z)
        *-comm          : {x y : 𝕂} → x * y ≡ y * x
        *-identity-r    : {x : 𝕂} → x * 𝟙 ≡ x
        *-inverse       : {x : 𝕂} → ¬ (x ≡ 𝟘) → Σ[ 1/x ∈ 𝕂 ] x * (1/x) ≡ 𝟙
        
        distrib-l       : {x y z : 𝕂} → x * (y + z) ≡ (x * y) + (x * z)

module _ 
    (fieldStruct : Field)
    where   
    open Field fieldStruct

    -_ : 𝕂 → 𝕂 
    - x = proj₁ (+-inverse {x})

    +-inverse-r : {x : 𝕂} → x + (- x) ≡ 𝟘
    +-inverse-r = proj₂ +-inverse 
