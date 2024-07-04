CREATE TABLE Users(
    user_id SERIAL PRIMARY KEY,
	username VARCHAR(255),
	pasword VARCHAR(255),
	email VARCHAR(255),
	full_name VARCHAR(255),
	address TEXT,
	phone VARCHAR(20)
);
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name_product VARCHAR(255),
    description TEXT,
    price DOUBLE PRECISION,
    stock INT,
    category_id INT,
    brand_id INT,
    FOREIGN KEY (category_id) REFERENCES Category (category_id),
    FOREIGN KEY (brand_id) REFERENCES Brands (brand_id)
);

CREATE TABLE Category(
	category_id SERIAL PRIMARY KEY,
	name_category VARCHAR(255),
	description TEXT
);
CREATE TABLE Brands(
	brand_id SERIAL PRIMARY KEY,
	name_brand VARCHAR(255),
	description TEXT
);
CREATE TABLE Orders(
	order_id SERIAL PRIMARY KEY,
	user_id INT,
	total_amount DOUBLE PRECISION,
	status VARCHAR(50),
	create_at DATE
);
CREATE TABLE OrderItems(
	order_items_id SERIAL PRIMARY KEY,
	order_id INT,
	product_id INT,
	quantity INT,
	price DOUBLE PRECISION,
	FOREIGN KEY(order_id) REFERENCES Orders(order_id),
	FOREIGN KEY(product_id) REFERENCES Products(product_id)	
);
CREATE TABLE Reviews(
	review_id SERIAL PRIMARY KEY,
	product_id INT,
	user_id INT,
	rating INT,
	comment text,
	created_at DATE,
	FOREIGN KEY(product_id) REFERENCES Products(product_id),
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
);
CREATE TABLE ShoppingCart(
	cart_id SERIAL PRIMARY KEY,
	user_id INT,
	product_id INT,
	quantity INT,
	create_at DATE,
	FOREIGN KEY(product_id) REFERENCES Products(product_id),
	FOREIGN KEY(user_id) REFERENCES Users(user_id)
);