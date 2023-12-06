CREATE DATABASE web_development;
USE web_development;
CREATE TABLE USER (
    user_id CHAR(6) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    account VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    permission INT NOT NULL,
    status BOOLEAN NOT NULL
);
CREATE TABLE BUYER (
    user_id CHAR(6) NOT NULL PRIMARY KEY,
    sex BOOLEAN,
    age INTEGER,
    FOREIGN KEY (user_id) REFERENCES USER(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE SELLER (
    user_id CHAR(6) NOT NULL PRIMARY KEY,
    joint_date TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES USER(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE ADMINISTRATOR(
    user_id CHAR(6) NOT NULL PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES USER(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE COUPON (
    coupon_id CHAR(6) NOT NULL PRIMARY KEY,
    discount_amount INTEGER NOT NULL,
    minimum_limit INTEGER NOT NULL,
    start_date TIMESTAMP NOT NULL,
    expired_date TIMESTAMP NOT NULL,
    seller_id CHAR(6) NOT NULL,
    type_of_discount_policies INT NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES SELLER(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE PRODUCT (
    product_id CHAR(6) NOT NULL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    description_of_product VARCHAR(255) NOT NULL,
    picture_in_browsing VARCHAR(255) NOT NULL,
    picture_in_description VARCHAR(255) NOT NULL,
    price INTEGER NOT NULL,
    quantity_in_stock INTEGER NOT NULL,
    seller_id CHAR(6) NOT NULL,
    FOREIGN KEY (seller_id) REFERENCES SELLER(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `ORDER` (
  order_id CHAR(6) NOT NULL PRIMARY KEY,
  order_end TIMESTAMP NOT NULL,
  delivary_method BOOLEAN NOT NULL,
  delivary_address VARCHAR(255) NOT NULL,
  delivary_fee INTEGER DEFAULT 60,
  status INT NOT NULL,
  order_date TIMESTAMP NOT NULL,
  quantity_of_product INTEGER NOT NULL,
  comment VARCHAR(255),
  seller_id CHAR(6) NOT NULL,
  coupon_id CHAR(6),
   FOREIGN KEY (seller_id) REFERENCES SELLER(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY (coupon_id) REFERENCES COUPON(coupon_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PRODUCT_SALES (
  daily INTEGER,
  monthly INTEGER,
  weekly INTEGER,
  product_id CHAR(6) NOT NULL PRIMARY KEY,
  FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE SHOPPING_CART (
  cart_id CHAR(6) NOT NULL PRIMARY KEY,
  buyer_id CHAR(6) NOT NULL,
  order_id CHAR(6) NOT NULL,
  FOREIGN KEY (buyer_id) REFERENCES BUYER(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (order_id) REFERENCES `ORDER`(order_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PURCHASE(
     buyer_id CHAR(6) NOT NULL,
     product_id CHAR(6) NOT NULL,
     PRIMARY KEY (buyer_id, product_id),
     FOREIGN KEY (buyer_id) REFERENCES BUYER(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MANAGE(
     administrator_id CHAR(6) NOT NULL,
     coupon_id CHAR(6) NOT NULL,
     PRIMARY KEY(administrator_id,coupon_id),
     FOREIGN KEY (administrator_id) REFERENCES ADMINISTRATOR(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY (coupon_id) REFERENCES COUPON(coupon_id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE CONTAIN(
     product_id CHAR(6) NOT NULL,
     order_id CHAR(6) NOT NULL,
     PRIMARY KEY(product_id,order_id),
     FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE ON UPDATE CASCADE,
     FOREIGN KEY (order_id) REFERENCES `ORDER`(order_id) ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO USER(user_id,name,account,password,address,email,phone_number,permission,status)
VALUES
('US0001','yulun','yulun0531','110590050','台北市信義區松山路119巷3號','t110590050@ntut.org.tw','0966375990',0,1),
('US0002','choco','choco','110590036','台北市中正區八德路一段1號','t110590036@ntut.org.tw','0965322840',0,1),
('US0003','xzh','110590033','110590033','台北市內湖區舊宗路一段268號','t110590033@ntut.org.tw','0961345670',1,1),
('US0004','kuan','110590006','110590006','台北市北投區明德路331巷35號1樓','t110590006@ntut.org.tw','095327406',1,1),
('US0005','xiao','110590063','110590063','台北市大安區忠孝東路三段1號','t110590063@ntut.org.tw','123456789',1,1),
('US0006','admin','admin','admin','台北市大安區忠孝東路三段1號','admin@test.com','111111111',2,1);

INSERT INTO BUYER(user_id,sex,age)
VALUES
('US0001',1,20),
('US0002',1,35);

INSERT INTO SELLER(user_id,joint_date)
VALUES
('US0003','2022-05-31 18:25:30'),
('US0004','2022-09-11 20:50:22'),
('US0005','2022-10-28 22:00:02');

INSERT INTO ADMINISTRATOR(user_id)
VALUES
('US0006');

INSERT INTO COUPON(coupon_id,discount_amount,minimum_limit,start_date,expired_date,seller_id,type_of_discount_policies)
VALUES
('CO0001',10,100,'2023-04-01 00:00:00','2023-12-31 23:59:59','US0003',0),
('CO0002',60,199,'2023-11-11 00:00:00','2023-11-11 23:59:59','US0004',1),
('CO0003',30,399,'2023-04-02 00:00:00','2023-04-18 23:59:59','US0005',2),
('CO0004',50,299,'2023-05-30 00:00:00','2023-06-12 23:59:59','US0003',1),
('CO0005',10,100,'2023-07-18 00:00:00','2023-08-20 23:59:59','US0004',2);

INSERT INTO PRODUCT(product_id,product_name,description_of_product,picture_in_browsing,picture_in_description,price,quantity_in_stock,seller_id)
VALUES
('PR0001','呆萌小石頭','天然獨一無二，為您的生活增添自然的愉悅。','item1.jpg','item1.jpg',50,100,'US0003'),
('PR0002','石頭明信片組','發掘獨特的石頭風景，每張都是大自然的微縮奇蹟。','item2.jpg','item2.jpg',199,100,'US0003'),
('PR0003','溫馨石頭小家','簡約中帶著溫馨，這是一個由石頭構成的小天地，將自然之美融入家的每一角。','item3.jpg','item3.jpg',399,100,'US0003'),
('PR0004','可愛石頭甜點屋','甜蜜的石頭造型點心，讓您品嚐到獨一無二的甜蜜滋味。','item4.jpg','item4.jpg',100,100,'US0004'),
('PR0005','派大星冠軍石頭','勇奪冠軍的石頭，展現出無可比擬的堅強與勝利。','item5.jpg','item5.jpg',100,100,'US0004'),
('PR0006','比奇堡現採石頭','現場採集的石頭，是比奇堡獨特風格的象徵。','item6.jpg','item6.jpg',100,100,'US0004'),
('PR0007','海精靈石頭組','擁有海洋風情的石頭組合，彷彿能聽見浪花的聲音。','item7.jpg','item7.jpg',199,100,'US0005'),
('PR0008','石頭珍珠貝殼','珍珠般閃耀的石頭，宛如收藏的寶貝一般。','item8.jpg','item8.jpg',399,100,'US0005'),
('PR0009','爆炒鵝卵石','火熱炒製的鵝卵石，散發著獨特的風味誘惑。','item9.jpg','item9.jpg',100,100,'US0005'),
('PR0010','派大星石頭屋','由派大星親自打造的石頭屋，充滿童趣與奇幻。','item10.jpg','item10.jpg',100,100,'US0005');

INSERT INTO `ORDER`(order_id,order_end,delivary_method,delivary_address,status,order_date,quantity_of_product,seller_id)
VALUES
('OR0001','2023-04-01 00:00:00',0,'台北市信義區松山路119巷3號',0,'2023-03-30 00:00:00',3,'US0003'),
('OR0002','2023-05-01 00:00:00',0,'台北市信義區松山路119巷3號',0,'2023-04-30 00:00:00',5,'US0003'),
('OR0003','2023-06-07 00:00:00',0,'台北市信義區松山路119巷3號',0,'2023-06-01 00:00:00',3,'US0004'),
('OR0004','2023-06-09 00:00:00',0,'台北市信義區松山路119巷3號',0,'2023-06-08 00:00:00',10,'US0004'),
('OR0005','2023-02-01 00:00:00',0,'台北市信義區松山路119巷3號',0,'2023-01-25 00:00:00',1,'US0005');

INSERT INTO PRODUCT_SALES(product_id)
VALUES
('PR0001'),
('PR0002'),
('PR0003'),
('PR0004'),
('PR0005'),
('PR0006'),
('PR0007'),
('PR0008'),
('PR0009'),
('PR0010');

INSERT INTO SHOPPING_CART(cart_id,buyer_id,order_id)
VALUES
('SH0001','US0001','OR0001'),
('SH0002','US0001','OR0002'),
('SH0003','US0001','OR0003'),
('SH0004','US0001','OR0004'),
('SH0005','US0001','OR0005');

INSERT INTO PURCHASE(buyer_id,product_id)
VALUES
('US0001','PR0001'),
('US0001','PR0002'),
('US0001','PR0003'),
('US0001','PR0004'),
('US0001','PR0005');

INSERT INTO MANAGE(administrator_id,coupon_id)
VALUES
('US0006','CO0001'),
('US0006','CO0002'),
('US0006','CO0003'),
('US0006','CO0004'),
('US0006','CO0005');

INSERT INTO CONTAIN(product_id,order_id)
VALUES
('PR0001','OR0001'),
('PR0002','OR0002'),
('PR0003','OR0003'),
('PR0004','OR0004'),
('PR0005','OR0005');

SELECT * FROM CONTAIN;