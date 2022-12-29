'''
Created on 2022. 12. 28.

@author: dbwls
'''
import numpy as np
import datetime
li01 = range(1,100000)
s = datetime.datetime.now() # 시간check
print(li01)
print("리스 작업 시작:", s)
for cnt in li01:
    cnt = cnt*10
s = datetime.datetime.now()
print("리스트 작업 종료:", s)
# ndarry로 처리
ar = np.arange(1,100000) # 데이터 범위 확인
s = datetime.datetime.now()
print("ndarray 시작 시간:", s)
ar = ar*10
s = datetime.datetime.now()
print("ndaaray종료 시간:",s)
'''
# numpy
1. Numerical Python의 줄임말로 파이썬에서 과학적 계산을 위한 핵심 라이브러리
2. 고성능 다차원 배열 객체와 이들 배열과 함께 작동되는 도구들을 제공

# 배열(ndarry)
1. List나 typle 보다 생성방법이 다양하다.
2. numpy의 배열은 모두 동일한 자료형의 grid
3. 생성 : numpy.array(컬렉션객체)
4. shape 속성은 각 차원의 크기를 알려주는 정수 튜플
5. 각 데이터의 자료형은 dtype으로 확인 가능
6. 배열객체[인덱스]를 이용해서 각각의 데이터 접근 가능
7. print함수를 이용해서 출력하면 데이터 각각을 순서대로 출력
8. 배열의 크기 변경은 numpy.ndarray.reshape함수로 가능한데 
    파라미터는 튜플
    
'''