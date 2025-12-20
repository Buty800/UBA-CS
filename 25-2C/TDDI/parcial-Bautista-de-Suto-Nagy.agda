open import Data.Product using (_×_; _,_; proj₁; proj₂; Σ-syntax)
open import Data.Sum using (_⊎_; inj₁; inj₂)
open import Relation.Binary.PropositionalEquality using (_≡_ ;refl; cong; sym)

import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

infix  4 _~_
infixl 5 _U_
infixl 6 _∙_
infix  7 _*

-- El siguiente tipo de datos sirve para representar palabras en el alfabeto {0, 1}.
-- Por ejemplo, cons1 (cons1 (cons0 [])) represnta la cadena "110".
data Word : Set where
  []    : Word
  cons0 : Word → Word
  cons1 : Word → Word

-- Concatenación de palabras:
_++_ : Word -> Word -> Word
[]       ++ w2 = w2
cons0 w1 ++ w2 = cons0 (w1 ++ w2)
cons1 w1 ++ w2 = cons1 (w1 ++ w2)

-- El siguiente tipo de datos sirve para representar expresiones regulares en el alfabeto {0, 1}.
-- [Nota: el símbolo "∙" típicamente se puede ingresar tecleando "\."].
data RE : Set where
  ∅    : RE            -- Denota el lenguaje vacío.
  m[]  : RE            -- Denota el lenguaje que tiene sólo a la cadena vacía.
  m0   : RE            -- Denota el lenguaje que tiene sólo a la cadena "0".
  m1   : RE            -- Denota el lenguaje que tiene sólo a la cadena "1".
  _U_  : RE → RE → RE  -- (R U S) denota la unión de los lenguajes denotados por R y S.
  _∙_  : RE → RE → RE  -- (R ∙ S) denota la concatenación de los lenguajes denotados por R y S.
  _*   : RE → RE       -- (R *) denota la clausura de Kleene del lenguaje denotado por R.

-- El predicado (Match R w) está habitado cuando w está en el lenguaje denotado por R.
data Match : RE → Word → Set where
  Match-[] : Match m[] []
  Match-0  : Match m0 (cons0 [])
  Match-1  : Match m1 (cons1 [])
  Match-U1 : {R S : RE} {w : Word}
           → Match R w
           → Match (R U S) w
  Match-U2 : {R S : RE} {w : Word}
           → Match S w
           → Match (R U S) w
  Match-∙  : {R S : RE} {w1 w2 : Word}
           → Match R w1
           → Match S w2
           → Match (R ∙ S) (w1 ++ w2)
  Match-*1 : {R : RE} → Match (R *) []
  Match-*2 : {R : RE} {w1 w2 : Word}
           → Match R w1
           → Match (R *) w2
           → Match (R *) (w1 ++ w2)

---

-- Ejercicio 1: demostrar que la expresión regular (m0 U m1)* matchea a cualquier palabra.
-- Sugerencia: proceder por inducción en w.
lenguaje-completo : {w : Word} → Match ((m0 U m1) *) w
lenguaje-completo {[]} = Match-*1
lenguaje-completo {cons0 w} = Match-*2 (Match-U1 Match-0) lenguaje-completo
lenguaje-completo {cons1 w} = Match-*2 (Match-U2 Match-1) lenguaje-completo

---

-- Decimos que dos expresiones regulares son equivalentes si denotan el mismo lenguaje,
-- es decir, matchean las mismas palabras.
_~_ : RE → RE → Set
R ~ S = (w : Word) → ((Match R w → Match S w) × (Match S w → Match R w))

-- Ejercicio 2: demostrar que _~_ es una relación de equivalencia.

~-refl : {R : RE} → R ~ R
~-refl w = (λ m → m) , (λ m → m)

~-sym : {R S : RE} → R ~ S → S ~ R
~-sym r~s w = proj₂ (r~s w) , proj₁ (r~s w)

_∘_ : {A B C : Set} → (A → B) → (C → A) → (C → B)
(f ∘ g) x = f (g x) 

~-trans : {R S T : RE} → R ~ S → S ~ T → R ~ T
~-trans r~s s~t w = (proj₁ (s~t w)) ∘ (proj₁ (r~s w)) , (proj₂ (r~s w)) ∘ (proj₂ (s~t w)) 

----

-- Ejercicio 3: demostrar que la unión es conmutativa y asociativa
-- y que el vacío es el elemento neutro.

U-comm : {R S : RE} → R U S ~ S U R
U-comm w = (λ { (Match-U1 p) → Match-U2 p
              ; (Match-U2 p) → Match-U1 p
              })
         , (λ { (Match-U1 p) → Match-U2 p
              ; (Match-U2 p) → Match-U1 p
              })

U-assoc : {R S T : RE} → (R U S) U T ~ R U (S U T)
U-assoc w = (λ { (Match-U1 (Match-U1 m)) → Match-U1 m
              ;  (Match-U1 (Match-U2 m)) → Match-U2 (Match-U1 m)
              ;  (Match-U2 m)            → Match-U2 (Match-U2 m)
              }) 
          , (λ {(Match-U1 m) → Match-U1 (Match-U1 m)
              ; (Match-U2 (Match-U1 m)) → Match-U1 (Match-U2 m)
              ; (Match-U2 (Match-U2 m)) → Match-U2 m 
              })
                  
U-neut : {R : RE} → R U ∅ ~ R
U-neut {R} w = (λ {(Match-U1 m) → m} ), (λ m → Match-U1 m)

----

-- Ejercicio 4: demostrar que la concatenación es asociativa
-- y que el lenguaje que incluye sólo a la palabra vacía es el elemento neutro.
-- Para hacer este ejercicio puede ser necesario probar lemas auxiliares
-- sobre la concatenación de palabras y usar transportes.

transport : {A : Set} (B : A → Set) {x y : A} (p : x ≡ y) → B x → B y
transport _ refl b = b

++asoc : {x y z : Word} → (x ++ y) ++ z ≡ x ++ (y ++ z)
++asoc {[]} {y} {z} = refl
++asoc {cons0 x} {y} {z} = cong cons0 (++asoc {x})
++asoc {cons1 x} {y} {z} = cong cons1 (++asoc {x})

∙-assoc : {R S T : RE} → (R ∙ S) ∙ T ~ R ∙ (S ∙ T)
∙-assoc {R} {S} {T} w = (λ {(Match-∙ {w2 = w3} (Match-∙ {w1 = w1} {w2 = w2} m n) l) → 
                            transport  (Match (R ∙ (S ∙ T))) (sym (++asoc {w1} {w2} {w3}))
                            (Match-∙ m (Match-∙ n l))
                      }) 
                      , (λ {(Match-∙ {w1 = w1} m (Match-∙ {w1 = w2} {w2 = w3} n l)) → 
                            transport  (Match (R ∙ S ∙ T)) (++asoc {w1} {w2} {w3})
                            (Match-∙ (Match-∙ m n) l) 
                      }) 

++id : {w : Word} → w ++ [] ≡ w 
++id {[]} = refl
++id {cons0 w} = cong cons0 ++id
++id {cons1 w} = cong cons1 ++id

∙-neut : {R : RE} → R ∙ m[] ~ R
∙-neut {R} w =  (λ {(Match-∙ m Match-[]) → transport (Match R) (sym ++id) m} ) 
            ,   (λ m → transport (Match (R ∙ m[])) ++id (Match-∙ m Match-[]))


----

-- La siguiente operación invierte una palabra.
reverse : Word → Word
reverse []        = []
reverse (cons0 w) = reverse w ++ cons0 []
reverse (cons1 w) = reverse w ++ cons1 []

-- Ejercicio 5: definir una expresión regular que reconozca el reverso del lenguaje original,
-- es decir, vale (Match R w) si y sólo si vale (Match (rev R) (reverse w))
rev : RE → RE
rev ∅       = ∅
rev m[]     = m[]
rev m0      = m0
rev m1      = m1
rev (R U S) = rev R U rev S
rev (R ∙ S) = (rev S) ∙ (rev R)
rev (R *)   = (rev R) *

-- Ejercicio 6: demostrar que el lenguaje de (rev R) incluye el reverso de todas las palabras de R.
-- Sugerencia: proceder por inducción en la derivación de (Match R w).
-- Para hacer este ejercicio puede ser necesario probar lemas auxiliares sobre palabras
-- y usar transportes.

reverse-lema : {w1 w2 : Word} → reverse (w1 ++ w2) ≡ reverse w2 ++ reverse w1
reverse-lema {[]} {w2} = 
    reverse ([] ++ w2)
  ≡⟨ cong reverse {w2} refl ⟩
    reverse w2
  ≡⟨ sym ++id ⟩
    reverse w2 ++ reverse []
  ∎ 
reverse-lema {cons0 w1} {w2} =
    reverse (cons0 w1 ++ w2)
  ≡⟨ refl ⟩
    reverse (w1 ++ w2) ++ cons0 []
  ≡⟨ cong (_++ cons0 []) (reverse-lema {w1} {w2}) ⟩
    (reverse w2 ++ reverse w1) ++ cons0 []
  ≡⟨ ++asoc {reverse w2} ⟩
    reverse w2 ++ reverse (cons0 w1)
  ∎ 
reverse-lema {cons1 w1} {w2} = 
    reverse (cons1 w1 ++ w2)
  ≡⟨ refl ⟩
    reverse (w1 ++ w2) ++ cons1 []
  ≡⟨ cong (_++ cons1 []) (reverse-lema {w1} {w2}) ⟩
    (reverse w2 ++ reverse w1) ++ cons1 []
  ≡⟨ ++asoc {reverse w2} ⟩
    reverse w2 ++ reverse (cons1 w1)
  ∎ 

*-comm : {R : RE} {w1 w2 : Word} → Match (R *) w1 → Match R w2 → Match (R *) (w1 ++ w2)
*-comm {R} {w1} {w2} Match-*1 m =
  transport (Match (R *)) ++id (Match-*2 m Match-*1)
*-comm {R} {w2 = w3} (Match-*2 {w1 = w1} {w2 = w2} p q) m = 
  transport (Match (R *)) (sym (++asoc {w1})) (Match-*2 p (*-comm q m))


match-rev : {R : RE} {w : Word} → Match R w → Match (rev R) (reverse w)
match-rev Match-[]       = Match-[]
match-rev Match-0        = Match-0
match-rev Match-1        = Match-1
match-rev (Match-U1 p)   = Match-U1 (match-rev p)
match-rev (Match-U2 p)   = Match-U2 (match-rev p)
match-rev (Match-∙ {R} {S} {w1} {w2} p q)  = 
  transport (Match (rev (R ∙ S))) (sym (reverse-lema {w1} {w2})) (Match-∙ (match-rev q) (match-rev p)) 
match-rev Match-*1       = Match-*1 
match-rev (Match-*2 {R} {w1} {w2} p q) = 
 transport (Match (rev (R *))) (sym (reverse-lema {w1})) (*-comm (match-rev q) (match-rev p))


