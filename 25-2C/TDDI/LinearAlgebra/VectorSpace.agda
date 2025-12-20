module LinearAlgebra.VectorSpace where

open import Level using (Level; _⊔_)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong; subst)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

open import LinearAlgebra.Field

record VectorSpace {ℓ ℓ′} (fieldStruct : Field {ℓ}) (𝕍 : Set ℓ′) : Set (ℓ ⊔ ℓ′) where
    open Field fieldStruct
    infixr 40 _+ᵥ_
    infixr 50 _·ᵥ_
    field
        𝟘ᵥ  : 𝕍

        _+ᵥ_ : 𝕍 → 𝕍 → 𝕍 
        _·ᵥ_  : 𝕂 → 𝕍 → 𝕍
        -ᵥ_ : 𝕍 → 𝕍

        +ᵥ-comm     : {u v : 𝕍} → u +ᵥ v ≡ v +ᵥ u 
        +ᵥ-assoc    : {u v w : 𝕍} → (u +ᵥ v) +ᵥ w ≡ u +ᵥ (v +ᵥ w)
        +ᵥ-identity-r : {u : 𝕍} → u +ᵥ 𝟘ᵥ ≡ u 
        +ᵥ-inverse-r : {u : 𝕍} → u +ᵥ (-ᵥ u) ≡ 𝟘ᵥ

        ·ᵥ-assoc     : {α β : 𝕂} {u : 𝕍} → (α * β) ·ᵥ u ≡ α ·ᵥ (β ·ᵥ u)
        ·ᵥ-identity  : {u : 𝕍} → 𝟙 ·ᵥ u ≡ u
        distribᵥ-l   : {α : 𝕂} {u v : 𝕍} → α ·ᵥ (u +ᵥ v) ≡ α ·ᵥ u +ᵥ α ·ᵥ v 
        distribᵥ-r   : {α β : 𝕂} {u : 𝕍} → (α + β) ·ᵥ u ≡ α ·ᵥ u +ᵥ β ·ᵥ u 