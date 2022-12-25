'''
Created on 2022. 12. 23.

@author: dbwls
'''
class Person:
    name = None # 객체의 초기값 null대신에 None를 사용
    age = 0
p01 = Person()
p01.name='홍길동'
p01.age=25
print("이름:",p01.name)
print("나이:",p01.age)
# ex) 물건 객체 선언 : 물건명/가격/갯수 : 데이터 할당 후 출력하세요.
class Product:
    name = None
    price = 0
    cnt = 0
pro01 = Product()
pro01.name='사과'
pro01.price=3000
pro01.cnt=3
print("물건명:",pro01.name,"가격",pro01.price,"갯수",pro01.cnt)
class Food: 
    def __init__(self, name, price):
        self.name = name    # self : 구성요소를 지칭
        self.price = price
f01 = Food("짜장면",6000)
f02 = Food("짬뽕",7000)
print(f01.name, f01.price)
print(f02.name, f02.price)
# ex) 축구선수를 클래스로 선언하고 속성으로 팀명 이름 골수를 생성자로 
# 할당하여 출력하세요.
class SoccerPlayer: 
    def __init__(self, tname, name, goals):
        self.tname = tname    # self : 구성요소를 지칭
        self.name = name
        self.goals = goals
play1 = SoccerPlayer("프랑스","음바페",8)
play2 = SoccerPlayer("아르헨티나","메시",7)
print(play1.tname,play1.name,play1.goals)
print(play2.tname,play2.name,play2.goals)

class Calculator:
    def __init__(self, num01, num02):
        self.num01 = num01
        self.num02 = num02
    def plus(self):
        print(self.num01,"+",self.num02,"=",self.num01+self.num02)
        
c01 = Calculator(25,3)
tot = c01.plus()
print("합산:",tot)
# ex) Product02를 선언하고 생성자로 물건명과 가격, 
#        buy(구매갯수)로 해당 물건명과 가격과 구매갯수를 출력하되
#        총계(가격*갯수)를 해당 메서드를 통해서
#        return 처리하여 호출하세요.
class Product02:
    def __init__(self,pname,price):
        self.pname = pname
        self.price = price
    def buy(self,cnt):
        self.cnt = cnt
        print("# 구매한 물건 정보 #")
        print("물건명:",self.pname,"가격:",self.price,"갯수:",self.cnt)
        print("총계:",self.price*self.cnt)
        return self.price*self.cnt
prod02 = Product02("사과",3000)
prod02.buy(5)
p02 = Product02("바나나",4000)
print("총계:",p02.buy(3))        
