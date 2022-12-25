'''
Created on 2022. 12. 23.

@author: dbwls
'''
class Person:
    def __init__(self,name):
        self.name = name
        print(self.name,"객체 생성")
    def __del__(self):
        print(self.name,"객체 소멸")
'''
# 메모리 해제 순간
1. 모든 코드가 처리가 되고 끝나는 마지막 라인
2. 코드 중간에 명시적 메모리 해제 함수 del(참조명) 호출시
'''
p01 = Person("홍길동")
p02 = Person("김길동")
p03 = Person("신길동")
print("안녕하세요")
print("명시적 객체 소멸")
del(p01)
print("마지막 라인!!(묵시적 객체 소멸)")
# ex) Product를 통해 물건명과 가격을 생성자를 통해 할당하고,
#    소멸자를 통해서 물건명은 None으로 가격은 0으로 초기화하여 소멸
#    돠게 처리하여, 물건 객체 두개를 하나는 명시적 소멸자로
#    하나는 묵시적 소멸자를 호출되어 출력되게 하세요.
class Product:
    def __init__(self,name,price):
        self.name=name
        self.price=price
        print("생성자로 필드 값할당:",self.name)
    def __del__(self):
        print("소멸자로 필드의 초기화:",self.name)
        self.name =None
        self.price =0
        
prod01 = Product("사과",3000)
prod02 = Product("바나나",6000)
prod03 = Product("딸기",12000)
print("명시적초기화"); del(prod01)
print("묵시적 초기화(라인마지막)")
'''
# __add__()메서드
1. 같은 유형의 객체끼리 참조값으로 덧셈연산을 처리하는 경우에 실행되는 메소드
    ex) p01 = Product()
        p02 = Product()
        p01 + p02
'''

class Rabbit:
    def __init__(self,kind):
        self.kind = kind
        print(kind,"객체 생성")
    def __add__(self,other):
        print("Rabbit클래스의 "+self.kind+"와 "+other.kind+"가 친구가 되었습니다.")
r1 = Rabbit("빨간 머리 토끼")
r2 = Rabbit("곱슬 머리 토끼")
r1 + r2