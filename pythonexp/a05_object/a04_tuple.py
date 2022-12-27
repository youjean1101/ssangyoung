'''
Created on 2022. 12. 26.

@author: dbwls

'''
# 리스트의 덧셈
numList01 = [10,20,30]
numList02 = [40,50,60]
print("+:",numList01 +numList02)
print("*:",numList01*3)
'''
# 리스트 값 삽입
1. append():맨 뒤에 값 추가
2. insert(위치, 값) : 정해진 위치에 값 삽입하기
'''
numList01.insert(1,888)
print("두번째 위치에 데이터 삽입 후:", numList01)
# 리스트의 항목 삭제
del(numList01[1]) # 특정 위치의 데이터 삭제
print("삭제 후:", numList01)
# 리스트의 전체 삭제
del(numList01) # 해당 메모리 자체를 삭제 처리
# 특정 데이터의 삭제
numList03 = [70,80,888,90,100,50,80,90]
numList03.remove(80)    # 첫번째 데이터 삭제
print("80 삭제 후:", numList03) 
# count(찾을 값) : 해당 찾을값 갯수 확인
print("90 갯수 확인:",numList03.count(90))
# sort(), sort(reverse=True)
numList03.sort()
print("정렬:",numList03)
numList03.sort(reverse=True)
print("역정렬:",numList03)
# reverse() : 정렬 상관없이 순서를 뒤에서부터 출력
# copy() : 객체의 경우 heap메모리를 다시 만들어 사용하게 처리
numList04 = [4,7,9,8]
numList04.reverse()
print("역순서로 출력:",numList04)
numList05 = numList04.copy()
numList05.reverse()
print("다른 메모리 사용")
print(numList04)
print(numList05)
numList06 = numList05
numList06.reverse()
print("같은 메모리 사용")
print(numList05)
print(numList06)
# ex) 임의의 주사위 5번을 던진 리스트를 만들고,
#     3번째 위치에 임의의 주사위를 번호 삽입
#     역정렬을 시키고, 2번째 데이터 삭제 후 마지막 데이터를 삭제 후 데이터 출력
import random as r
diceList = []
for cnt in range(5) :
    diceList.append(r.randrange(1,7))
print("주사위 5번:",diceList)
diceList.insert(2,r.randrange(1,7))
print("주사위 6번(3번째삽입):",diceList)
diceList.sort(reverse=True)
print("역정렬:",diceList)
del(diceList[1]); print("두번째 데이터 삭제 후:",diceList)
diceList.pop(); print("마지막 데이터 삭제 후::",diceList)