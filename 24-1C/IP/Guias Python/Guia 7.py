#Parte 1
#1
def pertence(s:[int],e:int)->bool:
    longitud:int = len(s) - 1
    while longitud >= 0:
        if s[longitud] == e: return True
        longitud -= 1
    return False 

#print(pertence(range(5),5))

#2
def divide_a_todos(s:[int],e:int)->bool:
    longitud:int = len(s) - 1
    while longitud >= 0:
        if s[longitud]%e: return False
        longitud -= 1
    return True

#print(divide_a_todos([2*i for i in range(5)],2))

#3 
def suma_total(s:[int])->int:
    longitud:int = len(s) - 1
    suma:int = 0
    while longitud >= 0:
        suma += s[longitud]
        longitud -= 1
    return suma

#print(suma_total(range(5)))

#4 
def ordenados(s:[int])->bool:
    longitud:int = len(s) - 1
    while longitud >= 1:
        if s[longitud] <= s[longitud-1]: return False
        longitud -= 1
    return True

#print(ordenados(range(5)))

#5
def palabra_larga(s:[str])->bool:
    for word in s: 
        if len(word) > 7: return True
    return False

#print(palabra_larga(["su","b"]))

#6
def palaindromo(s:str)->bool:
    indice:int = 0
    longitud:int = len(s) - 1
    while indice <= longitud:
        if s[indice] != s[longitud-indice]: return False
        indice += 1
    return True

#print(palaindromo("hoaoh"))

#7

def tienemayuscula(s:str)->bool:
    for c in s: 
        if 'A' <= c <= 'Z': return True
        return False

def tieneminuscula(s:str)->bool:
    for c in s: 
        if 'a' <= c <= 'z': return True
    return False

def tienedigitos(s:str)->bool:
    for c in s:
        if '0' <= c <= '9': return True
    return False


def fortaleza(pw:str)->str:
    if len(pw) < 5:
        return "ROJA"
    elif tieneminuscula(pw) and tienemayuscula(pw) and tienedigitos(pw) and (len(pw)>8):
        return "VERDE"
    else:
        return "AMARILLA" 

#print(fortaleza("des"))

#8
def saldo(movs:(str,int))->int:
    saldo_actual:int = 0
    for tipo,monto in movs:
        if tipo == "I": saldo_actual += monto
        if tipo == "R": saldo_actual -= monto
    return saldo_actual

#print(saldo([("I",2000), ("R", 20),("R", 1000),("I", 300)]))

#9
def minusculas3(s:str)->bool:
    minusculas:int = 0
    s = set(s)
    for letra in s:
        if 'z' >= letra >= 'a': minusculas += 1
        if minusculas == 3: return True
    return False

#print(minusculas3("hoo"))

#Parte 2
#1
def zeroInOutEven(s:[int])->None:
    for i in range(0,len(s),2): s[i] = 0

#seq = [1,2,3]
#zeroInOutEven(seq)
#print(seq)

#2
def zeroInEven(s:[int])->[int]:
    out:[int] = s.copy()
    for i in range(0,len(s),2): out[i] = 0
    return out

#seq = [1,2,3]
#print(zeroInEven(seq))
#print(seq)

#3

def sacarVocales(s:str)->str:
    vocales:str = "aeiouAEIOU"
    out = str()
    for c in s:
        if not pertence(vocales, c): out+=c
    return out

#print(sacarVocales("HOLAhola"))

#4
def remplazarVocales(s:str)->str:
    vocales:str = "aeiouAEIOU"
    out = str()
    for c in s:
        if pertence(vocales, c): out+="-"
        else: out+=c
    return out

#print(remplazarVocales("HOLAhola"))

#5

def da_vuelta_str(s:str)->str:
    out:str = ""
    for i in range(len(s)-1,-1,-1):
        out+=s[i]
    return out

#print(da_vuelta_str("hola"))

#6

def eliminar_repetidos(s:str)->str:
    out:str = ""
    for c in s:
        if not pertence(out,c): out+=c
    return out

#print(eliminar_repetidos("holaholahola"))

#parte 3

def aprobado(notas:[int])->int:
    promedio:int = 0
    for nota in notas:
        if nota < 4: return 3
        promedio += nota
    promedio /= len(notas)
    if promedio >= 7: return 1
    else: return 2

#print(aprobado([1,10,10]))

#parte 4

#1
def lista_de_alumnos() -> None:
    
    nuevo_alumno = str()
    alumnos:[str] = []

    while True: 
        nuevo_alumno = input("ingrese el nombre del alumno: ")
        
        if nuevo_alumno != "listo": alumnos += [nuevo_alumno]
        else: break

    print(alumnos)
    return alumnos

#lista_de_alumnos()

#2
def historial_monedero() -> None:
    historial:[(str,int)] = []
    operacion = str()

    while True:
        operacion = input("ingrese la operacion: ")
        if operacion == "X": break
        elif operacion == "C" or operacion == "D": historial += [(operacion, input("ingrese el monto: "))]
    
    print(historial)
    return historial

#historial_monedero()

#3
import random

def sieteYmedio():

    cartas:[int] = [1,2,3,4,5,6,7,10,11,12]
    historial_cartas:[int] = []
    suma_cartas:int = 0

    while True:
        historial_cartas += [random.choice(cartas)]
        suma_cartas += historial_cartas[-1] if historial_cartas[-1] < 10 else 0.5

        if suma_cartas > 7.5:
            print("perdiste") 
            break

        if input("sacar otra carta?: ") == "No": 
            print("ganaste")
            break 
    
    print(historial_cartas)

#sieteYmedio()

#parte 5

#1 y 2
def pertenece_a_cada_uno(s:[[int]], e:int, res:[bool])->None:
    res.clear()
    for seq in s: res.append(pertence(seq,e))

#a = [1,2,3,4]
#pertenece_a_cada_uno([range(5),[1,1,1,1],[1,2,3]],2,a)
#print(a)

def es_matriz(s:[[int]])->bool:
    if len(s) == 0 or len(s[0]) == 0: return False
    for f in s: 
        if len(s[0]) != len(f): return False
    return True

#print(es_matriz([[1,5],[2,3],[1,2]]))

def filas_ordenadas(m:[[int]], res:[bool])->None:
    res.clear()
    for f in m: res.append(ordenados(f))

#a = [1,2,3,4]
#filas_ordenadas([[1,2,1],[1,1,1],[1,2,4]],a)
#print(a)

#5
import numpy as np

def matrizDalaP(d:int, p:int)->np.matrix:
    m = np.random.randint(low=0,high=100,size=(d,d))
    print(m)

    res = m.copy()
    inter = m.copy()

    for _ in range(p-1):
        for i in range(d):
            for j in range(d):
                inter[i][j] = suma_total([res[i][k] * m[k][j] for k in range(d)])
        res = inter.copy()

    return res

print(matrizDalaP(100,5))