from collections import deque

def list_of_ady(V,E): #O(m)
    res = dict.fromkeys(range(V))
    for u,w in E:
        if not res[u]: res[u] = []
        if not res[w]: res[w] = []
        res[w].append(u)
        res[u].append(w)
    return res


def bipartito(V,E):
    vecinos = list_of_ady(V,E)
    
    dists = [0]*V
    visited = set()

    def dfs(v,d=0):
        visited.add(v)
        for u in vecinos[v]:
            if u in visited: continue
            dfs(u,d+1)
        dists[v] = d

    dfs(0)

    for u,w in E:
        if dists[u]%2 == dists[w]%2: return False  

    return True


def min_steps(grid,k,w,x0,y0): 
    r,c = len(grid), len(grid[0])
    
    visited = [[[False]*k for _ in range(c)] for _ in range(r)]
    to_visit = deque()

    v0 = grid[x0][y0]
    visited[x0][y0][v0] = True 
    to_visit.append((x0,y0,v0,0))

    def vecinos(v):
        x,y = v
        if x+1 < r: yield (x+1,y)
        if y+1 < c: yield (x,y+1)
        if x-1 < 0: yield (x+1,y)
        if y-1 < 0: yield (x,y-1)

    while to_visit: 
        x,y,v,steps = to_visit.popleft()
        if v == w: 
            print(x,y,v)
            return steps 
        for nx,ny in vecinos((x,y)):
            nv = (v+grid[nx][ny])%k
            if not visited[nx][ny][nv]: 
                visited[nx][ny][nv] = True
                to_visit.append((nx,ny,nv,steps+1))

    return -1

g = [[1,3,6],[6,7,4],[4,9,3]]
print(min_steps(g,10,0,0,0))

edges = [(0,1),(0,2),(0,3),(0,4),(1,5),(3,5),(3,6),(2,7),(4,7)]
