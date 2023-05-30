
create table if not exists customers(
	customer_id SERIAL primary key,
	first_name VARCHAR(25),
	last_name VARCHAR(50),
	email VARCHAR(50),
	serial_number INTEGER references cars(serial_number)
);
create table if not exists salesperson(
	salesperson_id SERIAL primary key,
	first_name VARCHAR(25),
	last_name VARCHAR(50),
	customer_id INTEGER
);

create table if not exists cars(
	car_id SERIAL primary key,
	customer_id INTEGER references customers(customer_id),
	type_car VARCHAR(255),
	serial_number INTEGER
);

alter table cars add constraint unique_serial_number unique (serial_number);

create table if not exists service (
    service_id SERIAL primary key,
    customer_id INTEGER references customers(customer_id),
    serial_number INTEGER references cars(serial_number)
);

create table if not exists car_dealership(
	history_record SERIAL primary key,
	salesperson_id INTEGER references salesperson(salesperson_id),
	service_id INTEGER references service(service_id)
);

create table if not exists repairs(
	repair_id SERIAL primary key,
	title VARCHAR(255),
	description VARCHAR(255),
	customer_id INTEGER references customers(customer_id)
);

create table if not exists mechanics(
	mechanics_id SERIAL primary key,
	staff_name VARCHAR(255),
	title VARCHAR(50),
	description VARCHAR(255),
	customer_id INTEGER references customers(customer_id)
);

create table if not exists invoice(
	invoice_id SERIAL primary key,
	repair_id INTEGER references repairs(repair_id),
	service_id INTEGER references service(service_id),
	transaction_id SERIAL 
);


