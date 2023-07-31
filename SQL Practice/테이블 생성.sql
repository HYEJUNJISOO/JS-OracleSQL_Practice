 CREATE TABLE coffee_menu (
 no number GENERATED AS IDENTITY ,  --자동으로 숫자를 증가시켜줌
 coffee VARCHAR2(100) NOT NULL ,
 kind VARCHAR2(100) NOT NULL ,
 price number(11) DEFAULT 0 NOT NULL,
 reg_day date DEFAULT sysdate NOT NULL ,
 mod_day date DEFAULT sysdate NOT NULL ,
 CONSTRAINT pk_coffee_menu PRIMARY KEY(no)
)
;

COMMENT ON TABLE coffee_menu IS '커피/음료 메뉴';

-----------------------------------------------------

CREATE TABLE cust_info (
 no number GENERATED AS IDENTITY ,
 cust_id VARCHAR2(100) NOT NULL,
 name VARCHAR2(100) NOT NULL,
 email VARCHAR2(100) NOT NULL,
 role VARCHAR2(100) DEFAULT 'MEMBER' NOT NULL  ,
 reg_day date default sysdate NOT NULL,
 CONSTRAINT pk_cust_info PRIMARY KEY(no)
);


COMMENT ON TABLE cust_info IS '고객정보';

-- unique index 생성

ALTER TABLE cust_info ADD CONSTRAINT idx_cust_info UNIQUE(cust_id);

-----------------------------------------------------

CREATE TABLE order_list (
 no number GENERATED AS IDENTITY ,
 coffee_no number(11) NOT NULL,
 coffee VARCHAR2(100) NOT NULL,
 price number(11) NOT NULL,
 cust_id VARCHAR2(100) NOT NULL,
 name VARCHAR2(100) NOT NULL,
 reg_day date default sysdate ,
 CONSTRAINT pk_order_list PRIMARY KEY(no)
);


COMMENT ON TABLE order_list IS '주문내역';

-- foreign key 생성

ALTER TABLE order_list
ADD CONSTRAINT fk_coffee_no
FOREIGN KEY (coffee_no)
REFERENCES coffee_menu(no);

ALTER TABLE order_list
ADD CONSTRAINT fk_cust_id
FOREIGN KEY (cust_id)
REFERENCES cust_info(cust_id);
