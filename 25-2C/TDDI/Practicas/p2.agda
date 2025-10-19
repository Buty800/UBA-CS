----
---- Práctica 2: Naturales e igualdad
----

open import Data.Empty using (⊥; ⊥-elim)
open import Data.Bool using (Bool; true; false)
open import Data.Nat using (ℕ; zero; suc)
open import Data.Product using (_,_; Σ-syntax)
open import Relation.Binary.PropositionalEquality using (_≡_; refl; sym; trans; cong)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

infixl 20 _+_
infixl 30 _*_

---- Parte A ----

-- Considerar las siguientes definiciones de la suma y el producto:

_+_ : ℕ → ℕ → ℕ
zero  + b = b
suc a + b = suc (a + b)

_*_ : ℕ → ℕ → ℕ
zero  * _ = zero
suc a * b = b + a * b

-- A.1) Demostrar que la suma es asociativa.
+-assoc : {a b c : ℕ} → (a + b) + c ≡ a + (b + c)
+-assoc {zero} {b} {c}  = refl 
+-assoc {suc a} {b} {c} = cong suc (+-assoc {a}) 


-- A.2) Demostrar que la suma es conmutativa.
-- Sugerencia: demostrar lemas auxiliares que prueben que:
--   a + zero = a
--   a + suc b = suc (a + b)

+-identity : {n : ℕ} -> n + 0 ≡ n 
+-identity {zero}   = refl
+-identity {suc n}  = cong suc +-identity

+-suc : {a b : ℕ} -> suc (a + b) ≡ a + suc b 
+-suc {zero} {b}  = refl 
+-suc {suc a} {b} = cong suc +-suc 

+-comm : {a b : ℕ} → a + b ≡ b + a
+-comm {zero} {b}   = trans refl (sym +-identity)
+-comm {suc a} {b}  = begin 
    suc (a + b) ≡⟨ cong suc (+-comm {a}) ⟩ 
    suc (b + a) ≡⟨ +-suc ⟩  
    b + suc a ∎   

-- A.3) Demostrar que el producto distribuye sobre la suma (a izquierda).
 
*-+-distrib-l : {a b c : ℕ} → (a + b) * c ≡ a * c + b * c
*-+-distrib-l {zero} {b} {c}    = refl
*-+-distrib-l {suc a} {b} {c}   = begin 
    (suc a + b) * c     ≡⟨ refl ⟩  
    c + (a + b) * c     ≡⟨ cong (c +_) (*-+-distrib-l {a}) ⟩ 
    c + (a * c + b * c) ≡⟨ sym (+-assoc {c}) ⟩ 
    (c + a * c) + b * c ∎

  
-- A.4) Demostrar que el producto es asociativo:
 
*-assoc : {a b c : ℕ} → (a * b) * c ≡ a * (b * c)
*-assoc {zero} {b} {c} = refl
*-assoc {suc a} {b} {c} = begin 
        suc a * b * c       ≡⟨ refl ⟩ 
        (b + a * b) * c     ≡⟨ *-+-distrib-l {b} ⟩ 
        b * c + (a * b) * c ≡⟨ cong (b * c +_) (*-assoc {a}) ⟩ 
        b * c + a * (b * c) ≡⟨ refl ⟩ 
        suc a * (b * c) ∎


-- A.5) Demostrar que el producto es conmutativo.
-- Sugerencia: demostrar lemas auxiliares que prueben que:
--   a * zero = zero
--   a * suc b = a + a * b

 
*-absorb : {n : ℕ} -> n * 0 ≡ 0
*-absorb {zero} = refl
*-absorb {suc n} = begin
    suc n * 0   ≡⟨ refl ⟩ 
    n * 0       ≡⟨ *-absorb {n} ⟩ 
    0 ∎ 
 
*-suc : {a b : ℕ} -> a * suc b ≡ a + a * b 
*-suc {zero} {b} = refl
*-suc {suc a} {b} = begin
    suc a * suc b       ≡⟨ refl ⟩ 
    suc (b + a * suc b) ≡⟨ +-suc ⟩ 
    b + suc (a * suc b) ≡⟨ cong (λ n -> b + suc n ) (*-suc {a}) ⟩ 
    b + suc (a + a * b) ≡⟨ cong (b +_) refl ⟩ 
    b + (suc a + a * b) ≡⟨ sym (+-assoc {b}) ⟩ 
    (b + suc a) + a * b ≡⟨ cong (_+ a * b) (+-comm {b}) ⟩ 
    (suc a + b) + a * b ≡⟨ +-assoc {suc a} ⟩ 
    suc a + (b + a * b) ≡⟨ refl ⟩ 
    suc a + suc a * b ∎
 
*-comm : {a b : ℕ} → a * b ≡ b * a
*-comm {zero} {b} = begin
    0 * b   ≡⟨ refl ⟩ 
    0       ≡⟨ sym (*-absorb {b}) ⟩ 
    b * 0 ∎
*-comm {suc a} {b} = begin
    suc a * b   ≡⟨ refl ⟩ 
    b + a * b    ≡⟨ cong ( b +_) (*-comm {a})⟩ 
    b + b * a   ≡⟨ sym (*-suc {b}) ⟩ 
    b * suc a ∎

-- A.6) Demostrar que el producto distribuye sobre la suma (a derecha).
-- Sugerencia: usar la conmutatividad y la distributividad a izquierda.
*-+-distrib-r : {a b c : ℕ} → a * (b + c) ≡ a * b + a * c
*-+-distrib-r {a} {b} {c} = begin
        a * (b + c)     ≡⟨ *-comm {a}⟩ 
        (b + c) * a     ≡⟨ *-+-distrib-l {b} ⟩
        b * a + c * a   ≡⟨ cong (_+ c * a) (*-comm {b}) ⟩
        a * b + c * a   ≡⟨ cong (a * b +_ ) (*-comm {c}) ⟩ 
        a * b + a * c ∎
 
 
--------------------------------------------------------------------------------

---- Parte B ----

-- Considerar la siguiente definición del predicado ≤ que dados dos números
-- naturales devuelve la proposición cuyos habitantes son demostraciones de que
-- n es menor o igual que m, y la siguiente función ≤? que dados dos
-- números naturales devuelve un booleano que indica si n es menor o igual que
-- n.

_≤_ : ℕ → ℕ → Set
n ≤ m = Σ[ k ∈ ℕ ] k + n ≡ m

_≤?_ : ℕ → ℕ → Bool
zero  ≤? m     = true
suc _ ≤? zero  = false
suc n ≤? suc m = n ≤? m

-- B.1) Demostrar que la función es correcta con respecto a su especificación.
-- Sugerencia: seguir el esquema de inducción con el que se define la función _≤?_.

≤-mono-suc : {n m : ℕ} -> n ≤ m -> suc n ≤ suc m 
≤-mono-suc {n} {m} (k , e) = k , trans (sym +-suc) (cong suc e)
    
≤?-correcta : {n m : ℕ} → (n ≤? m) ≡ true → n ≤ m
≤?-correcta  {zero} {m} _ = m , +-identity
≤?-correcta  {suc n} {zero} () 
≤?-correcta  {suc n} {suc m} e = ≤-mono-suc (≤?-correcta {n} {m} e)


-- B.2) Demostrar que es imposible que el cero sea el sucesor de algún natural:

zero-no-es-suc : {n : ℕ} → suc n ≡ zero → ⊥
zero-no-es-suc ()


-- B.3) Demostrar que la función es completa con respecto a su especificación.
-- Sugerencia: seguir el esquema de inducción con el que se define la función _≤?_.
-- * Para el caso en el que n = suc n' y m = zero, usar el ítem B.2 y propiedades de la suma.
-- * Para el caso en el que n = suc n' y m = suc m', recurrir a la hipótesis inductiva y propiedades de la suma.

suc-inj : {a b : ℕ} -> suc a ≡ suc b -> a ≡ b 
suc-inj refl = refl

≤-pred : {n m : ℕ} → suc n ≤ suc m → n ≤ m
≤-pred {n} {m} (k , e) = k , suc-inj ( suc (k + n) ≡⟨ +-suc ⟩ e)

≤?-completa : {n m : ℕ} → n ≤ m → (n ≤? m) ≡ true
≤?-completa {zero} {_} _ = refl 
≤?-completa {suc n} {zero} (k , e) = ⊥-elim (zero-no-es-suc (suc (k + n) ≡⟨ +-suc ⟩ e))
≤?-completa {suc n} {suc m} p = ≤?-completa (≤-pred p)
 
--------------------------------------------------------------------------------

---- Parte C ----

-- La siguiente función corresponde al principio de inducción en naturales:

indℕ : (C : ℕ → Set)
       (c0 : C zero)
       (cS : (n : ℕ) → C n → C (suc n))
       (n : ℕ)
       → C n
indℕ C c0 cS zero    = c0
indℕ C c0 cS (suc n) = cS n (indℕ C c0 cS n)

-- Definimos el predicado de "menor estricto" del siguiente modo:
_<_ : ℕ → ℕ → Set
n < m = suc n ≤ m


-- C.1) Demostrar el principio de inducción completa, que permite recurrir a la hipótesis
-- inductiva sobre cualquier número estrictamente menor.
 
<-zero-bottom : {C : ℕ -> Set} -> (n : ℕ) -> n < 0 -> C n 
<-zero-bottom n (k , e) = ⊥-elim (zero-no-es-suc (suc (k + n) ≡⟨ +-suc ⟩ e))

ind-completa : (C : ℕ → Set)
               (f : (n : ℕ) → ((m : ℕ) → m < n → C m) → C n)
               (n : ℕ)
               → C n
ind-completa C f n = f n (indℕ D <-zero-bottom D-suc n)
    where 
        D : ℕ -> Set 
        D n = (m : ℕ) -> m < n -> C m 

        D-suc : (n : ℕ) 
            -> ((m : ℕ) -> m < n -> C m)     -- D n 
            -> ((m : ℕ) -> m < suc n -> C m) -- D (suc n)
        D-suc n HI m (zero , refl) = f n HI
        D-suc n HI m (suc k , refl) = HI m (k , refl)


--------------------------------------------------------------------------------

---- Parte D ----

-- D.1) Usando pattern matching, definir el principio de inducción sobre la
-- igualdad:

ind≡ : {A : Set}
       {C : (a b : A) → a ≡ b → Set}
     → ((a : A) → C a a refl)
     → (a b : A) (p : a ≡ b) → C a b p
ind≡ f a _ refl = f a


-- D.2) Demostrar nuevamente la simetría de la igualdad, usando ind≡:

sym' : {A : Set} {a b : A} → a ≡ b → b ≡ a
sym' {A} {a} {b} = ind≡ {A} { λ a b p -> b ≡ a } (λ _ -> refl ) a b


-- D.3) Demostrar nuevamente la transitividad de la igualdad, usando ind≡:

trans' : {A : Set} {a b c : A} → a ≡ b → b ≡ c → a ≡ c
trans' {A} {a} {b} {c} = ind≡ {A} { λ a b p -> b ≡ c -> a ≡ c } ( λ _ p -> p ) a b

-- D.4) Demostrar nuevamente que la igualdad es una congruencia, usando ind≡:

cong' : {A B : Set} {a b : A} → (f : A → B) → a ≡ b → f a ≡ f b
cong' {A} {B} {a} {b} f =  ind≡ {A} { λ a b p -> f a ≡ f b } (λ _ -> refl) a b 