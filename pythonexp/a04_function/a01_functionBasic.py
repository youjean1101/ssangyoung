'''
Created on 2022. 12. 22.

@author: dbwls
'''
def plus(num01, num02):
    result = num01 + num02
    return result
tot = plus(300,400)
print("함수를 통한 리턴값:",tot)
# ex) calcu를 통해 물건가격과 갯수를 받아 총계를 리턴처리하는 함수를 정의하고 호출하세요.
# price=int(input("물건가격:")) 
# cnt=int(input("갯수:"))
# def multi(num01, num02):
#     result =num01*num02
#     return result
# tot2 = multi(price, cnt)
# print("총계:",tot2)

print("정답")
def calcu(price2,cnt2):
    tot3 = price2*cnt2
    return tot3
print("총계1:",calcu(3000,2))
print("총계2:",calcu(4000,3))
print("총계3:",calcu(5000,2))
'''
# 전역변수 vs 지역변수
1) 상대적으로 상위 계층에 선언되어 하위 계층에 함수에 영향을 미치는 함수
2) global :
    - 함수 안에서 선언하더라도 무조건 전역변수로 사용할 때, 활용할 수 있는
        전역 변수 선언 예약어
'''
def mart1Buy():
    global sum
    sum = 0
    price = 3000
    print("마트1에서 소비한 금액:",price)
    sum  += price #전역변수에 할당
def mart2Buy():
    price = 4000
    tot = sum + price
    print("마트2에서 소비한 금액:",price)
    print("총금액:",tot)
mart1Buy();
mart2Buy();

productCnt = 5 # 전역변수
def myhouse():
    memberCnt01 = 3
    print("우리집의 가족수(지역)",memberCnt01)
    print("물건의 갯수(전역)",productCnt) #읽기 가능
def friendHouse():
    memberCnt02 = 4
    print("친구의 가족수(지역)",memberCnt02)
    print("물건의 갯수(전역)",productCnt)
myhouse()
productCnt+=3
friendHouse()

# pass : 함수나 객체, 계층형이 있는 모든 블럭(if, for)에 선언만하고 할당하지 않을 때, 활용
def fun01():
    pass
