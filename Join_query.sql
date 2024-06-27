-- Tạo bảng SALESMAN
CREATE TABLE SALESMAN (
    salesman_id SERIAL PRIMARY KEY,  -- SERIAL tự động tăng giá trị
    name VARCHAR(100),
    city VARCHAR(100),
    commission FLOAT
);

-- Tạo bảng customer
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,  -- SERIAL tự động tăng giá trị
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES SALESMAN (salesman_id)
);

CREATE table Orders (
	ord_no int primary key,
	purch_amt float,
	ord_date date,
	customer_id int,
	salesman_id int,
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (salesman_id) REFERENCES SALESMAN(salesman_id)
	
);

-- Thêm dữ liệu vào bảng SALESMAN
INSERT INTO SALESMAN (salesman_id, name, city, commission)
VALUES
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5006, 'Mc Lyon', 'Paris', 0.14),
    (5007, 'Paul Adam', 'Rome', 0.13),
    (5003, 'Lauson Hen', 'San Jose', 0.12);

-- Thêm dữ liệu vào bảng customer
INSERT INTO customer (customer_id, cust_name, city, grade, salesman_id)
VALUES
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3008, 'Julian Green', 'London', 300, 5002),
    (3004, 'Fabian Johnson', 'Paris', 300, 5006),
    (3009, 'Geoff Cameron', 'Berlin', 100, 5003),
    (3003, 'Jozy Altidor', 'Moscow', 200, 5007),
    (3001, 'Brad Guzan', 'London', NULL, 5005);
-- Thêm dữ liệu vào bảng Orders
INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (70002, 65.26, '2012-10-05', 3002, 5001),
    (70004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001),
    (70010, 1983.43, '2012-10-10', 3004, 5006),
    (70003, 2480.4, '2012-10-10', 3009, 5003),
    (70012, 250.45, '2012-06-27', 3008, 5002),
    (70011, 75.29, '2012-08-17', 3003, 5007),
    (70013, 3045.6, '2012-04-25', 3002, 5001);


select * from customer;


--- Trả về tên của salesman, tên của khách hàng sống cùng thành phố

Select SALESMAN.name AS "Salesman",
customer.cust_name,customer.city
FROM SALESMAN, customer
WHERE SALESMAN.city=customer.city;
select * from orders
--Trả về ord_no, purch_amt, cust_name, city của những đơn hàng có số 
--lượng(purch_amt) trong khoảng từ 500 tới 2000.
Select a.ord_no, a.purch_amt, b.cust_name,b.city
from Orders a, customer b
WHERE a.customer_id=b.customer_id
AND a.purch_amt Between 500 and 2000;

--Truy vấn những khách hàng và 
--người bán hàng tương ứng với khách hàng đó, trả về tên khách hàng, thành phố, tên 
--của người bán hàng và hoa hồng(commission)

select a.cust_name AS "Customer Name",
a.city, b.name AS "Salesman",b.commission
from customer a, salesman b
where b.salesman_id=a.salesman_id;

-- Câu này có 1 cách viết nữa là 
select a.cust_name AS "Customer Name",
a.city, b.name AS "Salesman",b.commission
from customer a
inner join salesman b 
on b.salesman_id=a.salesman_id;

--Sử dụng bảng Salesman và Customer, yêu cầu truy vấn những nhân viên bán hàng 
--đã nhận được hoa hồng hơn 12 phần trăm từ công ty. Trả về tên khách hàng, thành 
--phố, salesman, hoa hồng.

