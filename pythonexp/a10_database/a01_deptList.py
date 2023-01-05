'''
Created on 2023. 1. 4.

@author: dbwls

# 부서정보 가져오기
1. 연결
2. 커서객체 생성 및 sql 실행
    연결 ==> 커서
    커서 객체 : sql실행 및 데이터를 가지고 있음
3. fetchall(), fetchone() 튜플데이터 로딩
4. 반복문을 통해서 데이터 출력.
'''
import cx_Oracle as oci
# 1. 연결
conn = oci.connect("scott/tiger@localhost:1521/xe")
if conn != None:
    print("연결 성공! 버전:",conn.version)
# 2. 커서객체 생성
cursor = conn.cursor()
# 3. sql문 선언 및 실행
sql = "select * from dept"
cursor.execute(sql)
# 4. fetchall()을 통해서 결과값 튜플형식으로 가져오기
deptDup = cursor.fetchall()
print(deptDup)
# 5. 반복문을 통해서 출력하기
for dept in deptDup:
    print("{}\t{}\t{}".format(dept[0],dept[1],dept[2]))
# ex) a02_empList.py를 만들어서 사원정보 리스트를 출력하세요.