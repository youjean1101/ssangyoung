'''
Created on 2022. 12. 28.

@author: dbwls
#numpy의 배열 처리
1. 기본 형식
    numpy.array(리스트형데이터)
    ex) np.array([1,2,3])
2. 유형 : ndarray
3. 형식 : 배열명.shape : 행열 구조를 확인
4. 데이터 접근
    배열명[index]
    1) 1차원
        배열명[0], 배열명[1],
    2) 2차원
        배열명[상위 index][하위 index]
'''
import numpy as np
ar = np.array([1,2,3])
# shape 확인 : 배열명.shape
print(type(ar), ar.shape, ar)
# 단일 데이터 접근
print(ar[0],ar[1],ar[2])
# 데이터 변경
ar[1]=500
print(ar)
# 2차원 배열
br = np.array([[1,2,3],[4,5,6]])
print(br); print(br.shape); 
print("처음, 마지막:",br[0,0],br[1,2])
# ex) 국어, 영어, 수학 점수는 ndarray에 할당하고, 
#    각각의 점수와 평균을 출력을 하세요.
import random as r
score = np.array([r.randrange(0,100),
                  r.randrange(0,100),
                  r.randrange(0,100)])
print("국어:",score[0])
print("영어:",score[1])
print("수학:",score[2])
sum = score[0]+score[1]+score[2]
print("평균:",sum/3)
# 선생님
print(score); avg = (score[0]+score[1]+score[2])/3 
print("국어\t영어\t수학\t평균")
print("{}\t{}\t{}\t{}".format(score[0],
                              score[1],
                              score[2], avg))