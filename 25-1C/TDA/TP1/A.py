inf = float('inf')
    
for _ in range(int(input())):
    dim = tuple(map(int,input().split(" ")))
    r,c = dim
    grid = []
    
    for i in range(r): grid.append(list(map(int,input().split(" "))))
    dp_max = [[-inf]*c for _  in range(r)]
    dp_min = [[inf]*c for _  in range(r)]
    
    dp_max[0][0] = dp_min[0][0] = grid[0][0]
    
    if (r+c-1)%2:
        print("NO")
        continue
        
    for i in range(r):
        for j in range(c):
            Pmax = dp_max[i][j]
            Pmin = dp_min[i][j]
            if i+1 < r: 
                t = grid[i+1][j]
                dp_max[i+1][j] = max(dp_max[i+1][j],Pmax+t)
                dp_min[i+1][j] = min(dp_min[i+1][j],Pmin+t)
                
            if j+1 < c: 
                t = grid[i][j+1]
                dp_max[i][j+1] = max(dp_max[i][j+1],Pmax+t)
                dp_min[i][j+1] = min(dp_min[i][j+1],Pmin+t)
            
    if dp_min[-1][-1] <= 0 <= dp_max[-1][-1]: print("YES")
    else: print("NO")