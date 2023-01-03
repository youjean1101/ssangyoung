'''
# DB연결과 조회 처리
1. oracle 연동 lib 설정
    pip install cx_oracle
    import cx_oracle as oci
2. 연결 정보 처리
    oci.connect("계정/비번@ip:post/sid")
3. 커서 가져오기
    cursor = conn.cursor()
4. sql명령 문자열 선언
5. sql 실행
    cursor.execute(sql)
    ==> 커서에 데이터가 담김
6. 실행된 결과 데이터 가져오기
    cursor.fetchall() : 결과값이 2차원 데이터일 때, 튜플형 배열로 담김
    cursor.fetchone() : 결과값이 1차원 단일 데이터일 때, 튜플형 단일 데이터를 담김
7. 데이터 출력하기
8. 커서 닫기 : cursor.close()
9. 연결 닫기 : conn.close()
'''
import cx_Oracle as oci
conn = oci.connect("scott/tiger@localhost:1521/xe")
print("연결확인(version):", conn.version)