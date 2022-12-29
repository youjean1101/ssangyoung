'''
Created on 2022. 12. 29.

@author: dbwls
# 배열형 random데이터 처리 np.random
1. 단일데이터 랜덤 처리
    np.random.normal()
    실수 + 음수/양수 포함
2. 배열의 크기를 지칭하여 랜덤 처리
    np.random.normal(size=크기)
3. 행열로 랜덤 처리
    np.random.normal(size=(행,열))
4. seed
    한번 실행하여 출력된 랜덤값은 다시 실행하여도 동일하게 데이터를 처리할려면
    위 속성으로 seed의 변호를 설정하여 처리한다.

'''
import numpy as np
r01 = np.random.normal()
print("기본 단일 random 범위:", r01)
print("배열의 크기로 랜덤범위:", np.random.normal(size=5))
print("행열의 크기로 랜덤범위:", np.random.normal(size=(3,3)))
# ex) 5X5 크기로 랜덤 범위를 정하여 출력하세요.
print(np.random.normal(size=(5,5)))
# np.random.seed(seed=100)
# seed가 100일 때.. : seed를 정하면 한번에 실행한 후는 해당 seed에 따라
# 동일한 랜덤 데이터가 나타난다.
print("seed:100 ==> ",np.random.normal(size=5))
# np.random.seed(seed=200)
print("seed:200 ==> ",np.random.normal(size=5))
'''
# 정수형의 범위를 지정한 데이터 처리
1. np.random.randint(경우의수, size=배열의 크기)
    0부터 시작하여 정수로 된 경우의 수에 범위 안에 배열의 크기로 설정
2. np.random.randint(시작수,마지막 수+1, size=배열의 크기)
3. np.random.randint(시작수,마지막 수+1, size=(행,열)
'''
# 0부터 1까지 경우의 수 2가지로 크기는 5개인 배열
print(np.random.randint(2,size=5))
# 2부터 3까지 크기는 5개인 배열
print(np.random.randint(2,4, size=5))
# 1부터 10까지 크기가 3X3 행열
print(np.random.randint(1,11, size=(3,3)))
# ex1) 1~6까지  주사위 10번 던진 데이터 출력
print(np.random.randint(1,7,size=10))
# ex2) 4X4로 학생의 점수(1~100) 랜덤출력
print(np.random.randint(1,101, size=(4,4)))