#####################################  TABLE RELATIONSHIP  ###############################

####################  FOREIGN KEY ############
CREATE TABLE wishlist
(
	id			int 		not null auto_increment,
    id_product	varchar(10)	not null,
    description	text,
    primary key(id),
    constraint fk_wishist_product
		foreign key (id_product) references products (id)
)engine = innodb;

alter table wishlist
	DROP CONSTRAINT fk_wishist_product;
alter table wishlist
	ADD CONSTRAINT fk_wishlist_product
		foreign key (id_product) references products(id);
        
INSERT INTO wishlist(id_product,description)
values('salah','makanan kesukaan');     

delete from products
where id='p0001';

#				#BEHAVIOR		#ON DELETE		#ON UPDATE
##DEFAULT		Restrict		Di tolak		Ditolak
#				Cascade			Data dihapus	Data ihapus
#                No Action		Data dibiarkan	Data dibiarkan
#                Set Null		Data jadi Null	Data jadi Null
            
            
alter table wishlist
	DROP CONSTRAINT fk_wishlist_product;
    
alter table wishlist
	ADD CONSTRAINT fk_wishList_product
		foreign key (id_product) references products(id)
			ON DELETE CASCADE ON UPDATE CASCADE;
            
            SHOW CREATE TABLE wishlist;
            desc wishlist;
            
select*from products;
            
insert into products(id,name,category,price,quantity)values
	('pxxxx','Contoh','lain-lain',1000,1000);
            

INSERT INTO wishlist(id_product,description)
values('pxxxx','makanan kesukaan');     		
            
delete from products
where id='pxxxx';



########################################  JOIN  ########################################

SELECT*FROM wishlist
JOIN products ON (wishlist.id_product = products.id);

            
SELECT wishlist.id, products.id, products.name, wishlist.description
FROM wishlist
JOIN products ON (wishlist.id_product = products.id);

SELECT w.id AS id_wistlist,
	p.id AS id_product, 
	p.name AS product_name, 
    w.description AS wishlist_description
FROM wishlist AS w
JOIN products AS p ON (w.id_product = p.id);

####################### MEMBUAT RELLASI KE TABLE CUSTOMERS ##################

DESC CUSTOMERS;

ALTER TABLE wishlist
ADD column id_customer INT;

            DESC wishlist;
            
            ALTER TABLE wishlist 
            ADD constraint fk_wishlist_customer
            FOREIGN KEY(id_customer) REFERENCES customers(id);
            
            show create table wishlist;
            select*from wishlist;
            select*from customers;
            
            Update wishlist
            set id_customer=1
            where id=1;
            
            select*from wishlist;
            
SELECT customers.email, products.id, products.name, wishlist.description
from wishlist
JOIN products ON (products.id = wishlist.id_product)
JOIN customers ON (customers.id = wishlist.id_customer);


########################  ONE TO ONE RELATIONSHIP #####################;

create TABLE wallet
(
	id			INT NOT NULL AUTO_INCREMENT,
    id_customer	INT NOT NULL,
    balance 	INT NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    UNIQUE KEY fk_id_customer_unique (id_customer),
    FOREIGN KEY fk_wallet_customer	(id_customer) REFERENCES customers(id)
)ENGINE = innodb;

desc wallet;

select*from customers;

insert into wallet(id_customer) values (1),(2);

select*from wallet;

select customers.email, wallet.balance
from wallet join customers on (wallet.id_customer = customers.id);


###########################  ONE TO MANY RELATIOSHIP  ########################

CREATE TABLE category
(
	id		varchar(10) not null,
    name	varchar(100) not null,
    primary key (id)
) engine =innodb;

desc category;

ALTER TABLE products
drop column category;

desc products;                        

ALter table products
add column id_category varchar(10);

desc products;                        

DROP TABLE category;

CREATE TABLE categories
(
	id		varchar(10) not null,
    name	varchar(100) not null,
    primary key (id)
) engine =innodb;
            
desc categories;

ALTER TABLE products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (id_category) REFERENCES categories(id);
            
show create table products;            
            
select*from products;

insert into categories(id,name) values  ('c0001','makanan'),
										('c0002','minuman'),
                                        ('c0003','lain-lain');
										
UPDATE products
SET id_category='c0001'
where id in ('p0001','p0002','p0003','p0004','p0005','p0006','p0009','p0013','p0014','p0015');
            
select*from products;

UPDATE products
SET id_category='c0002'
where id in ('p0007','p0008');

select*from products;


UPDATE products
SET id_category='c0003'
where id in ('p0010','p0011','p0012','p0016');

select*from products;

select products.id, products.name, categories.name
from products
join  categories on (categories.id = products.id_category);


################################### MANY TO MANY RELATION SHIP  #################################

create table orders(
	id int not null auto_increment,
    total int not null,
    order_date datetime not null  default current_timestamp,
    primary key(id)
)engine=innodb;

desc orders;

create table orders_detail(
id_product	varchar(10)	not null,
id_order	int			not null,
price		int			not null,
quantity	int			not null,
primary key(id_product,id_order)
)engine=innodb;

desc orders_detail;

alter table orders_detail
add constraint fk_orders_detail_product
foreign key (id_product) references products(id);

alter table orders_detail
add constraint fk_orders_detail_orders
foreign key (id_order) references orders(id);

show create table orders_detail;

select*from orders;

insert into orders(total) 
values (50000);

select*from orders;
select*from products;

insert into orders_detail (id_product,id_order,price,quantity)
values	
('p0001',1,25000,1),
('p0002',1,25000,1);

insert into orders_detail (id_product,id_order,price,quantity)
values	
('p0003',2,25000,1),
('p0004',3,25000,1);

insert into orders_detail (id_product,id_order,price,quantity)
values	
('p0001',2,25000,1),
('p0003',3,25000,1);

truncate orders_detail;

select*from orders_detail;	

select*from orders 
join orders_detail on (orders_detail.id_order = orders.id);

select*from orders 
join orders_detail on (orders_detail.id_order = orders.id)
join products on (orders_detail.id_product = products.id);

select orders.id, products.id, products.name, orders_detail.quantity, orders_detail.price from orders 
join orders_detail on (orders_detail.id_order = orders.id)
join products on (orders_detail.id_product = products.id);

###############################   JENIS-JENIS JOIN   ##############################





