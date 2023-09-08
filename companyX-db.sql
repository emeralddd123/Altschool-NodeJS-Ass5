use companyx;


CREATE TABLE IF NOT EXISTS  `Users` (
    `id` INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `contact` VARCHAR(255) NOT NULL,
    `gender` VARCHAR(255) NOT NULL,
    `phoneNumber` VARCHAR(255) NOT NULL,
    `is_staff` TINYINT(1) NOT NULL DEFAULT 0,
    `is_admin` TINYINT(1) NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS `Categorys` (
    `id` INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS `Products` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `price` DECIMAL(8, 2) NOT NULL,
    `quantity` INT NOT NULL,
    `available` TINYINT(1) NOT NULL DEFAULT 0,
    `size` ENUM('small', 'medium', 'large') NOT NULL,
    `created_at` DATETIME NOT NULL,
    `category_id` INT,
    FOREIGN KEY (category_id) REFERENCES Categorys(id)
);

CREATE TABLE IF NOT EXISTS `Orders` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `user_id` INT NOT NULL,
    `approval` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'False or True. Can only be modified by admins',
    `created_at` DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE IF NOT EXISTS `Order_items` (
    `id` INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `product_id` INT NOT NULL,
    `order_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `unit_price` DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Products(id),
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

