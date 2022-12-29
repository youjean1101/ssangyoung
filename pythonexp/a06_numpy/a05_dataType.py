'''
Created on 2022. 12. 29.

@author: dbwls

# ndarray의 자료형
1. dtype을 통해서 데이터의 형태를 casting, promote 변경 및 설정 가능
2. 해당 데일의 type를 확인할 수 있다.
3. astype 함수를 이용해서 타입을 변경할 수 있다.
4. 유형 종류
    정수형 : int8, int16, .. unit8
    실수형 : float16, float32
    복소수 자료 : complex64,complex128
    boolean : bool
    객체 : object
    문자열 : string_
    유니코드 : unicode_
'''
import numpy as np
ar01 = np.array([1,2,3])
print("타입확인:",ar01.dtype)
ar02 = np.array(["10","20","30"]); print(ar02, ar02.dtype)
ar03 = np.array(["안녕","좋은날","감사"]); print(ar03, ar03.dtype)
ar04 = np.array([3.5, 4.7, 5.2]); print(ar04, ar04.dtype)
ar05 = np.array(["3.5", 4.7, 5]); print(ar05, ar05.dtype)
# 형변환 처리..
ar06 = np.array([3,2,3.4,'4'], dtype=np.int32) 
#포함된 데이터를 해당 데이터 유형으로 변환 처리 3.4 ==> 3, '4' ==> 4
print(ar06, ar06.dtype)
# ndarray 유형을 변환 처리할 때는 배열명.astype(np.데이유형)
ar07 = ar06.astype(np.string_) # 정수형 ndarray ==> 문자열 ndarray
print(ar07, ar07.dtype)
