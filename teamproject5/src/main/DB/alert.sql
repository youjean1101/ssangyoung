create sequence alert_seq
    increment by 1
    start with 0
    minvalue 0
    maxvalue 99999
    nocycle;

create table alert(
    alertNo number primary key,
    id varchar2(30) constraint alert_id_fk references user1(id),
    alertDate date,
    receptionstate number constraint alert_receptionstate_ck CHECK (receptionstate in(1,0)),
    alertDiv varchar2(20)
);