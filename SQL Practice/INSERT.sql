-- INSERT���� �⺻ ����
--INSERT INTO table_name (column name, column name)
--values ( ); 

INSERT INTO coffee_menu (coffee, kind, price)
VALUES ('�Ƹ޸�ī��','Ŀ��',2000);

INSERT INTO coffee_menu (coffee, kind, price)
VALUES ('ī���','Ŀ��',3000);

INSERT INTO coffee_menu (coffee, kind, price)
VALUES ('īǪġ��','Ŀ��',3000);

INSERT INTO coffee_menu (coffee, kind, price)
VALUES ('�׸�Ƽ','��Ŀ��',3500);

INSERT INTO coffee_menu (coffee, kind, price)
VALUES ('���ڶ�','��Ŀ��',4000);

INSERT INTO coffee_menu (coffee, kind, price)
VALUES ('���ξ���','���̵�',3000);

INSERT INTO coffee_menu (coffee, kind, price)
VALUES ('�����Ѷ��','���̵�',3000);

INSERT INTO coffee_menu (coffee, kind, price)
VALUES ('������','���̵�',3000);

-------------------------------------

INSERT INTO cust_info(cust_id,NAME,email,role)
VALUES('ID1','ȫ�浿','email1@hong.com','MEMBER');

INSERT INTO cust_info(cust_id,NAME,email,role)
VALUES('ID2','ȫ�漺','email2@hong.com','MEMBER');

INSERT INTO cust_info(cust_id,NAME,email,role)
VALUES('ID3','ȫ����','email3@hong.com','MEMBER');

INSERT INTO cust_info(cust_id,NAME,email,role)
VALUES('ID4','ȫ���','email4@hong.com','MEMBER');

INSERT INTO cust_info(cust_id,NAME,email,role)
VALUES('ID5','ȫ�漱','email5@hong.com','MEMBER');

INSERT INTO cust_info(cust_id,NAME,email,role)
VALUES('ID6','������','admin@hong.com','ADMIN');

--------------------------------------

INSERT INTO order_list (coffee_no,coffee,price,cust_id,NAME)
VALUES(1,'�Ƹ޸�ī��',2000,'ID1','ȫ�浿');

INSERT INTO order_list (coffee_no,coffee,price,cust_id,NAME)
VALUES(1,'�Ƹ޸�ī��',2000,'ID2','ȫ�漺');

INSERT INTO order_list (coffee_no,coffee,price,cust_id,NAME)
VALUES(3,'īǪġ��',3000,'ID3','ȫ����');

INSERT INTO order_list (coffee_no,coffee,price,cust_id,NAME)
VALUES(3,'īǪġ��',3000,'ID3','ȫ����');

INSERT INTO order_list (coffee_no,coffee,price,cust_id,NAME)
VALUES(5,'���ڶ�',4000,'ID4','ȫ���');

INSERT INTO order_list (coffee_no,coffee,price,cust_id,NAME)
VALUES(8,'������',3000,'ID2','ȫ�漺');

INSERT INTO order_list (coffee_no,coffee,price,cust_id,NAME)
VALUES(4,'�׸�Ƽ',3500,'ID3','ȫ����');

INSERT INTO order_list (coffee_no,coffee,price,cust_id,NAME)
VALUES(2,'ī���',3000,'ID5','ȫ�漱');
