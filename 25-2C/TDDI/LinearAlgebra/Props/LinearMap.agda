open import Level using (Level; _⊔_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

open import LinearAlgebra.Field
open import LinearAlgebra.Props.Field
open import LinearAlgebra.VectorSpace
open import LinearAlgebra.LinearMap
open import LinearAlgebra.Props.VectorSpace

module LinearAlgebra.Props.LinearMap
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕍 𝕌 : Set ℓ′} 
    {vectorSpace𝕍 : VectorSpace fieldStruct 𝕍}
    {vectorSpace𝕌 : VectorSpace fieldStruct 𝕌}
    {h : Hom vectorSpace𝕌 vectorSpace𝕍}
    where 
    
    open Field fieldStruct
    open VectorSpace vectorSpace𝕍
    open VectorSpace vectorSpace𝕌 renaming ( 𝟘ᵥ to 𝟘ᵤ; _·ᵥ_ to _·ᵤ_ )
    
    open Hom h

     
    𝟘ᵥ-preservation : f 𝟘ᵤ ≡ 𝟘ᵥ
    𝟘ᵥ-preservation = 
            f 𝟘ᵤ
        ≡⟨ cong f (sym (𝟘-absorbᵥ {vectorSpace𝕍 = vectorSpace𝕌}))⟩
            f (𝟘 ·ᵤ 𝟘ᵤ) 
        ≡⟨ homogeneity ⟩
            𝟘 ·ᵥ f 𝟘ᵤ
        ≡⟨ 𝟘-absorbᵥ {vectorSpace𝕍 = vectorSpace𝕍} {v = f 𝟘ᵤ} ⟩
            𝟘ᵥ
        ∎ 
    
    