open import Level using (Level; _⊔_; suc; zero)
open import Relation.Nullary
    using (¬_)
open import Relation.Binary.PropositionalEquality
       using (_≡_; refl; sym; trans; cong)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning
open import Data.Product using (_×_; _,_)

postulate funext : {ℓ : Level} {A : Set ℓ} {B : A → Set ℓ} {f g : (a : A) → B a}
                → ((a : A) → f a ≡ g a)
                → f ≡ g

-- Cuerpo Algebraico 
record Field {ℓ : Level} : Set (suc ℓ) where
    infixr 40 _+_
    infixr 50 _*_
    field
        𝕂       : Set ℓ
        _+_ _*_ : 𝕂 → 𝕂 → 𝕂
        𝟘 𝟙     : 𝕂
        -_  _⁻¹ : 𝕂 → 𝕂   

        +-assoc         : {x y z : 𝕂} → (x + y) + z ≡ x + (y + z)
        +-comm          : {x y : 𝕂} → x + y ≡ y + x
        +-identity-r    : {x : 𝕂} → x + 𝟘 ≡ x
        +-inverse-r     : {x : 𝕂} → x + (- x) ≡ 𝟘
        
        *-assoc         : {x y z : 𝕂} → (x * y) * z ≡ x * (y * z)
        *-comm          : {x y : 𝕂} → x * y ≡ y * x
        *-identity-r    : {x : 𝕂} → x * 𝟙 ≡ x
        *-inverse-r     : {x : 𝕂} → ¬ (x ≡ 𝟘) → x + (x ⁻¹) ≡ 𝟙
        
        distrib-l       : {x y z : 𝕂} → x * (y + z) ≡ (x * y) + (x * z)

record VectorSpace {ℓ ℓ′} (fieldStruct : Field {ℓ}) (𝕍 : Set ℓ′) : Set (ℓ ⊔ ℓ′) where
    open Field fieldStruct
    infixr 40 _+ᵥ_
    infixr 50 _·_
    field
        𝟘ᵥ  : 𝕍

        _+ᵥ_ : 𝕍 → 𝕍 → 𝕍 
        _·_  : 𝕂 → 𝕍 → 𝕍
        -ᵥ_ : 𝕍 → 𝕍

        +ᵥ-comm     : {u v : 𝕍} → u +ᵥ v ≡ v +ᵥ u 
        +ᵥ-assoc    : {u v w : 𝕍} → (u +ᵥ v) +ᵥ w ≡ u +ᵥ (v +ᵥ w)
        +ᵥ-identity-r : {u : 𝕍} → u +ᵥ 𝟘ᵥ ≡ u 
        +ᵥ-inverse-r : {u : 𝕍} → u +ᵥ (-ᵥ u) ≡ 𝟘ᵥ

        ·-assoc     : {α β : 𝕂} {u : 𝕍} → α · (β · u) ≡ (α * β) · u
        ·-identity  : {u : 𝕍} → 𝟙 · u ≡ u
        distrib-l   : {α : 𝕂} {u v : 𝕍} → α · (u +ᵥ v) ≡ α · u +ᵥ α · v 
        distrib-r   : {α β : 𝕂} {u : 𝕍} → (α + β) · u ≡ α · u +ᵥ β · u 


module LinearAlgebra 
    {ℓ ℓ′} (fieldStruct : Field {ℓ} ) 
    (𝕍 𝕌 : Set ℓ′) 
    (vectorSpace𝕍 : VectorSpace fieldStruct 𝕍) (vectorSpace𝕌 : VectorSpace fieldStruct 𝕌)
    where  
    open VectorSpace vectorSpace𝕍  using () renaming (
        _·_         to _·ᵥ_             ;
        distrib-l   to distribᵥ-l ; 
        distrib-r   to distribᵥ-r )
    open VectorSpace vectorSpace𝕌 using () renaming (
        _+ᵥ_            to _+ᵤ_         ;
        𝟘ᵥ              to 𝟘ᵤ           ; 
        _·_             to _·ᵤ_         ; 
        -ᵥ_             to -ᵤ_          ;
        +ᵥ-comm         to +ᵤ-comm      ; 
        +ᵥ-assoc        to +ᵤ-assoc     ;
        +ᵥ-identity-r   to +ᵤ-identity-r;
        +ᵥ-inverse-r    to +ᵤ-inverse-r ;
        ·-assoc         to ·ᵤ-assoc     ;
        ·-identity      to ·ᵤ-identity  ;
        distrib-l       to distribᵤ-l   ;
        distrib-r       to distribᵤ-r   )
    open Field fieldStruct 

    *-identity-l : {x : 𝕂} → 𝟙 * x ≡ x
    *-identity-l {x} = 
            𝟙 * x
        ≡⟨ *-comm ⟩
            x * 𝟙
        ≡⟨ *-identity-r ⟩
            x
        ∎ 

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
        ≡⟨ cong ((x * 𝟘) +_ ) (sym +-inverse-r) ⟩
            x * 𝟘 + (x * 𝟘 + (-(x * 𝟘)))
        ≡⟨ sym +-assoc ⟩
            (x * 𝟘 + x * 𝟘) + (-(x * 𝟘))
        ≡⟨ cong (_+ (-(x * 𝟘))) (sym distrib-l)⟩
            x * (𝟘 + 𝟘) + (-(x * 𝟘))
        ≡⟨ cong (_+ (-(x * 𝟘))) (cong (x *_) +-identity-r)  ⟩
            x * 𝟘 + (-(x * 𝟘))
        ≡⟨ +-inverse-r ⟩
            𝟘
        ∎ 
 
    𝕍→𝕌 : VectorSpace fieldStruct (𝕍 → 𝕌)
    VectorSpace.𝟘ᵥ  𝕍→𝕌             = λ _ → 𝟘ᵤ
    VectorSpace._+ᵥ_ 𝕍→𝕌 f g        = λ v →  f v +ᵤ g v
    VectorSpace._·_ 𝕍→𝕌  k f        = λ v →  k ·ᵤ f v
    VectorSpace.-ᵥ_ 𝕍→𝕌  f          = λ v → -ᵤ f v

    VectorSpace.+ᵥ-comm 𝕍→𝕌         = funext ( λ _ → +ᵤ-comm) 
    VectorSpace.+ᵥ-assoc 𝕍→𝕌        = funext ( λ _ → +ᵤ-assoc)
    VectorSpace.+ᵥ-identity-r 𝕍→𝕌   = funext ( λ _ → +ᵤ-identity-r)
    VectorSpace.+ᵥ-inverse-r 𝕍→𝕌    = funext ( λ _ → +ᵤ-inverse-r)
    VectorSpace.·-assoc 𝕍→𝕌         = funext ( λ _ → ·ᵤ-assoc)
    VectorSpace.·-identity 𝕍→𝕌      = funext ( λ _ → ·ᵤ-identity)
    VectorSpace.distrib-l 𝕍→𝕌       = funext ( λ _ → distribᵤ-l)
    VectorSpace.distrib-r 𝕍→𝕌       = funext ( λ _ → distribᵤ-r)


    intr-×-≡ : {A B : Set ℓ} { a₁ a₂ : A } { b₁ b₂ : B} → a₁ ≡ a₂ × b₁ ≡ b₂ → (a₁ , b₁) ≡ (a₂ , b₂) 
    intr-×-≡ (refl , refl) = refl 
    
    𝕂² : VectorSpace fieldStruct (𝕂 × 𝕂)
    VectorSpace.𝟘ᵥ              𝕂² = (𝟘 , 𝟘)
    VectorSpace._+ᵥ_            𝕂² = λ (x₁ , y₁) (x₂ , y₂) → (x₁ + x₂ , y₁ + y₂)
    VectorSpace._·_             𝕂² = λ k (x , y) → (k * x , k * y)
    VectorSpace.-ᵥ              𝕂² = λ (x , y) → (- x , - y)
    VectorSpace.+ᵥ-comm         𝕂² = intr-×-≡ (+-comm , +-comm)
    VectorSpace.+ᵥ-assoc        𝕂² = intr-×-≡ (+-assoc , +-assoc)
    VectorSpace.+ᵥ-identity-r   𝕂² = intr-×-≡ (+-identity-r , +-identity-r)
    VectorSpace.+ᵥ-inverse-r    𝕂² = intr-×-≡ (+-inverse-r , +-inverse-r)
    VectorSpace.·-assoc         𝕂² = intr-×-≡ ({!   !} , {!   !})
    VectorSpace.·-identity      𝕂² = intr-×-≡ (*-identity-l , *-identity-l)
    VectorSpace.distrib-l       𝕂² = intr-×-≡ ({!   !} , {!   !})
    VectorSpace.distrib-r       𝕂² = {!   !}

    

    

    

