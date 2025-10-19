#ARCHIVOS
#1
def contar_lineas(nombre_archivo:str)->int:
    file = open(nombre_archivo, 'r')
    res = len(file.readlines())
    file.close()
    return res

#print(contar_lineas("text.txt"))

def existe_palabra(palabra:str, nombre_archivo:str)->bool:
    file = open(nombre_archivo, 'r')
    lines = file.readlines()
    file.close()
    for line in lines:
        if palabra in line: return True
    return False

#print(existe_palabra("hola", "text.txt")) 


def count(line:str,word:str)->int:
    for i in range(0,len(line)+1):
        if word in line[:i]: return 1 + count(line[i:], word)
    return 0 


def cantidad_apariciones(palabra:str,nombre_archivo:str)->int:
    apariciones:int = 0
    file = open(nombre_archivo, 'r')
    lines = file.readlines()
    file.close()
    for line in lines: apariciones += count(line,palabra)
    return apariciones

#print(cantidad_apariciones("hola", "text.txt"))

#2

def iscoment(line:str):
    if line[0] == "#": return True
    elif line[0] == " ": return iscoment[1:]
    else: return False

def clonar_sin_comentarios(nombre_archivo:str):
    file = open(nombre_archivo, 'r')
    lines = file.readlines()
    file.close()

    file = open(nombre_archivo[:-4] + "_sin_comentar.txt", 'w')

    for line in lines:
        if not iscoment(line): file.write(line)

    file.close()

#clonar_sin_comentarios("text.txt")

#3
def invertir_lineas(nombre_archivo:str):
    file = open(nombre_archivo, 'r')
    lines = file.readlines()
    file.close()

    file = open("reverso.txt", 'w')
    for i in range(len(lines)-1,-1,-1): file.write(lines[i])
    file.close()

#invertir_lineas("text.txt")

#4
def agregar_frase_al_final(nombre_archivo:str,frase:str):

    file = open(nombre_archivo, 'r')
    lines = file.readlines()
    file.close()

    lines += [frase]

    file = open(nombre_archivo, 'w')
    for line in lines: file.write(line)
    file.close()

#agregar_frase_al_final("text.txt","hola como estass")

#5
def agregar_frase_al_principio(nombre_archivo:str,frase:str):

    file = open(nombre_archivo, 'r')
    lines = file.readlines()
    file.close()

    

    file = open(nombre_archivo, 'w')
    file.write(frase)
    for line in lines: file.write(line)
    file.close()

#agregar_frase_al_principio("text.txt","hola como estass")


#PILAS
#8
from queue import LifoQueue as Pila
import random 

def generar_nros_al_azar(cantidad:int, desde:int,hasta:int)->Pila:
    p = Pila()
    for _ in range(cantidad): p.put(random.randint(desde,hasta))
    return p

pila = generar_nros_al_azar(5,0,10)
#9
def elementos(p:Pila)->list:
    queue = []
    while not p.empty(): queue.append(p.get())
    for i in range(len(queue)-1,-1,-1): p.put(queue[i])
    return queue



def cantidad_elementos(p:Pila)->int:
    queue = elementos(p)
    return len(queue)

#print(pila.queue)
#print(cantidad_elementos(pila))
#print(pila.queue)

#10
def buscar_el_maximo(p:Pila)->int:
    queue = elementos(p)
    maximo:int = queue[0]
    for e in queue:
        if e > maximo: maximo = e
    return maximo 

#print(buscar_el_maximo(pila))

#11

def esta_bien_balanceada(s:str)->bool:
    p = Pila()
    parentesis_abiertos = 0

    for c in s:
        p.put(c)

    while not p.empty():
        last = p.get()
        if last == ")": parentesis_abiertos += 1
        if last == "(": parentesis_abiertos -= 1
        if parentesis_abiertos < 0: return False
    
    return parentesis_abiertos == 0

#print(esta_bien_balanceada("1 + ( 2 x 3 − ( 2 0 / 5 ) )"))
#print(esta_bien_balanceada("10 ∗ ( 1 + ( 2 ∗ ( −1)))"))
#print(esta_bien_balanceada("1 + (( 2 x 3 )")) 

#12

def evaluar_expresion(s:str)->float:
    
    element = ""
    tokens = []

    for e in s:
        if e == " ": 
            tokens.append(element)
            element = ""
        else: element += e
    tokens.append(element)

    p = Pila()
    print(tokens)
    for token in tokens:
        if token in ['+','-','/','*']:
            o2 = pila.get()
            o1 = pila.get()
            if token == "*": pila.put(o1 * o2)
            if token == "/": pila.put(o1 / o2)
            if token == "-": pila.put(o1 - o2)
            if token == "+": pila.put(o1 + o2)
        else: pila.put(int(token))   

    print(pila.get())     

#print(evaluar_expresion("3 4 + 5 * 2 -"))

#Colas 
from queue import Queue as Cola

#13
def cola_al_azar(cantidad:int,desde:int,hasta:int)->Cola:
    c = Cola()
    for _ in range(cantidad): c.put(random.randint(desde,hasta))
    return c

cola = cola_al_azar(5,0,10)
#print(cola.queue)

#14

def elementosC(c:Cola)->list:
    queue = []
    while not c.empty(): queue.append(c.get())
    for e in queue: c.put(e)
    return queue

#print(elementosC(cola))
#print(cola.queue)

def cantidad_elementosC(c:Cola)->int:
    queue = elementosC(cola)
    return len(queue)

#print(cantidad_elementosC(pila))

#15
def buscar_el_maximo(c:Cola[int])->int:
    pass

#16
def armar_secuencia_de_bingo()->Cola[int]:
    numeros = list(range(100))
    res = Cola()
    while len(numeros):
        numero = random.randint(0,len(numeros)-1)
        res.put(numeros.pop(numero))
    return res

def jugar_carton_de_bingo(carton:list[int],bolillero:Cola[int])->int:
    jugadas = 0
    marcados = 0
    while not bolillero.empty():
        jugadas += 1
        bolilla = bolillero.get()
        if bolilla in carton: marcados += 1
        if marcados == 12: return jugadas
    return jugadas

#muchos = [jugar_carton_de_bingo(range(12), armar_secuencia_de_bingo()) for _ in range(1000)]
#print(sum(muchos)/len(muchos))

#17
def n_pacientes_urgentes(c:Cola[(int, str, str)])->int:
    queue = elementosC(c)
    urgentes = 0
    for urgencia,nombre,especialidad in queue:
        if urgencia <= 3: urgentes += 1
    return urgentes

"""
pacientes = Cola()
pacientes.put((4,"",""))
pacientes.put((10,"",""))
pacientes.put((4,"",""))
pacientes.put((9,"",""))
print(n_pacientes_urgentes(pacientes))
"""
#18

def cola_copy(c:Cola)->Cola:
    queue = elementosC(c)
    res = Cola()
    for e in queue: res.put(e)
    return res 

def atencion_a_clientes(c:Cola[(str, int, bool, bool)])->Cola[(str, int, bool, bool)]:
    
    res = Cola()
    clientes = cola_copy(c)

    for _ in range(cantidad_elementosC(clientes)):    
        cliente = clientes.get()
        if cliente[2]: res.put(cliente)
        else: clientes.put(cliente)
    
    for _ in range(cantidad_elementosC(clientes)):    
        cliente = clientes.get()
        if cliente[3]: res.put(cliente)
        else: clientes.put(cliente)
    
    while not clientes.empty(): res.put(clientes.get())

    return res

"""  
clientes = Cola()
clientes.put(("",2,False,True))
clientes.put(("",3,False,False))
clientes.put(("",1,True,False))
clientes.put(("",0,True,True))

print(clientes.queue)
print(atencion_a_clientes(clientes).queue)
print(clientes.queue)
"""

#Diccionarios

#19 

def palabras(line:str)->list[str]:
    
    cola = Cola()
    palabra:str = ""

    res:list[str] = []

    for char in line: cola.put(char)

    while not cola.empty():
        letra = cola.get()
        if letra != " " and letra != "\n": palabra += letra
        elif palabra != "":
            res.append(palabra)
            palabra = ""
    
    if palabra != "": res.append(palabra)

    return res


def get(diccionario:dict,key,default):
    if key in diccionario.keys(): return diccionario[key]
    else: return default

#print(palabras("hola como  estas cha u"))

def agrupar_por_longitud(nombre_archivo:str)->dict:
    file = open(nombre_archivo, "r")
    lines = file.readlines()
    file.close()

    res = dict()

    for line in lines:
        for palabra in palabras(line):
            longitud:int = len(palabra)
            res[longitud] = get(res,longitud,0) + 1

    return res 

#print(agrupar_por_longitud("text.txt"))


#21

def la_palabra_mas_frecuente(nombre_archivo:str)->str:

    file = open(nombre_archivo, "r")
    lines = file.readlines()
    file.close()

    
    frecuencia_palabras = dict()

    res:str = ""
    maxima_frecuencia:int = 0

    for line in lines:
        for palabra in palabras(line):
            frecuencia_palabras[palabra] = get(frecuencia_palabras,palabra,0) + 1

    for palabra,frecuencia in frecuencia_palabras.items():
        if frecuencia >= maxima_frecuencia: 
            res = palabra
            maxima_frecuencia = frecuencia

    return res 

#print(la_palabra_mas_frecuente("text.txt"))

#22
def visitar_sitio(historiales:dict[str, Pila[str]],usuario:str,sitio:str):
    historial = get(historiales,usuario, Pila()) 
    historial.put(sitio)
    historiales[usuario] = historial

"""
historiales = dict()
visitar_sitio(historiales, "Buty", "exactas.uba")
visitar_sitio(historiales, "Formi", "aviones.com")
visitar_sitio(historiales, "Buty", "python.com")
print(historiales)
print(historiales["Buty"].queue)"""

def navegar_atras(historiales:dict[str, Pila[str]],usuario:str):
    historial = get(historiales,usuario, Pila())
    actual = historial.get()
    ultimo = historial.get()

    historial.put(ultimo)
    historial.put(actual)
    historial.put(ultimo)

    historiales[usuario] = historial

"""
historiales = {}
visitar_sitio(historiales, "Usuario1", "google.com")
visitar_sitio(historiales, "Usuario1", "facebook.com")
navegar_atras(historiales, "Usuario1")
visitar_sitio(historiales, "Usuario2", "youtube.com")

print(historiales["Usuario1"].queue)
"""
def agregar_producto(inventario, nombre:str, precio:float, cantidad:int):
    inventario[nombre] = {"Precio": precio, "Cantidad": cantidad}

def actualizar_stock(inventario,nombre:str,cantidad:int):
    inventario[nombre]["Cantidad"] = cantidad

def actualizar_precios(inventario,nombre:str,precio:float):
    inventario[nombre]["Precio"] = precio

def calcular_valor_inventario(inventario)->float:
    valor_inventario:int = 0
    for precio_cantidad in inventario.values(): 
        precio,cantidad  = precio_cantidad.values()
        valor_inventario += precio*cantidad
    return valor_inventario

"""
inventario = {}
agregar_producto(inventario, "Camisa", 20.0, 50)
agregar_producto(inventario, "Pantalon", 30.0, 30)
actualizar_stock(inventario, "Camisa", 10)
print(inventario)
valor_total = calcular_valor_inventario(inventario)
print("Valor total del inventario:", valor_total)
"""