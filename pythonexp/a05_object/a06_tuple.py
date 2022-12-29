'''
Created on 2022. 12. 28.

@author: dbwls
# 튜플
1. 읽기 전용 리스트 : 목적 - 읽기 속도를 빠르게 하기 위하여 효율적으로 
                        출력하기 위해서 처리한다.
2. 소괄호로 생성하거나 콤마(,) 단위로 구분하여 처리한다.
    변수1 = (데이터1, 데이터2)
    변수2 = 데이터1, 데이터2
3. 리스트와 비슷하지만 값을 읽을 수만 있고, 수정하거나 삭제할 수 없다.

# 튜플 생성하기
1. 튜플은 소괄호와 콤마(,)로 구분하여 생성한다.
    단, 단일 데이터를 튜플로 할당할 때는 일반변수와 구분하기 위하여 
        마지막에 콤마(,)를 넣어준다.
    변수3 = 데이터1    : 일반 변수
    변수4 = (데이터1) : 일반 변수
    변수5 = 데이터1, : 튜플 변수
    변수6 = (데이터1,) : 튜플 변수
'''
numTp01 = (10,20,30)
numTp02 = 100,200,300
print(type(numTp01),numTp01)
print(type(numTp02),numTp02)
numNor = (10)
numTp03 = (10,)
numTp04 = 10,
print(type(numNor),numNor)
print(type(numTp03),numTp03)
print(type(numTp04),numTp04)
print("#튜플데이터 읽기#")
for num in numTp01:
    print(num, end=",")
print();
# ex) 튜플변수로 가격3개, 물건명1개 선언하고 반복문을 통해서 출력하세요.
priceTp05 = 1000,2000,3000
pnameTp06='사과',
print(priceTp05,pnameTp06)
for price in priceTp05:
    print(price, end=",")
print();

