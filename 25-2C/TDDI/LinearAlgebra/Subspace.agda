open import Level using (Level; _⊔_)
open import Data.Product using (_×_; _,_; proj₁; proj₂)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong; subst)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

open import LinearAlgebra.Field
open import LinearAlgebra.Props.Field
open import LinearAlgebra.VectorSpace
open import LinearAlgebra.Utils
import LinearAlgebra.Props.VectorSpace as VectorSpacesProps

module LinearAlgebra.Subspace 
    {ℓ ℓ′ : Level} {fieldStruct : Field {ℓ}} {𝕍 : Set ℓ′} 
    (p : Pred 𝕍) (vectorSpace𝕍 : VectorSpace fieldStruct 𝕍)
    where
open Field fieldStruct
open VectorSpace vectorSpace𝕍  
open VectorSpacesProps {vectorSpace𝕍 = vectorSpace𝕍}

private 
    pred = proj₁ p 
    is_porp = proj₂ p 

-- Prueba de que un predicado se mantiene bajo un espacio vectorial
record _≤_ : Set (ℓ ⊔ ℓ′) where
    field
        +ᵥ-closed : {u v : 𝕍} → pred u → pred v → pred (u +ᵥ v) 
        ·ᵥ-closed : {k : 𝕂} {v : 𝕍} → pred v → pred (k ·ᵥ v)
        inhabited : Sub 𝕍 p

--Dado la prueba de que un predicado mantiene un espacio vectorial, nos da el subespacio vectorial
Subspace : (_≤_) → VectorSpace fieldStruct (Sub 𝕍 p) 
Subspace s .VectorSpace.𝟘ᵥ              = (𝟘ᵥ , transport pred 𝟘-absorbᵥ (·ᵥ-closed (proj₂ inhabited)))
    where open _≤_ s
Subspace s .VectorSpace._+ᵥ_            = λ (v , p₁) (u , p₂) → (v +ᵥ u , +ᵥ-closed p₁ p₂)
    where open _≤_ s
Subspace s .VectorSpace._·ᵥ_            = λ k (v , p') → (k ·ᵥ v , ·ᵥ-closed p')
    where open _≤_ s
Subspace s .VectorSpace.-ᵥ_             = λ (v , p') → (-ᵥ v , transport (proj₁ p) (sym -ᵥ=*-1) (·ᵥ-closed { - 𝟙} p'))
    where open _≤_ s
Subspace _ .VectorSpace.+ᵥ-comm         = Σ≡ +ᵥ-comm        is_porp
Subspace _ .VectorSpace.+ᵥ-assoc        = Σ≡ +ᵥ-assoc       is_porp
Subspace _ .VectorSpace.+ᵥ-identity-r   = Σ≡ +ᵥ-identity-r  is_porp
Subspace _ .VectorSpace.+ᵥ-inverse-r    = Σ≡ +ᵥ-inverse-r   is_porp
Subspace _ .VectorSpace.·ᵥ-assoc        = Σ≡ ·ᵥ-assoc       is_porp
Subspace _ .VectorSpace.·ᵥ-identity     = Σ≡ ·ᵥ-identity    is_porp
Subspace _ .VectorSpace.distribᵥ-l      = Σ≡ distribᵥ-l     is_porp
Subspace _ .VectorSpace.distribᵥ-r      = Σ≡ distribᵥ-r     is_porp