open import Relation.Binary.PropositionalEquality using (_≡_; sym; trans; cong)
import Relation.Binary.PropositionalEquality as Eq
open import LinearAlgebra.Field
open Eq.≡-Reasoning

module LinearAlgebra.Props.Field {ℓ} {fieldStruct : Field {ℓ}} where
open Field fieldStruct

 
*-identity-l : {x : 𝕂} → 𝟙 * x ≡ x
*-identity-l {x} = trans *-comm *-identity-r

distrib-r : {x y z : 𝕂} → (y + z) * x ≡ (y * x) + (z * x)
distrib-r {x} {y} {z} =
        (y + z) * x
    ≡⟨ *-comm ⟩
        x * (y + z)
    ≡⟨ distrib-l ⟩
        (x * y) + (x * z)
    ≡⟨ cong ((x * y) +_) *-comm ⟩
        (x * y) + (z * x)
    ≡⟨ cong (_+ (z * x)) *-comm ⟩
        (y * x) + (z * x)
    ∎ 

𝟘-absorb-r : {x : 𝕂} → x * 𝟘 ≡ 𝟘  
𝟘-absorb-r {x} =
        x * 𝟘
    ≡⟨ sym +-identity-r ⟩
        x * 𝟘 + 𝟘
    -- ≡⟨ cong ((x * 𝟘) +_ ) (sym +-inverse-r) ⟩
        {!   !}
    ≡⟨ {!   !} ⟩
        x + (- x)
    ≡⟨ +-inverse-r ⟩
    --     x * 𝟘 + (x * 𝟘 + (-(x * 𝟘)))
    -- ≡⟨ sym +-assoc ⟩
    --     (x * 𝟘 + x * 𝟘) + (-(x * 𝟘))
    -- ≡⟨ cong (_+ (-(x * 𝟘))) (sym distrib-l)⟩
    --     x * (𝟘 + 𝟘) + (-(x * 𝟘))
    -- ≡⟨ cong (_+ (-(x * 𝟘))) (cong (x *_) +-identity-r)  ⟩
    --     x * 𝟘 + (-(x * 𝟘))
    -- ≡⟨ +-inverse-r ⟩
        𝟘
    ∎ 

-- 𝟘-absorb-l : {x : 𝕂} → 𝟘 * x ≡ 𝟘 
-- 𝟘-absorb-l {x} = trans *-comm 𝟘-absorb-r
