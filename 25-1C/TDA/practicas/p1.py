def ss(k:int,l:list[int],curr=[]):
    if k < 0: return []
    if not l: return [curr] if not k else [] 
    x = l.pop()
    return ss(k,l[:],curr[:]) + ss(k-x,l[:],curr[:]+[x])
    
def validate(n:int,curr:list[int]=[]):
    mnum = (n**3 + n) /2
    for _ in range((n**2)-len(curr)): curr.append(0)
    
    psum = 0
    
    for i in range(n):
        psum = 0
        for j in range(n):
            num = curr[n*i+j]
            if not num: break
            psum += num
            if psum > mnum: return False
        else:
            if psum != mnum: return False

    for j in range(n):
        psum = 0
        for i in range(n):
            num = curr[n*i+j]
            if not num: break
            psum += num
            if psum > mnum: return False
        else:
            if psum != mnum: return False

    psum = 0    
    for i in range(n):
        num = curr[n*i+i]
        if not num: break
        psum += num
        if psum > mnum: return False
    else:
        if psum != mnum: return False

    psum = 0
    for i in range(n):
        num = curr[(n-1)*(i+1)]
        if not num: break
        psum += num
        if psum > mnum: return False
    else:
        if psum != mnum: return False

    return True
        
def magisq(n:int,curr:list[int]=[]):
    if not validate(n,curr[:]): return [] 
    if len(curr) == n**2: return [curr]
    res = []
    for i in range(1,(n**2)+1):
        if i not in curr: res += magisq(n,curr+[i])
    return res 

print(magisq(3))

#8
mem = {}
def ce(i,j,C):
    m = float("inf")
    
    for c in C:
        if not i<c<j:continue
        if not (i,c) in mem: mem[(i,c)] = ce(i,c,C)
        if not (c,j) in mem: mem[(c,j)] = ce(c,j,C)
        l = mem[(i,c)]
        r = mem[(c,j)]
        if m > l+r: m = l+r
    
    if m == float("inf"): return 0
    
    return (j-i) + m
    
def ce_bottom_up(n, C):
    # Agregamos los extremos del palo y ordenamos los cortes
    cuts = [0] + sorted(C) + [n]
    m = len(cuts)
    
    # Tabla DP: dp[i][j] es el costo mínimo de cortar entre cuts[i] y cuts[j]
    dp = [[0] * m for _ in range(m)]
    
    # Recorremos por longitud del subsegmento
    for length in range(2, m):  # mínimo 2 porque se necesita al menos dos extremos
        for i in range(m - length):
            j = i + length
            dp[i][j] = float('inf')
            # Probamos todos los cortes entre i y j
            for k in range(i + 1, j):
                cost = dp[i][k] + dp[k][j] + (cuts[j] - cuts[i])
                dp[i][j] = min(dp[i][j], cost)
    
    return dp[0][m-1]

def tv(grid,v=(0,0)):
    i,j = v
    r,c = len(grid),len(grid[0])
    
    minP = float("inf")
    
    if i+1<r:
        p = tv(grid,(i+1,j)) 
        if minP>p:minP =p
    if j+1<c:
        p = tv(grid,(i,j+1)) 
        if minP>p:minP =p
    
    if minP == float("inf"): minP = 1

    return max(1,minP - grid[i][j])

def tv_top_d(grid):
    r,c = len(grid),len(grid[0])
    dp = [[float("inf")]*c for _ in range(r)]
    dp[-1][-1] = -grid[-1][-1] if grid[-1][-1] < 0 else 0
    for i in range(r-1,-1,-1):
        for j in range(c-1,-1,-1):
            t = grid[i][j]
            if i+1<r: dp[i][j] = min(dp[i+1][j]-t,dp[i][j])
            if j+1<c: dp[i][j] = min(dp[i][j+1]-t,dp[i][j])
            if dp[i][j] < 0: dp[i][j] = 0
    print(dp)
    return dp[0][0]+1
            

def pc(w,s):

    def validate(parcial):
        wp = []
        sp = []
        for i,b in enumerate(parcial):
            if not b: continue
            for j in range(len(wp)): wp[j]+=w[i]
            wp.append(w[i])
            sp.append(s[i])
        
        for i in range(1,len(wp)):
            if sp[i-1] < wp[i]: return False
        return True 
    
    def backtrack(parcial):
        if not validate(parcial[:]): return 0
        if len(parcial) == len(w): return parcial.count(1)
        return max(backtrack(parcial+[1]),backtrack(parcial+[0]))

    return backtrack([])    


#21 
def ie(n,e):

    def comp(s,w):
        for v in s:
            for a,b in e:
                if a==v and b in w: return False
                if b==v and a in w: return False
        return True
    

    def backtrak(s,w):
        res = set()
        if not comp(s,w): return res
        if not w: return s

        for u in w:
            next = backtrak(s|{u},w-{u})
            if len(next) > len(res): res = next 
        
        return res   

    return backtrak(set(),set(range(1,n+1)))

