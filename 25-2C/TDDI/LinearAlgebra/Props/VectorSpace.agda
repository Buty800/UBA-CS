open import Relation.Binary.PropositionalEquality using (_≡_; sym; trans; cong)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

open import LinearAlgebra.Field
open import LinearAlgebra.Props.Field
open import LinearAlgebra.VectorSpace

module LinearAlgebra.Props.VectorSpace
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕍 : Set ℓ′} 
    {vectorSpace𝕍 : VectorSpace fieldStruct 𝕍}
    where  

open VectorSpace vectorSpace𝕍
open Field fieldStruct 


+ᵥ-inverse-l : {u : 𝕍} → (-ᵥ u) +ᵥ u ≡ 𝟘ᵥ
+ᵥ-inverse-l = trans +ᵥ-comm +ᵥ-inverse-r


+ᵥ-identity-l :  {u : 𝕍} → 𝟘ᵥ +ᵥ u ≡ u 
+ᵥ-identity-l = trans +ᵥ-comm +ᵥ-identity-r

𝟘-absorbᵥ : {v : 𝕍} → 𝟘 ·ᵥ v ≡ 𝟘ᵥ 
𝟘-absorbᵥ {v} =
        𝟘 ·ᵥ v
    ≡⟨ sym +ᵥ-identity-r ⟩
        𝟘 ·ᵥ v +ᵥ 𝟘ᵥ
    ≡⟨ cong (𝟘 ·ᵥ v +ᵥ_) (sym +ᵥ-inverse-r)  ⟩
        𝟘 ·ᵥ v +ᵥ (𝟘 ·ᵥ v +ᵥ (-ᵥ (𝟘 ·ᵥ v)))
    ≡⟨ sym +ᵥ-assoc  ⟩
        (𝟘 ·ᵥ v +ᵥ 𝟘 ·ᵥ v) +ᵥ (-ᵥ (𝟘 ·ᵥ v))
    ≡⟨ cong (_+ᵥ (-ᵥ (𝟘 ·ᵥ v))) (sym distribᵥ-r) ⟩
        (𝟘 + 𝟘) ·ᵥ v +ᵥ (-ᵥ (𝟘 ·ᵥ v))
    ≡⟨ cong (_+ᵥ (-ᵥ (𝟘 ·ᵥ v))) (cong (_·ᵥ v) +-identity-r)⟩
        𝟘 ·ᵥ v +ᵥ (-ᵥ (𝟘 ·ᵥ v))
    ≡⟨  +ᵥ-inverse-r ⟩
        𝟘ᵥ
    ∎ 

𝟘ᵥ-absorbᵥ : {k : 𝕂} → k ·ᵥ 𝟘ᵥ ≡ 𝟘ᵥ 
𝟘ᵥ-absorbᵥ {k} =
        k ·ᵥ 𝟘ᵥ
    ≡⟨ sym +ᵥ-identity-r ⟩
        k ·ᵥ 𝟘ᵥ +ᵥ 𝟘ᵥ
    ≡⟨ cong (k ·ᵥ 𝟘ᵥ +ᵥ_) (sym +ᵥ-inverse-r)  ⟩
        k ·ᵥ 𝟘ᵥ +ᵥ (k ·ᵥ 𝟘ᵥ +ᵥ (-ᵥ (k ·ᵥ 𝟘ᵥ)))
    ≡⟨ sym +ᵥ-assoc  ⟩
        (k ·ᵥ 𝟘ᵥ +ᵥ k ·ᵥ 𝟘ᵥ) +ᵥ (-ᵥ (k ·ᵥ 𝟘ᵥ))
    ≡⟨ cong (_+ᵥ (-ᵥ (k ·ᵥ 𝟘ᵥ))) (sym distribᵥ-l) ⟩
        k ·ᵥ (𝟘ᵥ +ᵥ 𝟘ᵥ) +ᵥ (-ᵥ (k ·ᵥ 𝟘ᵥ))
    ≡⟨  cong (_+ᵥ (-ᵥ (k ·ᵥ 𝟘ᵥ))) (cong (k ·ᵥ_) +ᵥ-identity-r) ⟩
            k ·ᵥ 𝟘ᵥ +ᵥ (-ᵥ (k ·ᵥ 𝟘ᵥ))
    ≡⟨ +ᵥ-inverse-r ⟩
        𝟘ᵥ
    ∎
    
-ᵥ=*-1 : {v : 𝕍} → -ᵥ v ≡ (- 𝟙) ·ᵥ v 
-ᵥ=*-1 {v} =
        -ᵥ v
    ≡⟨ sym +ᵥ-identity-r ⟩
        (-ᵥ v) +ᵥ 𝟘ᵥ
    ≡⟨  cong ((-ᵥ v) +ᵥ_) (sym 𝟘-absorbᵥ) ⟩
        (-ᵥ v) +ᵥ (𝟘 ·ᵥ v)  
    ≡⟨ cong ((-ᵥ v) +ᵥ_) (cong (_·ᵥ v) (sym +-inverse-r)) ⟩
        (-ᵥ v) +ᵥ ((𝟙 + (- 𝟙)) ·ᵥ v)  
    ≡⟨ cong ((-ᵥ v) +ᵥ_) distribᵥ-r ⟩
        (-ᵥ v) +ᵥ (𝟙 ·ᵥ v +ᵥ (- 𝟙) ·ᵥ v)
    ≡⟨ sym +ᵥ-assoc ⟩
        ((-ᵥ v) +ᵥ 𝟙 ·ᵥ v) +ᵥ (- 𝟙) ·ᵥ v
    ≡⟨ cong (_+ᵥ (- 𝟙) ·ᵥ v) (cong ((-ᵥ v) +ᵥ_) ·ᵥ-identity) ⟩
        ((-ᵥ v) +ᵥ v) +ᵥ (- 𝟙) ·ᵥ v
    ≡⟨ cong (_+ᵥ (- 𝟙) ·ᵥ v) +ᵥ-inverse-l ⟩
        𝟘ᵥ +ᵥ (- 𝟙) ·ᵥ v
    ≡⟨ +ᵥ-identity-l ⟩
        (- 𝟙) ·ᵥ v 
    ∎