CREATE TABLE qna(
	qno varchar2(20) PRIMARY KEY,
	writedate DATE,
	id varchar2(30) CONSTRAINT qna_id_fk REFERENCES user1(id),
	title varchar2(300) NOT NULL,
	content varchar2(4000) NOT NULL,
	imgfile varchar2(4000),
	mgrid varchar2(30) CONSTRAINT qna_mgrid_fk REFERENCES user1(id),
	answer varchar2(4000)
);
DROP TABLE qna;

CREATE SEQUENCE qna_seq
		INCREMENT BY 1
		START WITH 1
		MINVALUE 0
		MAXVALUE 100000;
DROP SEQUENCE qna_seq;

INSERT INTO qna values('qna'||qna_seq.nextval,sysdate,'himan','문의합니다','이용권 환불 방법을 모르겠습니다.',NULL,NULL,NULL);
INSERT INTO qna values('qna'||qna_seq.nextval,sysdate,'himan','자전거 점검 요청합니다','최근 자전거 이용 중 고장 자전거가 많아 이용에 많은 불편을 겪고있습니다. 점검을 더 자주 해주시면 감사하겠습니다.',NULL,NULL,NULL);
INSERT INTO qna values('qna'||qna_seq.nextval,sysdate,'himan','환불 문의합니다','이용권 환불 신청했는데 환불이 되지 않아 문의드립니다. 처리 진행 상황 확인 부탁드립니다.',NULL,NULL,NULL);
INSERT INTO qna values('qna'||qna_seq.nextval,sysdate,'himan','대여소 추가 요청드립니다','홍대입구여 8번 출구 이용자에 비해 대여소가 부족합니다. 추가 설치해주시면 좋을 것 같습니다.',NULL,NULL,NULL);
INSERT INTO qna values('qna'||qna_seq.nextval,sysdate,'himan','문의드립니다','바이러스 관련 자전거 소독이 어떻게 진행되는지 궁금합니다.',NULL,NULL,NULL);
INSERT INTO qna values('qna'||qna_seq.nextval,sysdate,'himan','고장 문의합니다','홍대입구역 8번 출구 대여소에 자전거가 전부 대여가 되지 않습니다. 장비 고장인지 확인 부탁드립니다.',NULL,NULL,NULL);

UPDATE qna SET title='', content='', imgfile='' WHERE qno='';
DELETE FROM qna WHERE qno='';

SELECT*FROM qna;