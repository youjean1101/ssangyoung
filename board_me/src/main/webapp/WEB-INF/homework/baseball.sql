-- private String teamname;
--	private int ranking;
--	private String hometown;
--	private String player;
CREATE TABLE baseballteam(
	teamno varchar(50) PRIMARY key,
	teamname varchar(50),
	ranking number,
	hometown varchar(50),
	player varchar(50)
);
DROP TABLE baseballteam;
SELECT * FROM baseballteam;

create sequence baseballteam_seq
start with 1
minvalue 1
maxvalue 999999
increment by 1;
DROP sequence baseballteam_seq;

--INSERT INTO baseballteam VALUES(baseballteam_seq.nextval,'야구팀',0,'연고지','선수명');
SELECT * FROM baseballteam WHERE teamno='1';