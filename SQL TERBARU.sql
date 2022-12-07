(##################################  DATABASES  ##################################;

show databases;
create database nama_table;
drop database nama_table;

show tables;
create table nama_table;
drop table nama_table;
truncate nama_table;

show engines;
engine = innodb;

describe products;
show create table nama_table;

alter table nama_table
	add column nama_column text,
    drop column nama,
    rename column nama to nama_baru,
    modify nama varchar(100) after jumlah,
    modify nama varchar(100) first;
    
alter table nama_table 
modify id int not null;

truncate barang;
)

(##################################  TABLE  #####################################;

create table barang
(
	id int not null,
    nama varchar(100),
    harga int not null default 0,
    jumlah int
) engine=innodb;

alter table nama_table
	add column nama_column text,
    drop column nama,
    rename column nama to nama_baru,
    modify nama varchar(100) after jumlah,
    modify nama varchar(100) first;

alter table barang
add column deskripsi text;
alter table barang
drop column salah;
alter table barang
modify nama varchar(200) first;
alter table barang
modify id int not null;
alter table barang 
modify nama varchar(200) not null;
alter table barang 
modify jumlah int not null default 0;
alter table barang 
modify harga int not null default 0;
alter table barang 
add waktu_dibuat TIMESTAMP not null default current_timestamp;
INSERT INTO barang(id,nama) values(1,'apel');       
)

(##################################  INSERT DATA  #################################;

create table products
(
	id varchar(10) not null,
    name varchar(100) not null,
    description text,
    price int unsigned not null,
    quantity int unsigned not null default 0,
    created_at timestamp not null default current_timestamp
) engine = innodb;


insert into products(id,name,price,quantity)values
	('p0001','mie ayam original',15000,100),
	('p0002','mie ayam original',20000,100),
    ('p0003','mie ayam spesial',30.000,100),
	('p0004','mie ayam ceker',40.000,100),
	('p0005','mie ayam original',50.000,100),
	('p0006','mie ayam tahu',60.000,100),
	('p0007','mie ayam tempe',70.000,100),
	('p0008','mie ayam telor',80.000,100),
	('p0009','mie ayam pangsit',90.000,100),
	('p0010','mie ayam jumbo',100.000,100),
	('p0011','mie ayam ceker',40.000,100),
	('p0012','mie ayam original',50.000,100),
	('p0013','mie ayam tahu',60.000,100),
	('p0014','mie ayam tempe',70.000,100),
	('p0015','mie ayam telor',80.000,100);
    )

(##################################  SELECT DATA  ##################################;
      
select id,name,quantity from products;
select*from products where quantity = 100;
select*from products where name= 'bakso';
select*from products where price= 100;
select*from products where id= 'p001';
)

(##################################  PRIMARY KEY  ####################################;

create table products
(
	id varchar(10) not null,
    name varchar(100) not null,
    description text,
    price int unsigned not null,
    quantity int unsigned not null default 0,
    created_at timestamp not null default current_timestamp,
    primary key(id)
) engine = innodb;

alter table products
add primary key (id);
alter table products
DROP primary key ;
)

(##################################  UPDATE DATA  ##############################;

alter table  products
	add column category enum('makanan','minuman','lain-lain')
		after name;

update products
set category ='makanan'
where id = 'p0001';

update products
	set category='makanan'
where id='p0009' OR id='p0013' OR id='p0014' OR id='p0015';

UPDATE daftar_dosen SET alamat ='Surabaya' WHERE
nama_dosen='Rubin Hadi' OR NIP_dosen='1080432007'
OR no_hp='0812345234';

UPDATE daftar_dosen SET alamat ='Bali' ORDER BY nama_dosen LIMIT 5;

UPDATE PRODUCTS
SET category='makanan'
WHERE id='p0001' OR id='p0002' OR id='p0003' OR id='p0004' OR id='p0005' OR id='p0006';


UPDATE PRODUCTS
SET name='Es Krim',
	category='lain-lain'
WHERE id='p0012' ;


)

(##################################  DELETE DATA  ##############################;

delete from nama_table
where id = 'p0009'
)

(##################################  ALIAS #############################;

select id 			as 'kode',
		name		as 'nama',
        category	as 'kategori',
		price		as 'harga',	
        quantity	as 'stok'
from products;

	select	p.id 		as 'kode',
			p.name		as 'nama',
		    p.category	as 'kategori',
			p.price		as 'harga',	
			p.quantity	as 'stok'
	from products as p;
    )
    
(##################################  WHERE OPERATOR ##########################;

=,sama dengan
<> atau != tidak sama dengan
<kurang dari
> lebih dari
<= kurang dari atau sama dengan
>= lebih dari atau sama dengan;

BENAR AND BENAR	=	BENAR
SALAH AND BENAR	=	SALAH
BENAR AND SALAH	=	SALAH
SALAH AND SALAH	=	SALAH

BENAR OR BENAR	=	BBENAR
SALAH OR BENAR	=	BENAR
BENAR OR SALAH	=	BENAR
SALAH OR SALAH	=	SALAH;

select*from products where quantity > 100;
select*from products where quantity >= 100 ;
select* from products where category != 'makanan';

select*from products where quantity =100 and price <= 50000;
select*from products where quantity =100 or price <50000;
select*from products where (category = 'makanan' or quantity > 500) and price > 20000; 
)

(WHERE OPERATOR
(################################ LIKE OPERATOR ##########WHERE OPERATOR ################;

like 'b%'  AWALAN B
LIKE '%A' AKHIRAN A
LIKE '%EKO%' BERISI EKO
NOT LIKE TIDAK LIKEE;

SELECT*FROM products where name like '%mie%';
)

(################################# NULL OPERATOR #########WHERE OPERATOR #################;

SELECT*FROM PRODUCTS WHERE description is null;
SELECT*FROM PRODUCTS WHERE description is not null;
)

(#############################BETWEEN OPERATOR ##########WHERE OPERATOR ################;

SELECT*FROM PRODUCTS WHERE PRICE BETWEEN 10000 AND 20000;
)

(########################## IN OPERATOR ############WHERE OPERATOR ##############;

SELECT*FROM PRODUCTS where category in ('makanan','minuman');
selecT*from products where category = 'makanan' or category = 'minuman';
SELECT*FROM PRODUCTS where category not in ('makanan','minuman');



)
)WHERE OPERATOR

(##################################  ORDER BY CLAUSE ##########################;

SELECT id,category,name,price FROM PRODUCTS order by category asc,price desc;
)

(##################################  LIMIT CLAUSE ###########ORDER BY CLAUSE###############;

select*from products order by id limit 5;
select*from products order by id limit 5,5;
select*from products order by id limit 10,5;
)

(##################################  SELECT DISTINCT DATA  ###########ORDER BY CLAUSE##############;

SELECT CATEGORY FROM products;
select distinct category from products;
)

(##################################  NUMERIC FUNCTION ##########################;

%, MOD		= BAGI
*			= KALI
+			= TAMBAH
-			= KURANG
-			= MINUS
/			= BAGI =KOMA

SELECT id,price DIV 1000 AS 'price in K'
FROM products;

SELECT id,name,price
FROM products 
where price DIV 1000 > 15;
)

(##################################  AUTO_INCREMENT #########################;

CREATE TABLE admin(
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    primary key(id)
) engine=innodb;

insert into admin(first_name,last_name)
values		('eko','julianto'),
			('ahmad','santoso'),
            ('adi','nugraha'),
            ('supri','yadi'),
			('joyo','wijoyo');

alter table admin
drop id;
alter table admin
add id int not null auto_increment primary key first;

SELECT LAST_INSERT_ID();
)

(##################################  FUNCTION STRING ##############################;

SELECT ID,
		LOWER(name) as 'name lower',
        UPPER(name) as 'upper name',
        LENGTH(name) as 'name length'
	from products;
    )
    
(##################################  DATE AND TIME ##############################;

SELECT id , created_at,
	extract(year from created_at) as year,
	extract(month from created_at) as month
from products;

select id, created_at, year(created_at), month(created_at) from products;
)

(##################################  FLOW CONTROL FUNCTION ##############################;
#########  CASEe  ########### ;

SELECT id,
	category,
	case category
		when 'makanan' then 'enak'
        when 'minuman' then 'segar'
        else 'apa itu?'
	end as 'category'
from products;

select*from products;

#########  IF  #############
select id,
	price,
	if(price <= 15000, 'murah', if( price <= 20000,'mahal','mahal banget')) as 'mahal?'
from products;

#######IFF NULLL#########
select id,name, ifnull(description,'kosong') from products;
)

(##################################  AGREGATE FUNCTION  ##############################;

SELECT COUNT(id) as 'Total Product' from products;
SELECT max(price) as 'Product Termahal' from products;
SELECT min(price) as 'Product Termurah' from products;
SELECT avg(price) as 'Rata Rata Harga' from products;
SELECT sum(quantity) as 'Total Stock' from products;
)

(##################################  GROUPING  ##############################;
######GROUP BY###########;
SELECT COUNT(id) as 'Total Product', category from products group by category;
SELECT max(price) as 'Product Termahal', category from products group by category;
SELECT min(price) as 'Product Termurah', category from products group by category;
SELECT avg(price) as 'Rata Rata Harga', category from products group by category;
SELECT sum(quantity) as 'Total Stock', category from products group by category;

#####HAVING CLAUSE#######;
SELECT 
    COUNT(id) AS total, category
FROM
    products
GROUP BY category
HAVING total > 2;
)

(##################################  CONSTRAINT  ###############################################;
##### UNIQUE_CONSTRAINT ########;

CREATE TABLE customers (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email)
)  ENGINE=INNODB;

alter table customers 
drop constraint email_unique;
alter table customers
add constraint email_unique unique (email);
insert into customers(email,first_name,last_name)
values	('kurni@gmail.com','eko','kuriawan');

##########################  CHECK_CONSTRAINT  ###########;

create tabLe products
        (
			id			varchar(10) 	NOT NULL,
            name 		varchar(100) 	NOT NULL,
            DESCRIPTION	TEXT,
            PRICE		INT UNSIGNED	NOT NULL,
            QUANTITY	INT UNSIGNED	NOT NULL default 0,
            created_at	TIMESTAMP		NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (ID),
            CONSTRAINT	price_check CHECK ( price >= 1000 )
		) ENGINE = INNODB;

ALTER TABLE PRODUCTS
ADD CONSTRAINT price_check CHECK (price>=1000);
ALTER TABLE products
	DROP CONSTRAINT price_check;

insert into products(id,name,category,price,quantity)
values('p0016','permen','lain-lain',500,1000);
UPDATE products
set price=1000
where id= 'p0016';
)

(##################################  INDEX  ###################################################;

CREATE TABLE sellers(
	id int not null auto_increment,
    name varchar(100) not null,
    email varchar(100) not null,
    primary key(id),
    unique key email_unique (email),
    index name_index (name)
) engine =innodb;

alter table sellers
drop index name_index;

alter table sellers
add index name_index (name);
hati hati jika data banyak;
)

(##################################  FULL TEXT SEARCH  ##################################;

create table products
(
	id 			varchar(10)		not null,
    name 		varchar(100)	not null,
    description	text,
    price 		int unsigned	not null,
    quantity 	int unsigned	not null default 0,
	created_at	timestamp		not null default current_timestamp,
    primary key(id),
    fulltext product_search (name,description)
) engine = innodb;

alter table products
	add fulltext product_fulltext (name,description);
alter table products
	drop index product_fulltext;
    
###############natural language,boolean,query expansion############NATURAL LANGUANGE MODE
#BOOLEAN MODE#

select*
from products
where name like '%ayam%'
	or description like '%ayam%';
    
select*
from products
where match(name,description)
			against('ayam' in natural language mode);
select*
from products
where MATCH(name, description)
			AGAINST('+ayam -bakso' in boolean mode);
select*
from products
where MATCH(name, description)
			AGAINST('bakso' with query expansion);
)

























(
TABLE RELATIONSHIP;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CREATE TABLE wishlist
(
	id			int 		not null auto_increment,
    id_product	varchar(10)	not null,
    description	text,
    primary key(id),
    constraint fk_wishist_product
		foreign key (id_product) references products (id)
)engine = innodb;

ALTER TABLE wishlist
DROP CONSTRAINT fk_wishist_product;

alter table wishlist
	add constraint fk_wishlist_product
		foreign key (id_product) references products(id);
        
        

show tables;
describe wishlist;
show create table wishlist;
select*from wishlist;

insert into wishlist(id_product,description)
values('salah','makanan kesukaan');

)
2111005