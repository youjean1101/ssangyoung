'''
Created on 2022. 12. 22.

@author: dbwls
# for문 형식
1. for idx in range(반복횟수): 반복횟수만큼 0부터 반복
2. for cnt in range(시작수, 마지막수+1) : 시작수에서 마지막 수까지 반복
3. for cnt in range(시작수, 마지막수+1, 증감단위) : 시작수에서 마지막수까지 증/감단위로 반복
4. for one in 배열형구조체 : 배열형 데이터의 한개씩 출력 처리
'''
# 5회 반복(0부터 시작)
for idx in range(5):
    print(idx, end=",")
print()
# 1~10까지 출력
for cnt in range(1, 11):
    print(cnt, end=",")
print()
# 10~100까지 5단위로 출력
for cnt in range(5, 101, 5):
    print(cnt, end=",")
print()