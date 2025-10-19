import Test.HUnit
import ParcialViejo

test1 = test [
    "" ~: (golesDeNoGoleadores [("River","Borja"),("Boca","Benedeto"),("Racing","Juanfer")] [10,6,4] 30 ~?= 10),
    "" ~: (golesDeNoGoleadores [("River","Borja")] [10] 30 ~?= 20),
    "" ~: (golesDeNoGoleadores [("River","Borja"),("Boca","Benedeto"),("Racing","Juanfer"),("Independiente","Bochini")] [10,6,4,10] 30 ~?= 0)
    ]

test2 = test [
    "" ~: (equiposValidos [("River","Borja"),("Boca","Benedeto"),("Racing","Juanfer")] ~?= True),
    "" ~: (equiposValidos [("River","Borja"),("Boca","Benedeto"),("Racing","Racing")] ~?= False),
    "" ~: (equiposValidos [("River","River")] ~?= False),
    "" ~: (equiposValidos [("Boca","Borja"),("Boca","Benedeto"),("Racing","Juanfer")] ~?= False),
    "" ~: (equiposValidos [("River","Boca"),("Boca","Benedeto"),("Racing","Juanfer")] ~?= False),
    "" ~: (equiposValidos [("Boca","Borja"),("Boca","Borja"),("Racing","Juanfer")] ~?= False),
    "" ~: (equiposValidos [("River","Borja"),("Boca","Borja"),("Racing","Juanfer")] ~?= False)
    ] 

test3 = test [
    "" ~: (porcentajeDeGoles "Borja" [("River","Borja"),("Boca","Benedeto"),("Racing","Juanfer")] [10,6,4] ~?= 0.5),
    "" ~: (porcentajeDeGoles "Borja" [("River","Borja")] [10] ~?= 1),
    "" ~: (porcentajeDeGoles "Juanfer" [("River","Borja"),("Boca","Benedeto"),("Racing","Juanfer")] [10,6,4] ~?= 4/20)
    ]

test4 = test [
    "" ~: (botinDeOro [("River","Borja"),("Boca","Benedeto"),("Racing","Juanfer")] [10,6,4] ~?= "Borja"),
    "" ~: (botinDeOro [("River","Borja"),("Boca","Benedeto"),("Racing","Juanfer")] [10,6,100] ~?= "Juanfer"),
    "" ~: (botinDeOro [("River","Borja"),("Boca","Benedeto"),("Racing","Juanfer")] [10,10,4] ~?= "Borja")
    ]