module LinearAlgebra.Examples.Instances where

open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong; subst)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning
open import Data.Vec using (Vec; []; _∷_)
open import Data.Vec.Properties
open import Data.Nat using (ℕ; zero; suc)
open import Data.Product using (_×_; _,_; proj₁; proj₂)

open import LinearAlgebra.Field
import LinearAlgebra.Props.Field as FielProps
open import LinearAlgebra.VectorSpace
import LinearAlgebra.Props.VectorSpace as VectorSpaceProps
open import LinearAlgebra.Subspace
open import LinearAlgebra.LinearMap
import LinearAlgebra.Props.LinearMap as LinearMapProps
open import LinearAlgebra.Utils

--Ejemplos de instancias de las diferentes definiciones que fuimos dando 

module Lists 
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕍 : Set ℓ′} 
    {vectorSpace𝕍 : VectorSpace fieldStruct 𝕍}
    where
    
    open Field fieldStruct
    open FielProps {fieldStruct = fieldStruct}
    open VectorSpace vectorSpace𝕍

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
    𝕂ⁿ {suc n} .VectorSpace.+ᵥ-comm {x ∷ xs} {y ∷ ys}   = ∷-cong +-comm +ₙ-comm
        where +ₙ-comm = VectorSpace.+ᵥ-comm (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.+ᵥ-assoc {x ∷ xs} {y ∷ ys} {z ∷ zs} = ∷-cong +-assoc +ₙ-assoc
        where +ₙ-assoc = VectorSpace.+ᵥ-assoc (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.+ᵥ-identity-r {x ∷ xs}  = ∷-cong +-identity-r +ₙ-identity-r
        where +ₙ-identity-r = VectorSpace.+ᵥ-identity-r (𝕂ⁿ {n}) 
    𝕂ⁿ {suc n} .VectorSpace.+ᵥ-inverse-r {x ∷ xs}   = ∷-cong +-inverse-r +ₙ-inverse-r
        where +ₙ-inverse-r = VectorSpace.+ᵥ-inverse-r (𝕂ⁿ {n}) 
    𝕂ⁿ {suc n} .VectorSpace.·ᵥ-assoc {_} {_} {x ∷ xs} = ∷-cong *-assoc ·ₙ-inverse-r
        where ·ₙ-inverse-r = VectorSpace.·ᵥ-assoc (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.·ᵥ-identity {x ∷ xs} = ∷-cong *-identity-l ·ₙ-identity
        where ·ₙ-identity = VectorSpace.·ᵥ-identity (𝕂ⁿ {n}) 
    𝕂ⁿ {suc n} .VectorSpace.distribᵥ-l {_} {x ∷ xs} {y ∷ ys} = ∷-cong distrib-l distribₙ-l
        where distribₙ-l = VectorSpace.distribᵥ-l (𝕂ⁿ {n})
    𝕂ⁿ {suc n} .VectorSpace.distribᵥ-r {_} {_} {x ∷ xs} = ∷-cong distrib-r distribₙ-r
        where distribₙ-r = VectorSpace.distribᵥ-r (𝕂ⁿ {n})


module Functions  
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕌 𝕍 : Set ℓ′} 
    {vectorSpace𝕌 : VectorSpace fieldStruct 𝕌} {vectorSpace𝕍 : VectorSpace fieldStruct 𝕍}
    where
    open VectorSpace vectorSpace𝕍

    _↛_ : VectorSpace fieldStruct (𝕌 → 𝕍)
    VectorSpace.𝟘ᵥ  (_↛_)            = λ _ → 𝟘ᵥ
    VectorSpace._+ᵥ_ (_↛_)f g        = λ v →  f v +ᵥ g v
    VectorSpace._·ᵥ_ (_↛_) k f       = λ v →  k ·ᵥ f v
    VectorSpace.-ᵥ_ (_↛_) f          = λ v → -ᵥ f v
    VectorSpace.+ᵥ-comm (_↛_)        = funext ( λ _ → +ᵥ-comm) 
    VectorSpace.+ᵥ-assoc (_↛_)       = funext ( λ _ → +ᵥ-assoc)
    VectorSpace.+ᵥ-identity-r (_↛_)  = funext ( λ _ → +ᵥ-identity-r)
    VectorSpace.+ᵥ-inverse-r (_↛_)   = funext ( λ _ → +ᵥ-inverse-r)
    VectorSpace.·ᵥ-assoc (_↛_)       = funext ( λ _ → ·ᵥ-assoc)
    VectorSpace.·ᵥ-identity (_↛_)    = funext ( λ _ → ·ᵥ-identity)
    VectorSpace.distribᵥ-l (_↛_)     = funext ( λ _ → distribᵥ-l)
    VectorSpace.distribᵥ-r (_↛_)     = funext ( λ _ → distribᵥ-r)

module nullTransform 
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕌 𝕍 : Set ℓ′} 
    {vectorSpace𝕌 : VectorSpace fieldStruct 𝕌} {vectorSpace𝕍 : VectorSpace fieldStruct 𝕍}
    where
    open VectorSpace vectorSpace𝕍
    open VectorSpaceProps {vectorSpace𝕍 = vectorSpace𝕍}
    open VectorSpace vectorSpace𝕌 using () renaming 
        ( 𝟘ᵥ to 𝟘ᵤ; 
        _·ᵥ_ to _·ᵤ_; 
        _+ᵥ_ to _+ᵤ_)

    
    f𝟘 : 𝕌 → 𝕍
    f𝟘 _ = 𝟘ᵥ

    h𝟘 : Hom vectorSpace𝕌 vectorSpace𝕍
    Hom.f           h𝟘  = f𝟘
    Hom.additivity  h𝟘  = sym +ᵥ-identity-r
    Hom.homogeneity h𝟘  = sym 𝟘ᵥ-absorbᵥ
        where open Hom h𝟘



module nullSubspace
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} {𝕍 : Set ℓ′} 
    {vectorSpace𝕍 : VectorSpace fieldStruct 𝕍}
    where

    open Field fieldStruct
    open VectorSpace vectorSpace𝕍  
    open VectorSpaceProps {vectorSpace𝕍 = vectorSpace𝕍}

    private 
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

module kerSubspace
    {ℓ ℓ′} {fieldStruct : Field {ℓ}} 
    {𝕌 𝕍 : Set ℓ′} 
    {vectorSpace𝕌 : VectorSpace fieldStruct 𝕌} {vectorSpace𝕍 : VectorSpace fieldStruct 𝕍}
    {h : Hom vectorSpace𝕌 vectorSpace𝕍}
    where 

    open Hom h 
    open VectorSpace vectorSpace𝕍
    open VectorSpace vectorSpace𝕌 using () renaming 
        ( 𝟘ᵥ to 𝟘ᵤ; 
        _·ᵥ_ to _·ᵤ_; 
        _+ᵥ_ to _+ᵤ_)
    open LinearMapProps {h = h}
    open VectorSpaceProps {vectorSpace𝕍 = vectorSpace𝕍}

    KernelSubspace : Ker h ≤ vectorSpace𝕌
    KernelSubspace ._≤_.+ᵥ-closed {u} {v} u0 v0 = 
            f (u +ᵤ v)
        ≡⟨ additivity ⟩
            f u +ᵥ f v
        ≡⟨ cong (f u +ᵥ_) v0 ⟩
            f u +ᵥ 𝟘ᵥ
        ≡⟨ +ᵥ-identity-r ⟩
            f u 
        ≡⟨ u0 ⟩
            𝟘ᵥ
        ∎ 
    KernelSubspace ._≤_.·ᵥ-closed {k} {v} v0 = 
            f (k ·ᵤ v)
        ≡⟨ homogeneity ⟩
            k ·ᵥ f v 
        ≡⟨ cong (k ·ᵥ_) v0 ⟩
            k ·ᵥ 𝟘ᵥ
        ≡⟨ 𝟘ᵥ-absorbᵥ ⟩
            𝟘ᵥ
        ∎ 
    KernelSubspace ._≤_.inhabited = (𝟘ᵤ , 𝟘ᵥ-preservation )

