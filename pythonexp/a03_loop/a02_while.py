'''
Created on 2022. 12. 22.

@author: dbwls

1. while : 무한반복조건에 따라 처리할 때, 주로 활용되는 반복문
    while 반복조건:
        반복처리할 내용
2. break, continue : break는 중단, continue는 해당 조건에 따라 중단 처리
'''
cnt = 1
while cnt<=10:
    print(cnt,"번째 안녕하세요!")
    cnt +=1
# 주문할 메뉴를 입력 무한 loop 처리
# while True:
#     menu = input("주문할 메뉴입력 종료시(Q):")
#     if menu == "Q":
#         break;
#     else :
#         print(menu)
# print("무한 루프 종료!!")
# ex) 구매할 상품의 가격을 입력하고 종료할려면 -1 입력해서  총 계를 출력하세요.
tot=0
cnt=1
while True:
    price = int(input(str(cnt)+"번째 구매할 상품의 가격(종료시 -1):"))
    if price == -1:
        break;
    else : 
        tot += price
        cnt +=1
print("구매할 물건의 갯수:", cnt-1)
print("구매할 물건의 총비용:", tot)
    
