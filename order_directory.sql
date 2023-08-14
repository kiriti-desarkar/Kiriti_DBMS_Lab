Create Database if not exists `order-directory` ;
use `order-directory`;

CREATE TABLE IF NOT EXISTS supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50),
SUPP_PHONE varchar(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID));

CREATE TABLE IF NOT EXISTS category (
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES product (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);



INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

INSERT INTO `RATING` VALUES(1,101,4);
INSERT INTO `RATING` VALUES(2,102,3);
INSERT INTO `RATING` VALUES(3,103,1);
INSERT INTO `RATING` VALUES(4,104,2);
INSERT INTO `RATING` VALUES(5,105,4);
INSERT INTO `RATING` VALUES(6,106,3);
INSERT INTO `RATING` VALUES(7,107,4);
INSERT INTO `RATING` VALUES(8,108,4);
INSERT INTO `RATING` VALUES(9,109,3);
INSERT INTO `RATING` VALUES(10,110,5);
INSERT INTO `RATING` VALUES(11,111,3);
INSERT INTO `RATING` VALUES(12,112,4);
INSERT INTO `RATING` VALUES(13,113,2);
INSERT INTO `RATING` VALUES(14,114,1);
INSERT INTO `RATING` VALUES(15,115,1);
INSERT INTO `RATING` VALUES(16,116,0);


//Q4
SELECT CUS_GENDER, COUNT(*) AS Total_Customers
FROM customer
WHERE CUS_ID IN (
    SELECT DISTINCT CUS_ID
    FROM `order`
    WHERE ORD_AMOUNT >= 3000
)
GROUP BY CUS_GENDER;


select count(t2.cus_gender) as NoOfCustomers, t2.cus_gender from 
(select t1.cus_id, t1.cus_gender, t1.ord_amount, t1.cus_name from 
(select `order`.*, customer.cus_gender, customer.cus_name from `order` inner join customer where `order`.cus_id=customer.cus_id having `order`.ord_amount>=3000)
as t1  group by t1.cus_id) as t2 group by t2.cus_gender;


//Q5
select A.*, p.PRO_NAME from product p inner join 
(select o.ORD_ID, o.ORD_AMOUNT,o.ORD_DATE, o.PRICING_ID, o.CUS_ID, sp.PRO_ID from `order` o inner join supplier_pricing sp 
on o.PRICING_ID=sp.PRICING_ID where CUS_ID=2) as A
 on p.PRO_ID=A.PRO_ID ;
 
select o.*, pr.PRO_NAME from `order` o, supplier_pricing sp, product pr  where CUS_ID = 2 and o.PRICING_ID = sp.PRICING_ID and sp.PRO_ID = pr.PRO_ID;
 
select product.pro_name, `order`.* from `order`, supplier_pricing, product 
where `order`.cus_id=2 and 
`order`.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;

-- Q6
select s.* from supplier_pricing sp
inner join supplier s ON s.SUPP_id = sp.SUPP_ID
group by SUPP_ID HAVING COUNT(*) > 1;

select s.*, count(pro_id) as product_count from supplier_pricing sp
 inner join supplier s on s.supp_id = sp.supp_id
 group by supp_id
 having count(pro_id) > 1;

select supplier.* from supplier where supplier.supp_id in 
	(select supp_id from supplier_pricing group by supp_id having 
	count(supp_id)>1) 
group by supplier.supp_id;

select s.*,A.* from
(select sp.SUPP_ID, count(sp.PRO_ID) as no_of_products from supplier_pricing sp group by sp.SUPP_ID having count(sp.PRO_ID)>1 ) 
as A inner join Supplier s on s.SUPP_ID=A.SUPP_ID;


-- Q7

select p.pro_id, p.pro_name, p.pro_desc, c.cat_name, min(sp.supp_price) as minimum_product_price from product p
 inner join supplier_pricing sp on p.pro_id = sp.pro_id
 inner join category c on p.cat_id = c.cat_id
 group by p.cat_id;
 

select min(SUPP_PRICE),c.CAT_ID from category c inner join product p on c.CAT_ID=p.CAT_ID inner join SUPPLIER_PRICING s on p.PRO_ID=s.PRO_ID group by c.CAT_ID;

select k.cat_id, k.cat_name,  product.pro_id, product.pro_name, supplier_pricing.supp_price,
k.minPrice from (select MIN(SUPP_PRICE) as minPrice, category.cat_name, category.cat_id from product 
join supplier_pricing on supplier_pricing.pro_id = product.pro_id
join category on category.cat_id = product.cat_id GROUP BY category.cat_id) k
join product on k.cat_id = product.cat_id 
join supplier_pricing on supplier_pricing.pro_id = product.pro_id 
where k.minPrice = supplier_pricing.supp_price ORDER BY cat_id ASC;

select category.cat_id,category.cat_name, min(t3.min_price) as Min_Price from category inner join
(select product.cat_id, product.pro_name, t2.* from product inner join  
(select pro_id, min(supp_price) as Min_Price from supplier_pricing group by pro_id) 
as t2 where t2.pro_id = product.pro_id)
as t3 where t3.cat_id = category.cat_id group by t3.cat_id;

-- SELECT
--     c.cat_id,
--     c.cat_name,
--     t4.pro_name,
--     t4.supp_price as minimum_price
--     
-- FROM
--     category c
-- JOIN (
--     SELECT
--         p.cat_id,
--         p.pro_name,
--         sp.supp_price,
--         RANK() OVER (PARTITION BY p.cat_id ORDER BY sp.supp_price) AS price_rank
--     FROM
--         product p
--     JOIN (
--         SELECT
--             pro_id,
--             supp_price
--         FROM
--             supplier_pricing
--         WHERE
--             (pro_id, supp_price) IN (
--                 SELECT
--                     pro_id,
--                     MIN(supp_price) AS Min_Price
--                 FROM
--                     supplier_pricing
--                 GROUP BY
--                     pro_id
--             )
--     ) sp ON p.pro_id = sp.pro_id
-- ) as t4 ON c.cat_id = t4.cat_id AND t4.price_rank = 1;

-- Q8

select p.PRO_ID, p.PRO_NAME, o.ORD_DATE from `order` o 
inner join supplier_pricing sp ON sp.PRICING_ID = o.PRICING_ID
inner join product p ON sp.PRO_ID = p.PRO_ID
where o.ORD_DATE > "2021-10-05";

select product.pro_id,product.pro_name from `order` inner join supplier_pricing on supplier_pricing.pricing_id=`order`.pricing_id inner join product on product.pro_id=supplier_pricing.pro_id where `order`.ord_date>"2021-10-05";


-- Q9
select CUS_NAME, CUS_GENDER from customer where CUS_NAME LIKE "%A" OR CUS_NAME LIKE "A%";
select customer.cus_name,customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

-- Q10

CREATE DEFINER=`root`@`localhost` PROCEDURE `rating_proc`()
BEGIN
select report.supp_id,report.supp_name,report.Average,
CASE
	WHEN report.Average =5 THEN 'Excellent Service'
    	WHEN report.Average >4 THEN 'Good Service'
    	WHEN report.Average >2 THEN 'Average Service'
    	ELSE 'Poor Service'
END AS Type_of_Service from 
(select final.supp_id, supplier.supp_name, final.Average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ORD_ID, test.RAT_RATSTARS from supplier_pricing inner join
(select `order`.pricing_id, rating.ORD_ID, rating.RAT_RATSTARS from `order` inner join rating on rating.`ord_id` = `order`.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id) 
as test2 group by test2.supp_id) 
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END
