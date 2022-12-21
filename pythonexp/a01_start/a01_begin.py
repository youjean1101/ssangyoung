'''
Created on 2022. 12. 19.

@author: dbwls
ctrl+f11
'''
# 한줄 주석
'''
여러줄 주석
'''
"""
여러줄 주석2
"""
# 기본 출력 함수 print()
print("파이썬 시작입니다~~")
name="홍길동" #변수 선언과 할당
age=25
print("이름:",name,"나이:",age) # 다른 데이터 유형은 ,로 출력이 가능하다.
# ex) 물건명, 가격, 갯수를 선언하고 출력하세요.
pname="사과"; price=3000; cnt=3
print("물건명:",pname,"가격:",price,"갯수:",cnt,"총합:",price*cnt)
# ,(콤마)는 한칸씩 띄워 처리가 된다. +는 데이터 유형이 동일할 떄만 처리가 가능하다.
print("문장1",end=",")
print("문장2",end="\t")
print("문장3",end="\t")
print()
# print()는 기본적으로 줄바꿈을 포함한다. 다음 명령문과 이어줄 때는 end 속성을 통해서
# 다음 명령에 대한 처리 방식을 선언할 수 있다.
# ex) 위 선언한 물건명 가격 갯수를 타이틀과 함께 tab간격(\t)로 띄워 출력하세요.
'''
ex)
물건명    가격    갯수
사과     3000    cnt
'''
print("물건명\t가격\t갯수\t총합",end="\n")
print(pname,end="\t")
print(price,end="\t")
print(cnt,end="\t")
print(price*cnt,end="\n")

'''
# input()을 통해 기본 출력을 한다.
1. 기본 input() : 콘솔창에 입력된 것을 출력
2. 변수 = input() : 변수에 입력된 것을 받는다.
3. 변수 = input("설명내용:") : 설명내용 옆에 입력 내용을 받아서 변수에 할당한다.
'''

# input()
# str01 = input()
# print("변수(str01):", str01)
# str02 = input("월드컵 우승팀?")
# print("나라:",str02)

# 올해 월드컵 MVP 이름, 국적 입력받아 출력하세요.
# mvp = input("골든볼 MVP입력:")
# nation = input("국적(팀)입력:")
# print("# 2022 월드컵 골든볼 MVP #")
# print("이름:",mvp,"\n국적:",nation)
'''
# 파이썬 변수명 선언은 자바와 동일
1. 특수문자는 _만 사용
2. 예약어 사용불가능
3. 숫자로 시작하지 못 함
4. 대소문자 구분한다.
'''
'''
# 형변환 함수
1. 파이썬은 input()을 통해서 문자열만 입력 받는다.
2. 기본적으로 정수형을 형변환할 때, int() 함수가 필요
3. 입력함수와 형변환 함수를 이중으로 적용하여 
    int(input("숫자")) 를 활용하여 처리할 수 있다.
'''
# num01 = int(input("첫번째 숫자 입력"))
# num02 = int(input("두번째 숫자 입력"))
# print(num01,"+",num02,"=",num01+num02)
# print(num01,"-",num02,"=",num01-num02)
# print(num01,"×",num02,"=",num01*num02)
# print(num01,"÷",num02,"=",num01/num02)
# ex) 물건가격과 갯수를 입력받아 총계를 출력하세요.
price2 =int(input("물건가격:"))
cnt2 =int(input("물건갯수:"))
print("총계:",price2*cnt2)


