'''
Created on 2022. 12. 28.

@author: dbwls

# 기능메서드 활용
1. arange(크기) 해당 크기만큼의 배열을 생성
    1) 0부터 시작하여 증가되는 데이터로 해당 크기만큼 설정
'''
import numpy as np
ar01 = np.arange(10)
print(ar01)
# 2. arange(시작값, 마지막값+1)
ar02 = np.arange(10,20)
print(ar02)
# ex) arange기능 메서드를 이용하여, 
#    50~70, 4~15까지 데이터가 들어간 배열을 선언해보세요.
ex1 = np.arange(50,71)
print(ex1)
ex2 = np.arange(4,16)
print(ex2)
# 범위에 데이터는 나누어서 처리
# 1. lispace(시작값, 마지막값, 분할할 갯수)
ar06 = np.linspace(0,1,6)
print(ar06)
# 2. np.lispace(시작값, 마지막값, 분할할갯수, endpoint=False)
#    마지막값이 포함되는 것이 default,
#    마지막값을 포함시키지 않으려면 endpoint속성 활용
ar07 = np.linspace(0,10,4, endpoint=False)
print(ar07)
# ex1) 0~100 사이의 구간을 5개 구간을 나누어 출력
ar08 = np.linspace(0,100,5)
print(ar08)
# ex2) 1~7사이의 구간을 6개로 나누어 출력하되 마지막 값 포함하지 않게 처리
ar09 = np.linspace(1,7,6, endpoint=False)
print(ar09)