def  max_PL(N,P):

    def f(i=N-1,j=N-1):
        p = 0
        l = i+j-1
        
        if i > 0:
            pp,lp = f(i-1,j)
            if pp >= p:
                p = pp
                l = min(lp,l)
        if j > 0:
            pp,lp = f(i,j-1)
            if pp >= p:
                p = pp
                l = min(lp,l)
        if i > 0 and j > 0:
            pp,lp = f(i-1,j-1)
            if pp >= p:
                p = pp
                l = min(lp,l)
        if (i,j) in P: p+=1

        return (p,l+1)
    
    return f()


def inv_FW(M):

    n = len(M)

    res = [[True]*n for _ in range(n)]

    for i in range(n):
        for j in range(n):
            for k in range(n):
                if M[i][j] < M[i][k] + M[k][j]: break
            else:
                res[i][j] = False
    
    for i in range(n):
        for j in range(n):
            if res[i][j]: res[i][j] = M[i][j]
            else: res[i][j] = float('inf')
                

    return res

def FW(V,E):
    M = [[float('inf')]*V for _ in range(V)]
    for i in range(V): M[i][i] = 0
    for u,v,w in E: 
        M[u][v] = w 
        M[v][u] = w

    for i in range(V):
        for j in range(V):
            for k in range(V):
                if M[i][j] > M[i][k] + M[k][j]: M[i][j] = M[i][k] + M[k][j]
    
    return M 
            

def D_geodesico(V,E,D):

    M = FW(V,E)
    count = [False]*V
    print(M)
    for i in D:
        for j in D :
            for k in range(V):
                if M[i][j] == M[i][k] + M[k][j]: count[k] = True

    return all(count)

print(D_geodesico(3,[(0,1,1),(1,2,1)],[0,2]))