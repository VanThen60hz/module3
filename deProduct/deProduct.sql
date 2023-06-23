drop database if exists deproduct_management;
create database deproduct_management;
use deproduct_management;
create table category(
	id int primary key,
    category varchar(50)
);

create table product(
    id int auto_increment primary key,
    name varchar(50),
    price decimal,
    quantity int,
    color varchar(50),
    category_id int,
    foreign key (category_id) references category(id)
);

INSERT INTO `deproduct_management`.`category` (`id`, `category`) VALUES ('1 ', 'Phone');
INSERT INTO `deproduct_management`.`category` (`id`, `category`) VALUES ('2', 'Television');

INSERT INTO `deproduct_management`.`product` (`id`, `name`, `price`, `quantity`, `color`, `category_id`) VALUES ('1', 'iPhone 11', '799.0', '12', 'Purple, Yellow, Green', '1');
INSERT INTO `deproduct_management`.`product` (`id`, `name`, `price`, `quantity`, `color`, `category_id`) VALUES ('2', 'iPhone 11 Pro', '1100.0', '12', 'Green, Black, White', '1');
INSERT INTO `deproduct_management`.`product` (`id`, `name`, `price`, `quantity`, `color`, `category_id`) VALUES ('3', 'iPhone X', '794.0', '13', 'Coral, Black, Blue', '1');
INSERT INTO `deproduct_management`.`product` (`id`, `name`, `price`, `quantity`, `color`, `category_id`) VALUES ('4', 'Smart TV màn hình cong 4K UHD 49 inch RU7300', '10000000', '5', 'Black', '2');
INSERT INTO `deproduct_management`.`product` (`id`, `name`, `price`, `quantity`, `color`, `category_id`) VALUES ('5', 'SAMSUNG GALAXY S10 E', '420.0', '10', 'Prism White, Prism Blue, Ceramic Black', '1');
