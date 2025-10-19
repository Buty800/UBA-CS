

def validate(curr):
    ndiag = set()
    pdiag = set()
    for i,q in enumerate(curr):
        ndiag.add(q-i)
        pdiag.add(q+i)
    return len(ndiag) == len(pdiag) == len(curr)

def nqueens(n:int,curr:list[int]=[]):
    if not validate(curr[:]): return [] 
    if len(curr) == n: return [curr]
    res = []
    for i in range(n):
        if i not in curr: res += nqueens(n,curr+[i])
    return res 

print(nqueens(9))