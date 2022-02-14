create database ecommerce;

show databases;

use ecommerce;


/* Question 1: */

/* create query of supplier table */

	create table supplier(SUPP_ID int primary key,SUPP_NAME varchar(50),SUPP_CITY varchar(50),SUPP_PHONE varchar(10));

/* create query of Customer table */

	create table Customer(CUS_ID int primary key,CUS_NAME varchar(50),CUS_CITY varchar(25),CUS_PHONE varchar(10),CUS_GENDER varchar(1));

/* create query of category table */
	
	create table Category(CAT_ID int primary key,CAT_NAME varchar(20));

/* create query of Product table */
	
	create table Product(PRO_ID int primary key,PRO_NAME varchar(25),PRO_DESC varchar(25),CAT_ID int,foreign key(CAT_ID) references category(CAT_ID));

/* create query of productDetails table */
	
	create table ProductDetails(PROD_ID int primary key,PRO_ID int,SUPP_ID int,PRICE float,foreign key(PRO_ID) references product(PRO_ID),foreign key(SUPP_ID) references supplier(SUPP_ID));

/* create query of orders table */
	
	create table orders(ORD_ID int primary key,ORD__AMOUNT float,ORD_DATE date,CUS_ID int,PROD_ID int,
	foreign key(PROD_ID) references productdetails(PROD_ID),foreign key(CUS_ID) references 
	customer(CUS_ID));

/* create query of Rating table */
	
	create table RAT (RAT_ID int primary key,SUPP_ID int,CUS_ID int,RAT_RATSTARS int,
	foreign key(SUPP_ID) references supplier(SUPP_ID),
	foreign key(CUS_ID) references customer(CUS_ID)
	);


/* Qusetion 2: */

/* Insert queries of supplier table */

	insert into  supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(1,"RAKESH RETAILS","DELHI",1234567890);

	insert into  supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(2,"APPARIO LTD","MUMBAI",2589631470);

	insert into  supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(3,"KNOME PRODUCTS","BANGALORE",9785462315);

	insert into  supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(4,"BANSAL RETAILS","KOCHI",8975463285);

	insert into  supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(5,"MITTAL LTD","LUCKNOW",7898456532);

/* Insert Queries of customer table */

	insert into  CUSTOMER(cus_ID,cus_NAME,cus_CITY,cus_PHONE,cus_gender) values(1,"aakash","delhi",9999999999,"M");

	insert into  CUSTOMER(cus_ID,cus_NAME,cus_CITY,cus_PHONE,cus_gender) values(2,"aman","noida",9785463215,"M");

	insert into  CUSTOMER(cus_ID,cus_NAME,cus_CITY,cus_PHONE,cus_gender) values(3,"neha","mumbai",9999999999,"f");

	insert into  CUSTOMER(cus_ID,cus_NAME,cus_CITY,cus_PHONE,cus_gender) values(4,"megha","kolkata",9994562399,"f");

	insert into  CUSTOMER(cus_ID,cus_NAME,cus_CITY,cus_PHONE,cus_gender) values(5,"pulkit","lucknow",7895399999,"m");

/* Insert queries of category table */

	insert into  category(cat_ID,cat_NAME) values(1,"books");

	insert into  category(cat_ID,cat_NAME) values(5,"clothes");

	insert into  category(cat_ID,cat_NAME) values(4,"electronics");

	insert into  category(cat_ID,cat_NAME) values(3,"groceries");

	insert into  category(cat_ID,cat_NAME) values(2,"games");

/* Insert queries of product table */

	insert into  product(pro_ID,pro_NAME,pro_desc,cat_id) values(1,"GTA V","DFJDJFDJFDJFDJFJF",2);

	insert into  product(pro_ID,pro_NAME,pro_desc,cat_id) values(2,"TSHIRT","DFDFJDFJDKFD",5);

	insert into  product(pro_ID,pro_NAME,pro_desc,cat_id) values(3,"ROG LAPTOP","DFNTTNTNTERND",4);

	insert into  product(pro_ID,pro_NAME,pro_desc,cat_id) values(4,"oats","REURENTBTOTH",3);

	insert into  product(pro_ID,pro_NAME,pro_desc,cat_id) values(5,"harry potter","NBEMCTHTJTH",1);

/* Insert queries of productDetails table */

	insert into  productdetails(prod_ID,pro_id,supp_id,price) values(1,1,2,1500);

	insert into  productdetails(prod_ID,pro_id,supp_id,price) values(2,3,5,30000);

	insert into  productdetails(prod_ID,pro_id,supp_id,price) values(3,5,1,3000);

	insert into  productdetails(prod_ID,pro_id,supp_id,price) values(4,2,3,2500);

	insert into  productdetails(prod_ID,pro_id,supp_id,price) values(5,4,1,1000);

/* Insert queries of orders table */

	insert into orders(ord_ID,ord__amount,ord_date,cus_id,prod_id) values(20,1500,"2021-10-12",3,5);

	insert into  orders(ord_ID,ord__amount,ord_date,cus_id,prod_id) values(25,30500,"2021-09-16",5,2);

	insert into  orders(ord_ID,ord__amount,ord_date,cus_id,prod_id) values(26,2000,"2021-10-05",1,1);

	insert into  orders(ord_ID,ord__amount,ord_date,cus_id,prod_id) values(30,3500,"2021-08-16",4,3);

	insert into  orders(ord_ID,ord__amount,ord_date,cus_id,prod_id) values(50,2000,"2021-10-06",2,1);

/* Insert queries of rating table */

	insert into  rat(rat_id,cus_ID,supp_id,Rat_ratstars) values(1,2,2,4);

	insert into  rat(rat_id,cus_ID,supp_id,Rat_ratstars) values(2,3,4,3);

	insert into  rat(rat_id,cus_ID,supp_id,Rat_ratstars) values(3,5,1,5);

	insert into  rat(rat_id,cus_ID,supp_id,Rat_ratstars) values(4,1,3,2);

	insert into  rat(rat_id,cus_ID,supp_id,Rat_ratstars) values(5,4,5,4);



/* Question 3: Display the number of the customer group by their genders who have placed any order of amount greater than or equal to Rs.3000. */

	 select c.cus_name,c.cus_gender,count(*) from customer c inner join orders o on c.cus_id=o.cus_id where o.ord__amount >= 3000 group by (c.cus_gender);

/* Question 4: Display all the orders along with the product name ordered by a customer having Customer_Id=2. */

	 select o.*,p.pro_name from orders o, product p,productdetails pd where o.cus_id=2 and pd.pro_id=p.pro_id and o.prod_id = pd.prod_id;
    
/* Question 5: Display the Supplier details who can supply more than one product. */
    
	select s.* from supplier s,productDetails pd where s.supp_id in(select pd.supp_id from productdetails pd group by pd.supp_id having count(pd.pro_Id)>1) group by s.supp_id;

/*Question 6: Find the category of the product whose order amount is minimum. */
    
	 select c.* from category c,product p, productdetails pd, orders o where c.cat_id=p.cat_id and pd.prod_id=o.prod_id having min(o.ord__amount);
     
/* Question 7: Display the Id and Name of the Product ordered after “2021-10-05”. */     

	 select p.pro_id,p.pro_name from product p, productdetails pd, orders o where pd.prod_id=o.prod_id and pd.pro_id=p.pro_id and o.ord_date>'2021-10-05';

/* Question 8: Display customer name and gender whose names start or end with character 'A'. */

	 select cus_name,cus_gender from customer where cus_name like 'A%' or cus_name like '%A';


/* Question 9: Create a stored procedure to display the Rating for a Supplier if any along with the Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average Supplier” else “Supplier should not be considered”.*/

	delimiter &&
	create procedure myProc3()
	begin
	select supplier.supp_id,supplier.supp_name,rat.rat_ratstars,
	case 
		when rat_ratstars>4 then 'genuinc supplier'
		when rat_ratstars>2 then 'average supplier'
	else
		'Supplier should not be considered'
	End as verdict from rat inner join supplier on supplier.supp_id=Rat.supp_id;
	end &&
	delimiter ;

	
	call myProc3()