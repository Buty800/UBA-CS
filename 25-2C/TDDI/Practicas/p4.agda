open import Data.Unit
       using (⊤; tt)
open import Data.Empty
       using (⊥; ⊥-elim)
open import Data.Bool
       using (Bool; true; false)
open import Data.Nat
       using (ℕ; zero; suc; _+_)
open import Data.Sum
       using (_⊎_; inj₁; inj₂)
open import Data.Product
       using (_×_; _,_; proj₁; proj₂; Σ-syntax)
open import Relation.Binary.PropositionalEquality
       using (_≡_; refl; sym; trans; cong)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning

-- Definimos la composición:
infixr 80 _∘_
_∘_ : {A B C : Set} → (B → C) → (A → B) → A → C
(g ∘ f) a = g (f a)

-- Parte A --

-- Recordemos la definición del tipo de datos de las listas:

data List (A : Set) : Set where
  []  : List A
  _∷_ : A → List A → List A

-- Recordemos la definición de algunas funciones básicas:

map : {A B : Set} → (A → B) → List A → List B
map f []       = []
map f (x ∷ xs) = f x ∷ map f xs

_++_ : {A : Set} → List A → List A → List A
[]       ++ ys = ys
(x ∷ xs) ++ ys = x ∷ (xs ++ ys)


-- A.1) Demostrar que map conmuta con la concatenación:
map-++ : {A B : Set} {f : A → B} {xs ys : List A}
       → map f (xs ++ ys) ≡ map f xs ++ map f ys
map-++ {A} {B} {f} {[]} {ys} = refl
map-++ {A} {B} {f} {x ∷ xs} {ys} = 
    begin 
        map f ((x ∷ xs) ++ ys)
    ≡⟨ refl ⟩
        f x ∷ map f (xs ++ ys)
    ≡⟨ cong (f x ∷_) (map-++ {A} {B} {f} {xs} {ys}) ⟩
       f x ∷ (map f xs ++ map f ys)
    ≡⟨ refl ⟩
        map f (x ∷ xs) ++ map f ys
    ∎ 



-- A.2) Demostrar que map conmuta con la composición:
map-∘ : {A B C : Set} {f : A → B} {g : B → C} {xs : List A}
       → map (g ∘ f) xs ≡ map g (map f xs)
map-∘ {A} {B} {C} {f} {g} {[]} = refl
map-∘ {A} {B} {C} {f} {g} {x ∷ xs} = 
    begin 
        map (g ∘ f) (x ∷ xs)
    ≡⟨ refl ⟩
        g (f x) ∷ map (g ∘ f) xs
    ≡⟨ cong (g (f x) ∷_) map-∘ ⟩
        g (f x) ∷ map g (map f xs)
    ≡⟨ refl ⟩
        map g ( f x ∷ map f xs)
    ≡⟨ refl ⟩
        map g (map f (x ∷ xs))
    ∎ 


-- Definimos el siguiente predicado que se verifica si un elemento
-- aparece en una lista:

_∈_ : {A : Set} → A → List A → Set
x ∈ []       = ⊥
x ∈ (y ∷ ys) = (x ≡ y) ⊎ (x ∈ ys)


-- A.3) Demostrar que si un elemento aparece en la concatenación de
-- dos listas, debe aparecer en alguna de ellas:

⊎-elim : {A B : Set} {C : A ⊎ B -> Set} -> ((a : A) -> C (inj₁ a)) -> ((b : B) -> C (inj₂ b)) -> (x : (A ⊎ B)) -> C x
⊎-elim f g (inj₁ x) = f x
⊎-elim f g (inj₂ x) = g x

∈-++ : ∀ {A : Set} {z : A} {xs ys : List A}
       → z ∈ (xs ++ ys)
       → (z ∈ xs) ⊎ (z ∈ ys) 
∈-++ {A} {z} {[]} {ys} p = inj₂ p
∈-++ {A} {z} {x ∷ xs} {ys} (inj₁ p) = inj₁ (inj₁ p)
∈-++ {A} {z} {x ∷ xs} {ys} (inj₂ p) = ⊎-elim {z ∈ xs} {z ∈ ys} (inj₁ ∘ inj₂) (inj₂) (∈-++ p)

-- A.4) Demostrar que si un elemento z aparece en una lista xs,
-- su imagen (f z) aparece en (map f xs):
∈-map : ∀ {A B : Set} {f : A → B} {z : A} {xs : List A}
        → z ∈ xs
        → f z ∈ map f xs
∈-map {A} {B} {f} {z} {[]} ()
∈-map {A} {B} {f} {z} {x ∷ xs} (inj₁ p) = inj₁ (cong f p)
∈-map {A} {B} {f} {z} {x ∷ xs} (inj₂ p) = inj₂ (∈-map p)


-- Definimos el siguiente predicado que se verifica si todos los
-- elementos de una lista son iguales:

todos-iguales : {A : Set} → List A → Set
todos-iguales []             = ⊤
todos-iguales (x ∷ [])       = ⊤
todos-iguales (x ∷ (y ∷ ys)) = (x ≡ y) × todos-iguales (y ∷ ys)

 
-- A.5) Demostrar:
todos-iguales-map : {A B : Set} {f : A → B} {xs : List A}
                  → todos-iguales xs
                  → todos-iguales (map f xs)
todos-iguales-map {A} {B} {f} {[]} _ = tt
todos-iguales-map {A} {B} {f} {x ∷ []} p = tt
todos-iguales-map {A} {B} {f} {x ∷ (y ∷ ys)} (e , i) = (cong f e , todos-iguales-map i)

 
-- Parte B --

-- Definimos siguiente el tipo de las equivalencias de tipos.
--
-- Nota: estrictamente hablando, usamos la condición que afirma
-- que la función "to" tiene una quasi-inversa y no que es una
-- equivalencia.

record _≃_ (A B : Set) : Set where
  field
    to      : A → B
    from    : B → A
    from∘to : (a : A) → from (to a) ≡ a
    to∘from : (b : B) → to (from b) ≡ b
open _≃_


~-refl : {A : Set} {B : A → Set} {f : (a : A) → B a} → (a : A) → f a ≡ f a
~-refl _ = refl



-- B.1) Demostrar que la equivalencia de tipos es reflexiva, simétrica y transitiva:
≃-refl : {A : Set} → A ≃ A
to      ≃-refl = λ a -> a 
from    ≃-refl = λ a -> a
from∘to ≃-refl = ~-refl
to∘from ≃-refl = ~-refl

≃-sym : ∀ {A B} → A ≃ B → B ≃ A
to      (≃-sym e) = from e
from    (≃-sym e) = to e
from∘to (≃-sym e) = to∘from e
to∘from (≃-sym e) = from∘to e

≃-trans : ∀ {A B C} → A ≃ B → B ≃ C → A ≃ C
to      (≃-trans a b) = to b ∘ to a 
from    (≃-trans a b) = from a ∘ from b
from∘to (≃-trans a b) = λ x -> 
    begin
        (from a ∘ from b) ((to b ∘ to a) x)
    ≡⟨ refl ⟩
        (from a) ((from b ∘ to b) ((to a) x))
    ≡⟨ cong (from a) (from∘to b ((to a) x)) ⟩
        (from a) ((to a) x)
    ≡⟨ from∘to a x ⟩
        x
    ∎ 
to∘from (≃-trans a b) = λ x -> 
        (to b ∘ to a) ((from a ∘ from b) x)
    ≡⟨ refl ⟩
        (to b) ((to a ∘ from a) ((from b) x))
    ≡⟨ cong (to b) (to∘from a ((from b) x)) ⟩
        (to b) ((from b) x)
    ≡⟨ to∘from b x ⟩
        x
    ∎ 

-- B.2) Demostrar que el producto de tipos es conmutativo, asociativo,
-- y que ⊤ es el elemento neutro:

×-comm : {A B : Set} → (A × B) ≃ (B × A)
to      ×-comm = λ (a , b) -> (b , a)
from    ×-comm = λ (b , a) -> (a , b)
from∘to ×-comm = ~-refl
to∘from ×-comm = ~-refl

×-assoc : {A B C : Set} → (A × (B × C)) ≃ ((A × B) × C)
to      ×-assoc = λ (a , (b , c)) -> ((a , b) , c)
from    ×-assoc = λ ((a , b) , c) -> (a , (b , c))
from∘to ×-assoc = ~-refl
to∘from ×-assoc = ~-refl

×-⊤-neut : {A : Set} → (A × ⊤) ≃ A
to      ×-⊤-neut = λ (a , _) -> a
from    ×-⊤-neut = λ a -> (a , tt)
from∘to ×-⊤-neut = ~-refl
to∘from ×-⊤-neut = ~-refl
 
-- B.3) Demostrar que la suma de tipos es conmutativa, asociativa,
-- y que ⊥ es el elemento neutro:

⊎-comm : {A B : Set} → (A ⊎ B) ≃ (B ⊎ A)
to      ⊎-comm = ⊎-elim inj₂ inj₁
from    ⊎-comm = ⊎-elim inj₂ inj₁
from∘to ⊎-comm = ⊎-elim ~-refl ~-refl
to∘from ⊎-comm = ⊎-elim ~-refl ~-refl


⊎-assoc : {A B C : Set} → (A ⊎ (B ⊎ C)) ≃ ((A ⊎ B) ⊎ C)
to      ⊎-assoc = ⊎-elim (inj₁ ∘ inj₁) (⊎-elim (inj₁ ∘ inj₂) inj₂)
from    ⊎-assoc = ⊎-elim (⊎-elim inj₁ (inj₂ ∘ inj₁)) (inj₂ ∘ inj₂) 
from∘to ⊎-assoc = ⊎-elim ~-refl (⊎-elim ~-refl ~-refl)
to∘from ⊎-assoc = ⊎-elim (⊎-elim ~-refl ~-refl) ~-refl 

⊎-⊥-neut : {A : Set} → (A ⊎ ⊥) ≃ A
to      ⊎-⊥-neut = ⊎-elim (λ a -> a) ⊥-elim
from    ⊎-⊥-neut = inj₁ 
from∘to ⊎-⊥-neut (inj₁ _) = refl 
to∘from ⊎-⊥-neut = ~-refl
 
-- B.5) Demostrar las siguientes "leyes exponenciales".
--
-- Nota:
-- Si leemos ⊥     como el cero 0,
--           ⊤     como el uno 1,
--           A ⊎ B como la suma A + B,
--           A × B como el producto A ∙ B,
--         y A → B como la potencia B ^ A,
-- las leyes dicen que:
--   A^0       = 1
--   A^1       = A
--   C^(A + B) = C^A ∙ C^B
--   C^(A ∙ B) = (C^B)^A

postulate fun-ext : {A : Set} {B : A → Set} {f g : (a : A) → B a}
                → ((a : A) → f a ≡ g a)
                → f ≡ g

exp-cero : {A : Set} → (⊥ → A) ≃ ⊤
to      exp-cero = λ _ -> tt
from    exp-cero = λ _ -> (λ ())
from∘to exp-cero =  λ _ -> fun-ext (λ ())
to∘from exp-cero = ~-refl
 

exp-uno : {A : Set} → (⊤ → A) ≃ A
to      exp-uno = λ f -> f tt
from    exp-uno = λ a _ -> a 
from∘to exp-uno = ~-refl
to∘from exp-uno = ~-refl 


exp-suma : {A B C : Set} → ((A ⊎ B) → C) ≃ ((A → C) × (B → C))
to      exp-suma f = ( f ∘ inj₁  , f ∘ inj₂ ) 
from    exp-suma = λ (f , g) -> ⊎-elim f g
from∘to exp-suma = λ _ -> fun-ext (⊎-elim ~-refl ~-refl)
to∘from exp-suma = ~-refl

exp-producto : {A B C : Set} → ((A × B) → C) ≃ (A → B → C)
to      exp-producto = λ f a b -> f (a , b)
from    exp-producto = λ f p -> f (proj₁ p) (proj₂ p)
from∘to exp-producto = ~-refl
to∘from exp-producto = ~-refl

-- B.5) Demostrar la generalización dependiente:

exp-producto-dep : {A : Set} {B : A → Set} {C : (a : A) → B a → Set}
                          → ((p : Σ[ a ∈ A ] B a) → C (proj₁ p) (proj₂ p))
                            ≃
                            ((a : A) (b : B a) → C a b)
to      exp-producto-dep = λ f a b -> f (a , b)
from    exp-producto-dep = λ f p -> f (proj₁ p) (proj₂ p)
from∘to exp-producto-dep = ~-refl
to∘from exp-producto-dep = ~-refl

-- Parte C --

-- En este ejercicio vamos a demostrar que un compilador
-- minimalista es correcto.

-- Una expresión aritmética es una constante o la suma de dos expresiones:

data Expr : Set where
  e-const : ℕ → Expr
  e-add   : Expr → Expr → Expr

-- Definimos una función para evaluar una expresión aritmética:

eval : Expr → ℕ
eval (e-const n)   = n
eval (e-add e₁ e₂) = eval e₁ + eval e₂

-- Definimos una máquina de pila con 2 instrucciones,
-- una para meter un elemento en la pila y otra para
-- sumar los dos elementos del tope de la pila. Si no
-- argumentos suficientes, la instrucción no tiene efecto.

data Instr : Set where
  i-push : ℕ → Instr
  i-add  : Instr

-- Un programa es una lista de instrucciones.
-- Definimos una función para ejecutar un programa
-- sobre una pila de números naturales:

run : List Instr → List ℕ → List ℕ
run []                stack             = stack
run (i-push n ∷ prog) stack             = run prog (n ∷ stack)
run (i-add ∷ prog)    []                = run prog []          -- (No hay argumentos suficientes).
run (i-add ∷ prog)    (n ∷ [])          = run prog (n ∷ [])    -- (No hay argumentos suficientes).
run (i-add ∷ prog)    (m ∷ (n ∷ stack)) = run prog ((n + m) ∷ stack)

-- Definimos el compilador como una función que recibe
-- una expresión aritmética y la convierte en una lista
-- de instrucciones:

compile : Expr → List Instr
compile (e-const n)   = i-push n ∷ []
compile (e-add e₁ e₂) = (compile e₁ ++ compile e₂) ++ (i-add ∷ [])

-- Demostrar que el compilador es correcto:

run-++ : ∀ {p q s} -> run (p ++ q) s ≡ run q (run p s)
run-++ {[]} {q} {s} = refl
run-++ {i-push x ∷ p} {q} {s} = {!   !}
run-++ {i-add ∷ p} {q} {s} = {!   !}





compile-correct : {e : Expr} {s : List ℕ} 
                → run (compile e) s ≡ eval e ∷ s
compile-correct {e-const x} = refl
    -- begin
    --     run (compile (e-const x)) []
    -- ≡⟨ cong (λ e -> run e []) (refl { x = compile (e-const x)}) ⟩
    --     run (i-push x ∷ []) []
    -- ≡⟨ refl ⟩
    --     run [] (x ∷ [])
    -- ≡⟨ refl ⟩
    --     (x ∷ [])
    -- ≡⟨ cong (_∷ []) refl ⟩
    --     eval (e-const x) ∷ []
    -- ∎ 
compile-correct {e-add e₁ e₂} {s} = {!   !} 
    -- begin 
    --     run (compile e₁ ++ compile e₂ ++ (i-add ∷ s)) s
    -- ≡⟨ {!   !} ⟩
    --     (eval (e-add e₁ e₂) ∷ [])
    -- ∎ 
    -- begin
    --     run (compile (e-add e₁ e₂)) []
    -- ≡⟨ cong (λ e -> run e []) (refl {x = compile (e-add e₁ e₂)}) ⟩
    --     run ((compile e₁ ++ compile e₂) ++ (i-add ∷ [])) []
    -- ≡⟨ {!   !} ⟩
    --     run ((eval e ∷ (eval e ∷ (i-add ∷ [])))) []
    -- ≡⟨ {!   !} ⟩
    --     (eval (e-add e₁ e₂) ∷ [])
    -- ∎ 

