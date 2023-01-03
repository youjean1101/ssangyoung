'''
Created on 2023. 1. 3.

@author: dbwls
# ndarray의 산술연산자
1. 배열의 숫자 데이터 연산은 배열의 각 요소에 연산 결과를 리턴한다.
2. 동일 크기를 갖는 배열은 동일한 위치의 요소 데이터까지 연산 수행한다.
    list01 = np.array([1,2,3])
    list02 = np.array([3,4,5])
    list03 = list01*2 ==> 각 요소들 마다 데이터를 *2로 처리한다.
    list04 = list01+list2 ==> 각 요소의 같은 index 위치에 데이터까지 + 연산 처리 ==>[4,6,8]

# ndarray의 비교연산자
1. 배열의 각 데이터를 비교하여 논리값을 저장하는 연산처리를 말한다.
2. ex) 
    boolList = np.equal(list01, list02)
        두 배열데이터의 각 요소들을 비교하여 bool값의 배열을 만든다.
        1==3    2==4    3==5
        [False, False, False]
3. 종류
    not_equal(), greater(), greater_equal(), less()
    less_equal()
'''
import numpy as np
list01 = np.array([1,2,3])
list02 = np.array([4,5,6])
list03 = list01 * 3
list04 = list01 + list02
print(list01)
print(list02)
print(list03)
print(list04)
# 비교 연산자를 이용하여 배열간의 데이터 비교 및 bool배열 출력
print("equal(==):", np.equal(list01,list02))
print("not equal(!=):", np.not_equal(list01,list02))
print("greater(>):", np.greater(list01,list02))
print("greater_equal(>=):", np.greater_equal(list01,list02))
print("less(<):", np.less(list01,list02))
print("less_equal(<=):", np.less_equal(list01,list02))
# ex) nparray형태로 이름 3명, 3명의 국어점수, 영어점수, 수학점수를 
#        설정
#        1) 학생별 국어,영어,수학 점수의 평균 점수 배열 설정.
#        2) 각 학생별 평균 점수가 70점이상인지 여부를 설정
#        3) 위 내용을 이름과 함께 평균 점수 출력 및 평균점수가 70점 이상으로 합격여부 출력
snames = np.array(["홍길동","김길동","신길동"])
kors = np.array([30,60,50])
engs = np.array([100,70,80])
maths = np.array([50,60,90])
avgs = (kors+engs+maths)//3
print("평균점수:",avgs)
isPass = np.greater_equal(avgs,70)
print("합격여부:",isPass)
len01 = len(snames) # 길이를 도출
print("이름\t평균점수\t합격여부")
for idx in range(len01) : 
        print(snames[idx],end="\t")
        print(avgs[idx],end="\t")
        print(isPass[idx],end="\n")