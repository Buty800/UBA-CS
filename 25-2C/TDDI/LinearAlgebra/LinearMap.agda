open import Level using (Level; _⊔_)
open import Data.Product using (_×_; _,_; proj₁; proj₂)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

open import LinearAlgebra.Field
open import LinearAlgebra.Props.Field
open import LinearAlgebra.VectorSpace
open import LinearAlgebra.Utils

module LinearAlgebra.LinearMap    
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕍 𝕌 : Set ℓ′} 
    where  

open Field fieldStruct 

record Hom (vectorSpace𝕌 : VectorSpace fieldStruct 𝕌) (vectorSpace𝕍 : VectorSpace fieldStruct 𝕍): Set (ℓ ⊔ ℓ′) where 
    open VectorSpace vectorSpace𝕍
    open VectorSpace vectorSpace𝕌 renaming (_+ᵥ_ to _+ᵤ_ ; _·ᵥ_ to _·ᵤ_)
    field
        f : 𝕌 → 𝕍
        additivity : {v w : 𝕌} → f (v +ᵤ w) ≡ f v +ᵥ f w  
        homogeneity : {k : 𝕂} {v : 𝕌} → f ( k ·ᵤ v ) ≡ k ·ᵥ f v

module _
    {vectorSpace𝕌 : VectorSpace fieldStruct 𝕌} 
    {vectorSpace𝕍 : VectorSpace fieldStruct 𝕍} 
    (h : Hom vectorSpace𝕌 vectorSpace𝕍)
    where
    open VectorSpace vectorSpace𝕍
    open VectorSpace vectorSpace𝕌 using () renaming ( 𝟘ᵥ to 𝟘ᵤ )
    open Hom h

    Ker : Pred 𝕌
    Ker = ( (λ v → f v ≡ 𝟘ᵥ) , isProp-≡ )
