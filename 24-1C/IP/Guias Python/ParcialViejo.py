#1
def get(dic:dict,key,default):
    if key in dic.keys(): return dic[key]
    else: return default

def minmax(nums:tuple[int,int], num:int)->tuple[int,int]:
    min:int
    max:int
    min,max = nums
    if min > num: min = num 
    if max < num: max = num
    return (min,max)

def stock_productos(sotck_cambios:list[(str,int)])->dict[(int,int)]:
    res:dict[(int,int)] = dict()
    for producto,cantidad in sotck_cambios:
        cantidades:tuple[int,int] = get(res, producto, (cantidad,cantidad))
        res[producto] = minmax(cantidades,cantidad)
    return res

#stock = [("comida",10),("shampoo",1),("comida",6),("insumos",2),("insumos",3)]
#print(stock_productos(stock))

#2

def ultimos3digitos(num:int)->int:
    return num - (num//1000)*1000

def esPrimo(num:int)->bool:
    for i in range(2,num):
        if not (num%i): return False
    return True

def filtrar_codigos_primos(codigos_barra:list[int])->list[int]:
    res:list[int] = []
    for codigo in codigos_barra:
        if esPrimo(ultimos3digitos(codigo)): res.append(codigo)
    return res

#codigos = [1002,11111312312011, 1004, 1101, 2304]
#print(filtrar_codigos_primos(codigos))

#3

from queue import Queue as Cola

def secuencia_mas_larga(tipos_pacientes_atendidos:list[int])->int:
    search:bool = True
    indexes:list[int] = []

    for i in range(len(tipos_pacientes_atendidos)):
        if (tipos_pacientes_atendidos[i] in ["perro","gato"]) == search:
            indexes.append(i)
            search = not search

    if not search: indexes.append(len(tipos_pacientes_atendidos))

    max_length:int = 0
    res:int

    for i in range(0,len(indexes),2):
        sub_length = indexes[i+1] - indexes[i]
        if sub_length > max_length:
            max_length = sub_length
            res = indexes[i]

    return res

#pacientes = ["perro","gato","perro","perro","pajaro","gato","perro","perro","perro","pajaro"]
#print(secuencia_mas_larga(pacientes))

#4
def transponer(matriz:list[list])->list[list]:
    rows = len(matriz)
    cols = len(matriz[0])
    res:list[list] = []

    for _ in range(cols): res.append([])

    for i in range(rows):
        for j in range(cols):
            res[j].append(matriz[i][j])
    return res

def equal_from_to(seq:list,a:int,b:int)->bool:
    for i in range(a,b):
        if seq[i] != seq[i+1]: return False
    return True

def un_responsable_por_turno(grilla_horaria: list[list[str]])->list[tuple[bool,bool]]:
    
    grilla_t:list[list[str]] = transponer(grilla_horaria)
    res:list[tuple[bool,bool]] = []

    for dia in grilla_t:
        turno_mañana:bool = equal_from_to(dia,0,3)
        turno_tarde:bool = equal_from_to(dia,4,7)
        res.append((turno_mañana,turno_tarde))
        
    return res


grilla = [["c","b"],["c","b"],["c","b"],["c","b"],["c","b"],["a","b"],["a","b"],["a","b"]]

print(un_responsable_por_turno(grilla))
print(transponer(grilla))
            



