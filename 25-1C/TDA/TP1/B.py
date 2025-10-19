def prob(p1,p2,k):
    if not k: return int(p1==p2)
    if k < abs(p1-p2): return 0
    return (prob(p1,p2+1,k-1)+prob(p1,p2-1,k-1))/2
    
pos1 = input()
pos2 = input()

n = pos2.count("?")
pos1 = pos1.count("+") - pos1.count("-")
pos2 = pos2.count("+") - pos2.count("-")

print(prob(pos1,pos2,n))