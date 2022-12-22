'''
Created on 2022. 12. 21.

@author: dbwls

# if문
1. 기본 형식
    1) 파이썬은 {} 중관호 블럭이 없다.
        - 하위 계층단계를 구분할 떄는 tab간격/공백간격으로 처리한다.
        - 반드시 같은 level을 계층 코드는 같은 탭이나 공백 간격을 유지하여야 한다.
    2) 조건문 처리 형식
        if 비교/논리연산식 : 
            처리내용1
            처리내용2
            처리내용3(X) 에러 발생 : 반드시 동일한 공백간격 유지
'''
print ("프로그램 시작")
num01 = 199
if num01 >=100 :
        print("100보다 크네요1")
        print("100보다 크네요2")
        print("100보다 크네요3")
print("프로그램 종료")
# ex) 물건의 가격을 입력받아서 100000이상일 때 슈퍼유저로 표현하세요.
# print("물건 가격 평가(시작)")
# price = int(input("가격을 입력하세요:"))
# if price >= 100000 :
#     print("슈퍼유저")
# print("물건 가격 평가(종료)")
'''
2. if else 구문
    1) 조건문을 분기처리할 때, 활용된다.
    2) 형식
        if 조건식:
            문장1
        else : 문장2
3. if elif 구문
    1) 조건문이 여러 분기 처리할 때, 활용된다.
    2) 형식
        if 조건1 :
            처리문장1
        elif 조건2 : 
            처리문장2
        else
            기타조건일 때 처리문장
'''
pt = 80
print("if else 구문")
if pt>=70:
    print("합격")
else : 
    print("불합격")
    
print("if elif 구문")
if pt>=90: 
        print("A학점")
elif pt>=80: 
        print("B학점")
elif pt>=70: 
        print("C학점")
elif pt>=60: 
        print("D학점")
else:
        print("F학점")
# ex1) 로그인 himan/7777일 때, 로그인 성공 그외는 로그인 실패
id=input("아이디입력:")
password=input("패스워드입력:")
if id=="himan" and password=="7777":
    print("로그인 성공")
else : 
    print("로그인 실패")
# ex2) 나이에 따라 5미안 65이상 무료 6~13 50% 14~18 30%
#        입장료 할인하여 출력하세요.
entPay = 50000
age = int(input("나이를 입력:"))
disRatio = 0.0
if age<5 or age>=65:
    disRatio = 1.0
    print("무료")
elif age>=6 and age<=13:
    disRatio = 0.5
    print("50%")
elif age>=14 and age<=18:
    disRatio = 0.3
    print("30%")
else:
    disRatio = 0.0 # 의미 없네요..
    print("할인적용안됨")
tot = entPay - int(entPay*disRatio) #소숫점이하 절삭
print("나이:",age)
print("할인율:",int(disRatio*100),'%')
print("최종금액:",tot)
