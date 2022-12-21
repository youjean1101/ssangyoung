'''
Created on 2022. 12. 20.

@author: dbwls

# 4가지 기본 데이터유형
1. 데이터유형을 확인하는 함수: type()
    int, floot, str, bool
'''
var1 = 100
var2 = 3.14
var3 = '파이썬'
var4 = True
print(var1,type(var1))
print(var2,type(var2))
print(var3,type(var3))
print(var4,type(var4))
'''
2. 해당 데이터유형()으로 형변환 처리가 가능하다.
'''
var5 = int(var2) # 절삭을 통해 정수형 변환
var6 = str(var1) # 문자열로 변환하여 + 문자와 함께 출력 가능
var7 = float("75.23") # 숫자형 문자열을 숫자로 변환
print(var5, var6,var7)
print("첫번째 숫자:"+var6)
'''
3. 문자열 데이터 선언
1. "",'' 선언이 가능
2. """ 를 통해서 여러줄의 문자열 선언이 가능하다.
'''
var8=''' 라인1
라인2
라인3
'''
var9 = """ 라인1
라인2
라인3(여러줄)
"""
print("여러라인:",var8)
print("여러라인:",var9)
'''
# 문자열은 + 이외에 -, *, / 연산잘르 사용하지 못한다.
단, "문자열"*숫자 형태로 문자열을 반복하는 횟수를 처리는 가능하다.
'''
print("안녕하세요!!^^"*10)

'''
# 문자열에서 데이터 mapping 처리 방식
1. 기본형식
    "문자열 데이터 {0} {1} {2}" .format(넘길데이터1, 데이터2, 데이터3)
'''
str01 = "안녕하세요"
print("인사말:{0} 입니다!".format(str01))
# ex) 가장 좋아하는 전자제품은 @@@, @@@, @@@입니다. format
# 을 활용하여 출력하세요.
eleprod1 = "드라이기"
eleprod2 = "노트북"
eleprod3 = "텔레비전"
print("가장 좋아하는 전자제품은 {},{},{} 입니다.".format(eleprod1, eleprod2, eleprod3))
print('''
가장 좋아하는 전자제품은
1) {}
2) {}
3) {}
입니다.'''.format(eleprod1, eleprod2, eleprod3))