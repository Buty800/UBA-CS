open import Level using (Level; _⊔_) renaming (suc to sucₗ)

open import Relation.Nullary using (¬_)
open import Data.Product using (Σ-syntax; _×_; _,_; proj₁; proj₂)
open import Data.Sum using (_⊎_; inj₁; inj₂)

open import Data.Nat using (ℕ; zero; suc)
open import Data.Vec using (Vec; []; _∷_)

open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong; subst)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

postulate funext : {ℓ : Level} {A : Set ℓ} {B : A → Set ℓ} {f g : (a : A) → B a}
                → ((a : A) → f a ≡ g a)
                → f ≡ g

-- Cuerpo Algebraico 
record Field {ℓ : Level} : Set (sucₗ ℓ) where
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
        *-inverse-r     : {x : 𝕂} → ¬ (x ≡ 𝟘) → x * (x ⁻¹) ≡ 𝟙
        
        distrib-l       : {x y z : 𝕂} → x * (y + z) ≡ (x * y) + (x * z)

module Fields 
    {ℓ} {fieldStruct : Field {ℓ}} 
    where 
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

    𝟘-absorb-l : {x : 𝕂} → 𝟘 * x ≡ 𝟘 
    𝟘-absorb-l {x} = trans *-comm 𝟘-absorb-r

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


module VectorSpaces
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕍 : Set ℓ′} 
    (vectorSpace𝕍 : VectorSpace fieldStruct 𝕍)
    where  
    open VectorSpace vectorSpace𝕍
    open Field fieldStruct 
    open Fields {ℓ} {fieldStruct}

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

    intr-×-≡ : {A B : Set ℓ} { a₁ a₂ : A } { b₁ b₂ : B} → a₁ ≡ a₂ × b₁ ≡ b₂ → (a₁ , b₁) ≡ (a₂ , b₂) 
    intr-×-≡ (refl , refl) = refl 
    
    𝕂² : VectorSpace fieldStruct (𝕂 × 𝕂)
    VectorSpace.𝟘ᵥ              𝕂² = (𝟘 , 𝟘)
    VectorSpace._+ᵥ_            𝕂² = λ (x₁ , y₁) (x₂ , y₂) → (x₁ + x₂ , y₁ + y₂)
    VectorSpace._·ᵥ_             𝕂² = λ k (x , y) → (k * x , k * y)
    VectorSpace.-ᵥ              𝕂² = λ (x , y) → (- x , - y)
    VectorSpace.+ᵥ-comm         𝕂² = intr-×-≡ (+-comm , +-comm)
    VectorSpace.+ᵥ-assoc        𝕂² = intr-×-≡ (+-assoc , +-assoc)
    VectorSpace.+ᵥ-identity-r   𝕂² = intr-×-≡ (+-identity-r , +-identity-r)
    VectorSpace.+ᵥ-inverse-r    𝕂² = intr-×-≡ (+-inverse-r , +-inverse-r)
    VectorSpace.·ᵥ-assoc        𝕂² = intr-×-≡ ( *-assoc , *-assoc )
    VectorSpace.·ᵥ-identity     𝕂² = intr-×-≡ (*-identity-l , *-identity-l )
    VectorSpace.distribᵥ-l      𝕂² = intr-×-≡ ( distrib-l , distrib-l )
    VectorSpace.distribᵥ-r      𝕂² = intr-×-≡ ( distrib-r , distrib-r )

    intr-∷-≡ : {n : ℕ} {A : Set ℓ} { x y : A } { xs ys : Vec A n} → x ≡ y → xs ≡ ys → (x ∷ xs) ≡ (y ∷ ys) 
    intr-∷-≡ refl refl = refl  


    𝕂ⁿ : {n : ℕ} → VectorSpace fieldStruct (Vec 𝕂 n)  
    𝕂ⁿ {zero} .VectorSpace.𝟘ᵥ                   = []
    𝕂ⁿ {zero} .VectorSpace._+ᵥ_ _ _             = []
    𝕂ⁿ {zero} .VectorSpace._·ᵥ_ _ _             = []
    𝕂ⁿ {zero} .VectorSpace.-ᵥ_  _               = []
    𝕂ⁿ {zero} .VectorSpace.+ᵥ-comm              = refl
    𝕂ⁿ {zero} .VectorSpace.+ᵥ-assoc             = refl
    𝕂ⁿ {zero} .VectorSpace.+ᵥ-identity-r {[]}   = refl
    𝕂ⁿ {zero} .VectorSpace.+ᵥ-inverse-r         = refl
    𝕂ⁿ {zero} .VectorSpace.·ᵥ-assoc             = refl
    𝕂ⁿ {zero} .VectorSpace.·ᵥ-identity   {[]}   = refl
    𝕂ⁿ {zero} .VectorSpace.distribᵥ-l           = refl
    𝕂ⁿ {zero} .VectorSpace.distribᵥ-r           = refl

    𝕂ⁿ {suc n} .VectorSpace.𝟘ᵥ                      = 𝟘 ∷ 𝟘ₙ
        where 𝟘ₙ = VectorSpace.𝟘ᵥ (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace._+ᵥ_      (x ∷ xs) (y ∷ ys) = (x + y) ∷ (xs +ₙ ys)  
        where _+ₙ_ = VectorSpace._+ᵥ_ (𝕂ⁿ {n})  
    𝕂ⁿ {suc n} .VectorSpace._·ᵥ_ k    (x ∷ xs)          = (k * x) ∷ (k ·ₙ xs)
        where _·ₙ_ = VectorSpace._·ᵥ_ (𝕂ⁿ {n})  
    𝕂ⁿ {suc n} .VectorSpace.-ᵥ_       (x ∷ xs)          = (- x) ∷ (-ₙ xs)
        where -ₙ_ = VectorSpace.-ᵥ_ (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.+ᵥ-comm {x ∷ xs} {y ∷ ys}   = intr-∷-≡ +-comm +ₙ-comm
        where +ₙ-comm = VectorSpace.+ᵥ-comm (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.+ᵥ-assoc {x ∷ xs} {y ∷ ys} {z ∷ zs} = intr-∷-≡ +-assoc +ₙ-assoc
        where +ₙ-assoc = VectorSpace.+ᵥ-assoc (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.+ᵥ-identity-r {x ∷ xs}  = intr-∷-≡ +-identity-r +ₙ-identity-r
        where +ₙ-identity-r = VectorSpace.+ᵥ-identity-r (𝕂ⁿ {n}) 
    𝕂ⁿ {suc n} .VectorSpace.+ᵥ-inverse-r {x ∷ xs}   = intr-∷-≡ +-inverse-r +ₙ-inverse-r
        where +ₙ-inverse-r = VectorSpace.+ᵥ-inverse-r (𝕂ⁿ {n}) 
    𝕂ⁿ {suc n} .VectorSpace.·ᵥ-assoc {_} {_} {x ∷ xs} = intr-∷-≡ *-assoc ·ₙ-inverse-r
        where ·ₙ-inverse-r = VectorSpace.·ᵥ-assoc (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.·ᵥ-identity {x ∷ xs} = intr-∷-≡ *-identity-l ·ₙ-identity
        where ·ₙ-identity = VectorSpace.·ᵥ-identity (𝕂ⁿ {n}) 
    𝕂ⁿ {suc n} .VectorSpace.distribᵥ-l {_} {x ∷ xs} {y ∷ ys} = intr-∷-≡ distrib-l distribₙ-l
        where distribₙ-l = VectorSpace.distribᵥ-l (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.distribᵥ-r {_} {_} {x ∷ xs} = intr-∷-≡ distrib-r distribₙ-r
        where distribₙ-r = VectorSpace.distribᵥ-r (𝕂ⁿ {n})

module LinarMaps
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕍 𝕌 : Set ℓ′} 
    (vectorSpace𝕍 : VectorSpace fieldStruct 𝕍) (vectorSpace𝕌 : VectorSpace fieldStruct 𝕌)
    where  
    open VectorSpace vectorSpace𝕍
    open VectorSpace vectorSpace𝕌 using () renaming (
        _+ᵥ_            to _+ᵤ_         ;
        𝟘ᵥ              to 𝟘ᵤ           ; 
        _·ᵥ_             to _·ᵤ_         ; 
        -ᵥ_             to -ᵤ_          ;
        +ᵥ-comm         to +ᵤ-comm      ; 
        +ᵥ-assoc        to +ᵤ-assoc     ;
        +ᵥ-identity-r   to +ᵤ-identity-r;
        +ᵥ-inverse-r    to +ᵤ-inverse-r ;
        ·ᵥ-assoc         to ·ᵤ-assoc     ;
        ·ᵥ-identity      to ·ᵤ-identity  ;
        distribᵥ-l       to distribᵤ-l   ;
        distribᵥ-r       to distribᵤ-r   )
    open Field fieldStruct 
    open Fields {ℓ} {fieldStruct}
    open VectorSpaces vectorSpace𝕍 
    open VectorSpaces vectorSpace𝕌 using () renaming (𝟘-absorbᵥ to 𝟘-absorbᵤ)

    record Hom : Set (ℓ ⊔ ℓ′) where 
        field
            f : 𝕍 → 𝕌
            additivity : {k : 𝕂} {v w : 𝕍} → f (v +ᵥ w) ≡ f v +ᵤ f w  
            homogeneity : {k : 𝕂} {v : 𝕍} → f ( k ·ᵥ v ) ≡ k ·ᵤ f v  

    𝕍→𝕌 : VectorSpace fieldStruct (𝕍 → 𝕌)
    VectorSpace.𝟘ᵥ  𝕍→𝕌             = λ _ → 𝟘ᵤ
    VectorSpace._+ᵥ_ 𝕍→𝕌 f g        = λ v →  f v +ᵤ g v
    VectorSpace._·ᵥ_ 𝕍→𝕌  k f       = λ v →  k ·ᵤ f v
    VectorSpace.-ᵥ_ 𝕍→𝕌  f          = λ v → -ᵤ f v

    VectorSpace.+ᵥ-comm 𝕍→𝕌         = funext ( λ _ → +ᵤ-comm) 
    VectorSpace.+ᵥ-assoc 𝕍→𝕌        = funext ( λ _ → +ᵤ-assoc)
    VectorSpace.+ᵥ-identity-r 𝕍→𝕌   = funext ( λ _ → +ᵤ-identity-r)
    VectorSpace.+ᵥ-inverse-r 𝕍→𝕌    = funext ( λ _ → +ᵤ-inverse-r)
    VectorSpace.·ᵥ-assoc 𝕍→𝕌        = funext ( λ _ → ·ᵤ-assoc)
    VectorSpace.·ᵥ-identity 𝕍→𝕌     = funext ( λ _ → ·ᵤ-identity)
    VectorSpace.distribᵥ-l 𝕍→𝕌      = funext ( λ _ → distribᵤ-l)
    VectorSpace.distribᵥ-r 𝕍→𝕌      = funext ( λ _ → distribᵤ-r)


    𝟘→𝟘 : {h : Hom} → (Hom.f h) 𝟘ᵥ ≡ 𝟘ᵤ
    𝟘→𝟘 {record { f = f ; additivity = additivity ; homogeneity = homogeneity }} = 
            f 𝟘ᵥ
        ≡⟨ cong f (sym 𝟘-absorbᵥ)⟩
            f (𝟘 ·ᵥ 𝟘ᵥ) 
        ≡⟨ homogeneity ⟩
            𝟘 ·ᵤ f 𝟘ᵥ
        ≡⟨ 𝟘-absorbᵤ {f 𝟘ᵥ} ⟩
            𝟘ᵤ
        ∎ 

isProp : {ℓ : Level} → Set ℓ → Set ℓ
isProp A = {x y : A} → x ≡ y

isProp-≡ : {ℓ : Level} {A : Set ℓ} {x y : A} → isProp (x ≡ y)
isProp-≡ {ℓ} {A} {x} {y} {refl} {refl} = refl 

Pred : {l : Level} → Set l → Set (sucₗ l)
Pred {l} A = Σ[ f ∈ (A → Set l) ] ({a : A} → isProp (f a))

Sub : {l : Level} → (A : Set l) → Pred A → Set l
Sub A p = Σ[ v ∈ A ] (proj₁ p) v

transport : {l : Level} {A : Set l} (B : A → Set l) {x y : A} (p : x ≡ y) → B x → B y
transport _ refl b = b

Σ≡ : 
    {ℓ : Level} {A : Set ℓ} {B : A → Set ℓ} {a b : A} {p : B a} {q : B b} → 
    (eq : a ≡ b) → transport B eq p ≡ q → (a , p) ≡ (b , q)
Σ≡ refl refl = refl


record _≤_ {ℓ ℓ′ : Level} {fieldStruct : Field {ℓ}} {𝕍 : Set ℓ′} (p : Pred 𝕍) (vectorSpace𝕍 : VectorSpace fieldStruct 𝕍) : Set (ℓ ⊔ ℓ′) where 
        open VectorSpace vectorSpace𝕍 
        open Field fieldStruct 
        field
            +ᵥ-closed : {u v : 𝕍} → (proj₁ p) u → (proj₁ p) v → (proj₁ p) (u +ᵥ v) 
            ·ᵥ-closed : {k : 𝕂} {v : 𝕍} → (proj₁ p) v → (proj₁ p) (k ·ᵥ v)
            inhabited : Sub 𝕍 p 

module Subspaces 
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕍 : Set ℓ′}
    {p : Pred 𝕍}
    (vectorSpace𝕍 : VectorSpace fieldStruct 𝕍) 
    where
    open VectorSpace vectorSpace𝕍
    open VectorSpaces vectorSpace𝕍
    open Field fieldStruct 

    Subspace : (p ≤ vectorSpace𝕍) → VectorSpace fieldStruct (Sub 𝕍 p) 
    Subspace record {·ᵥ-closed = ·ᵥ-closed; inhabited = (_ , u) } .VectorSpace.𝟘ᵥ   = 
        (𝟘ᵥ , transport (proj₁ p) 𝟘-absorbᵥ (·ᵥ-closed u))
    Subspace record {+ᵥ-closed = +ᵥ-closed} .VectorSpace._+ᵥ_ =
        λ (v , p₁) (u , p₂) → (v +ᵥ u , +ᵥ-closed p₁ p₂)
    Subspace record { ·ᵥ-closed = ·ᵥ-closed } .VectorSpace._·ᵥ_ = 
        λ k (v , p') → (k ·ᵥ v , ·ᵥ-closed p')
    Subspace record { +ᵥ-closed = +ᵥ-closed ; ·ᵥ-closed = ·ᵥ-closed } .VectorSpace.-ᵥ_ = 
        λ (v , p') → (-ᵥ v , transport (proj₁ p) (sym -ᵥ=*-1) (·ᵥ-closed { - 𝟙} p'))
    Subspace _ .VectorSpace.+ᵥ-comm         = Σ≡ +ᵥ-comm (proj₂ p)
    Subspace _ .VectorSpace.+ᵥ-assoc        = Σ≡ +ᵥ-assoc (proj₂ p)
    Subspace _ .VectorSpace.+ᵥ-identity-r   = Σ≡ +ᵥ-identity-r (proj₂ p)
    Subspace _ .VectorSpace.+ᵥ-inverse-r    = Σ≡ +ᵥ-inverse-r (proj₂ p)
    Subspace _ .VectorSpace.·ᵥ-assoc        = Σ≡ ·ᵥ-assoc (proj₂ p)
    Subspace _ .VectorSpace.·ᵥ-identity     = Σ≡ ·ᵥ-identity (proj₂ p)
    Subspace _ .VectorSpace.distribᵥ-l      = Σ≡ distribᵥ-l (proj₂ p)
    Subspace _ .VectorSpace.distribᵥ-r      = Σ≡ distribᵥ-r (proj₂ p) 


    isZero : Pred 𝕍 
    isZero = ( (λ v -> v ≡ 𝟘ᵥ) , isProp-≡ )

    nullSubspace : isZero ≤ vectorSpace𝕍
    nullSubspace ._≤_.+ᵥ-closed {u} {v} u0 v0 = 
            u +ᵥ v
        ≡⟨ cong (u +ᵥ_) v0 ⟩
            u +ᵥ 𝟘ᵥ
        ≡⟨ +ᵥ-identity-r ⟩
            u
        ≡⟨ u0 ⟩
            𝟘ᵥ
        ∎ 
    nullSubspace ._≤_.·ᵥ-closed {k} {v} v0 = 
            k ·ᵥ v
        ≡⟨ cong (k ·ᵥ_) v0 ⟩
            k ·ᵥ 𝟘ᵥ
        ≡⟨ 𝟘ᵥ-absorbᵥ ⟩
            𝟘ᵥ
        ∎ 
    nullSubspace ._≤_.inhabited = ( 𝟘ᵥ , refl )
