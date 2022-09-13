---------------------------------------
--  DDL for schema eshop_db
---------------------------------------
DROP SCHEMA IF EXISTS eshop_db;
CREATE SCHEMA IF NOT EXISTS eshop_db;

---------------------------------------
--  DDL for Table users
---------------------------------------
DROP TABLE IF EXISTS eshop_db.users;
CREATE TABLE IF NOT EXISTS eshop_db.users
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(60) NOT NULL,
    password VARCHAR(100) NOT NULL,
    role INT NOT NULL,
    PRIMARY KEY(id));

---------------------------------------
--  DDL for Table role
---------------------------------------
DROP TABLE IF EXISTS eshop_db.roles;
CREATE TABLE IF NOT EXISTS eshop_db.roles
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(id));

---------------------------------------
--  DDL for Table categories
---------------------------------------
DROP TABLE IF EXISTS eshop_db.categories;
CREATE TABLE IF NOT EXISTS eshop_db.categories
(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    rating DOUBLE NOT NULL,
    PRIMARY KEY(id));

---------------------------------------
--  DDL for Table products
---------------------------------------
DROP TABLE IF EXISTS eshop_db.products;
CREATE TABLE IF NOT EXISTS eshop_db.products
(
    id INT NOT NULL AUTO_INCREMENT,
    category_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(500) NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT products_category_id_categories_id
    FOREIGN KEY(category_id) REFERENCES eshop_db.categories(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

---------------------------------------
--  DDL for Table images
---------------------------------------
DROP TABLE IF EXISTS eshop_db.images;
CREATE TABLE IF NOT EXISTS eshop_db.images
(
    id INT NOT NULL AUTO_INCREMENT,
    category_id INT,
    product_id INT,
    image_path VARCHAR(100) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT images_category_id_categories_id
    FOREIGN KEY(category_id) REFERENCES eshop_db.categories(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT images_product_id_products_id
    FOREIGN KEY(product_id) REFERENCES eshop_db.products(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

---------------------------------------
--  DDL for Table orders
---------------------------------------
DROP TABLE IF EXISTS eshop_db.orders;
CREATE TABLE IF NOT EXISTS eshop_db.orders
(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_price INT NOT NULL,
    date DATETIME NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT orders_user_id_user_id
    FOREIGN KEY(user_id) REFERENCES eshop_db.users(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

---------------------------------------
--  DDL for Table order_products
---------------------------------------
DROP TABLE IF EXISTS eshop_db.order_products;
CREATE TABLE IF NOT EXISTS eshop_db.order_products
(
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY(order_id, product_id),
    CONSTRAINT order_products_order_id_order_id
    FOREIGN KEY(order_id) REFERENCES eshop_db.orders(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

--------------------------------------------------------
--  DML for Table eshop_db.categories
--------------------------------------------------------

INSERT INTO eshop_db.categories (name, rating) VALUES ('Мобильные телефоны', 3);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Наушники', 3);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Ноутбуки', 3);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Телевизоры', 3);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Фотоаппараты', 3);
INSERT INTO eshop_db.categories (name, rating) VALUES ('GPS Навигаторы', 3);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Фитнес браслеты', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Холодильники', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Стиральные машины', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Роботы пылесосы', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Утюги', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Кондиционеры', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Микроволновые печи', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Автомобили', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Велосипеды', 5);
INSERT INTO eshop_db.categories (name, rating) VALUES ('Электросамокаты', 5);

--------------------------------------------------------
--  DML for Table eshop_db.products
--------------------------------------------------------
INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'HONOR X8', 'Android, экран 6.7" IPS (1080x2388), Qualcomm Snapdragon 680, ОЗУ 6 ГБ, флэш-память 128 ГБ, камера 64 Мп', 790);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Huawei nova Y70', 'Android, экран 6.76" TFT (720x1600), HiSilicon Kirin 710, ОЗУ 4 ГБ, флэш-память 128 ГБ, карты памяти, камера 48 Мп, аккумулятор 6000 мАч', 599);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Xiaomi Redmi 9A', 'Android, экран 6.53" IPS (720x1600), Mediatek Helio G25, ОЗУ 2 ГБ, флэш-память 32 ГБ, карты памяти, камера 13 Мп, аккумулятор 5000 мАч, 2 SIM', 299);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone 13', 'Apple iOS, экран 6.1, OLED (1170x2532), Apple A15 Bionic, ОЗУ 4 ГБ, флэш-память 128 ГБ, камера 12 Мп, аккумулятор 3227 мАч, 1 SIM', 2420);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone 11', 'Apple iOS, экран 6.1" IPS (828x1792), Apple A13 Bionic, ОЗУ 4 ГБ, флэш-память 64 ГБ, камера 12 Мп, аккумулятор 3046 мАч, 1 SIM, влагозащита IP68', 1689);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone 13 Pro', 'Apple iOS, экран 6.1" OLED (1170x2532), Apple A15 Bionic, ОЗУ 6 ГБ, флэш-память 128 ГБ, камера 12 Мп, аккумулятор 3095 мАч, 1 SIM, влагозащита IP68', 3085);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Xiaomi Redmi Note 11', 'Android, экран 6.43" AMOLED (1080x2400), Qualcomm Snapdragon 680, ОЗУ 6 ГБ, флэш-память 128 ГБ, карты памяти, камера 50 Мп, аккумулятор 5000 мАч, 2 SIM, влагозащита IP53', 660);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone 12', 'Apple iOS, экран 6.1" OLED (1170x2532), Apple A14 Bionic, ОЗУ 4 ГБ, флэш-память 64 ГБ, камера 12 Мп, аккумулятор 2815 мАч, 1 SIM, влагозащита IP68', 1950);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Xiaomi Redmi Note 11 Pro', 'Android, экран 6.67" AMOLED (1080x2400), Qualcomm Snapdragon 695, ОЗУ 8 ГБ, флэш-память 128 ГБ, карты памяти, камера 108 Мп', 950);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone 13 Pro Max', 'Apple iOS, экран 6.7" OLED (1284x2778), Apple A15 Bionic, ОЗУ 6 ГБ, флэш-память 128 ГБ, камера 12 Мп, аккумулятор 4352 мАч, 1 SIM, влагозащита IP68', 3390);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Xiaomi 11T', 'Android, экран 6.67" AMOLED (1080x2400), Mediatek MT6893 Dimensity 1200, ОЗУ 8 ГБ, флэш-память 256 ГБ, камера 108 Мп, аккумулятор 5000 мАч', 1170);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Samsung Galaxy A52', 'Android, экран 6.5" AMOLED (1080x2400), Qualcomm Snapdragon 720G, ОЗУ 8 ГБ, флэш-память 256 ГБ, карты памяти, камера 64 Мп, аккумулятор 4500 мАч, 2 SIM', 1050);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone SE 2022', 'Apple iOS, экран 4.7" IPS (750x1334), Apple A15 Bionic, ОЗУ 4 ГБ, флэш-память 64 ГБ, камера 12 Мп, аккумулятор 2018 мАч, 1 SIM, влагозащита IP67', 1290);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Xiaomi Redmi Note 10 Pro', 'Android, экран 6.67" AMOLED (1080x2400), Qualcomm Snapdragon 732G, ОЗУ 8 ГБ, флэш-память 128 ГБ, карты памяти, камера 108 Мп, аккумулятор 5020 мАч, 2 SIM', 780);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Samsung Galaxy S22', 'Android, экран 6.1" AMOLED (1080x2340), Exynos 2200, ОЗУ 8 ГБ, флэш-память 128 ГБ, камера 50 Мп, аккумулятор 3700 мАч, 2 SIM', 2270);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Samsung Galaxy S21', 'Android, экран 6.4" AMOLED (1080x2340), Qualcomm Snapdragon 888, ОЗУ 6 ГБ, флэш-память 128 ГБ, камера 12 Мп, аккумулятор 4500 мАч, 2 SIM', 1660);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone XR', 'Apple iOS, экран 6.1" IPS (828x1792), Apple A12 Bionic, ОЗУ 3 ГБ, флэш-память 64 ГБ, камера 12 Мп, аккумулятор 2942 мАч, 1 SIM, влагозащита IP67', 1499);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone 13 mini', 'Apple iOS, экран 5.4" OLED (1080x2340), Apple A15 Bionic, ОЗУ 4 ГБ, флэш-память 128 ГБ, камера 12 Мп, 1 SIM, влагозащита IP68', 2450);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone 12 mini', 'Apple iOS, экран 5.4" OLED (1080x2340), Apple A14 Bionic, ОЗУ 4 ГБ, флэш-память 64 ГБ, камера 12 Мп, 1 SIM, влагозащита IP68', 1999);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Samsung Galaxy A53', 'Android, экран 6.5" AMOLED (1080x2400), Exynos 1280, ОЗУ 6 ГБ, флэш-память 128 ГБ, карты памяти, камера 64 Мп, аккумулятор 5000 мАч, 2 SIM, влагозащита IP67', 1130);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone 12 Pro', 'Apple iOS, экран 6.1" OLED (1170x2532), Apple A14 Bionic, ОЗУ 6 ГБ, флэш-память 128 ГБ, камера 12 Мп, аккумулятор 2775 мАч, 1 SIM, влагозащита IP68', 2890);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'POCO M4 Pro', 'Android, экран 6.6" IPS (1080x2400), Mediatek Dimensity 810, ОЗУ 6 ГБ, флэш-память 128 ГБ, карты памяти, камера 50 Мп, аккумулятор 5000 мАч, 2 SIM, влагозащита IP53', 750);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Apple iPhone SE', 'Apple iOS, экран 4.7" IPS (750x1334), Apple A13 Bionic, ОЗУ 3 ГБ, флэш-память 64 ГБ, камера 12 Мп, аккумулятор 1820 мАч, 1 SIM, влагозащита IP67', 1200);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Xiaomi Redmi 10C NFC', 'Android, экран 6.71" IPS (720x1650), Qualcomm Snapdragon 680, ОЗУ 4 ГБ, флэш-память 128 ГБ, карты памяти, камера 50 Мп, аккумулятор 5000 мАч, 2 SIM', 539);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Samsung Galaxy A53 5G SM-A5360', 'Android, экран 6.5" AMOLED (1080x2400), Exynos 1280, ОЗУ 8 ГБ, флэш-память 128 ГБ, карты памяти, камера 64 Мп, аккумулятор 5000 мАч, 2 SIM, влагозащита IP67', 1199);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Samsung Galaxy A32 SM-A325F/DS', 'Android, экран 6.4" AMOLED (1080x2400), Mediatek Helio G80, ОЗУ 4 ГБ, флэш-память 64 ГБ, карты памяти, камера 64 Мп, аккумулятор 5000 мАч, 2 SIM', 799);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'HONOR X8', 'Android, экран 6.7" IPS (1080x2388), Qualcomm Snapdragon 680, ОЗУ 6 ГБ, флэш-память 128 ГБ, камера 64 Мп, аккумулятор 4000 мАч, 2 SIM', 790);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Xiaomi Mi 11 Ultra', 'Android, экран 6.81" AMOLED (1440x3200), Qualcomm Snapdragon 888, ОЗУ 12 ГБ, флэш-память 256 ГБ, камера 50 Мп, аккумулятор 5000 мАч, 2 SIM, влагозащита IP68', 2400);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'POCO F3', 'Android, экран 6.67" AMOLED (1080x2400), Qualcomm Snapdragon 870, ОЗУ 8 ГБ, флэш-память 256 ГБ, камера 48 Мп, аккумулятор 4520 мАч, 2 SIM, влагозащита IP53', 1200);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Xiaomi Redmi 10', 'Android, экран 6.67" AMOLED (1080x2400), Qualcomm Snapdragon 870, ОЗУ 8 ГБ, флэш-память 256 ГБ, камера 48 Мп, аккумулятор 4520 мАч, 2 SIM, влагозащита IP53', 549);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (1, 'Samsung Galaxy S21', 'Android, экран 6.2" AMOLED (1080x2400), Exynos 2100, ОЗУ 8 ГБ, флэш-память 256 ГБ, камера 64 Мп, аккумулятор 4000 мАч, 2 SIM, влагозащита IP68', 2330);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (2, 'HONOR Earbuds 2 Lite', 'беспроводные наушники с микрофоном, внутриканальные, портативные, Bluetooth, 20-20000 Гц, быстрая зарядка, время работы 10 ч, с кейсом 32 ч, активное шумоподавление', 199);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (2, 'Huawei FreeBuds Lipstick', 'беспроводные наушники с микрофоном, вставные, портативные, Bluetooth, 20-20000 Гц, время работы 4 ч, с кейсом 22 ч, активное шумоподавление', 517);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (2, 'Razer Kraken X Lite', 'наушники с микрофоном, мониторные (охватывающие), геймерские, 12-28000 Гц, кабель 1.3 м', 105);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (2, 'Canyon CNE-CBTHS1B', 'беспроводные наушники с микрофоном, внутриканальные, портативные, Bluetooth, время работы 4 ч, 12-28000 Гц, кабель 1.3 м', 36);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (2, 'Venso Superia TW-30', 'беспроводные наушники с микрофоном, внутриканальные, портативные, Bluetooth, 10-25000 Гц, время работы 6 ч, с кейсом 35 ч', 54);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (3, 'HP 255 G8', '15.6, 1920 x 1080 IPS, 60 Гц, несенсорный, AMD Athlon Silver 3050U 2300 МГц, 8 ГБ DDR4, SSD 256 ГБ, видеокарта встроенная, без ОС, цвет крышки серебристый', 1448);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (3, 'Lenovo IdeaPad 3', '15.6, 1920 x 1080 IPS, 60 Гц, несенсорный, AMD Ryzen 3 5300U 2600 МГц, 8 ГБ DDR4, SSD 256 ГБ, видеокарта встроенная, без ОС, цвет крышки серый', 1790);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (3, 'HP Pavilion 15', '15.6, 1920 x 1080 IPS, 60 Гц, несенсорный, AMD Ryzen 5 5500U 2100 МГц, 8 ГБ DDR4, SSD 512 ГБ, видеокарта встроенная, без ОС, цвет крышки синий', 2499);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (3, 'HP Pavilion 14', '14.0" 1920 x 1080 IPS, 60 Гц, несенсорный, Intel Core i3 1115G4 3000 МГц, 8 ГБ DDR4, SSD 256 ГБ, видеокарта встроенная, без ОС, цвет крышки серебристый', 1990);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (3, 'Apple Macbook Air 13', '13.3" 2560 x 1600 IPS, 60 Гц, несенсорный, Apple M1 3200 МГц, 8 ГБ, SSD 256 ГБ, видеокарта встроенная, Mac OS, цвет крышки серый', 3300);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (4, 'Xiaomi MI TV P1 50', '50" 3840x2160 (4K UHD), частота матрицы 60 Гц, Smart TV (Android TV), HDR, Wi-Fi', 1552);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (4, 'Blaupunkt 32WB965', '32" 1366x768 (HD), матрица VA, частота матрицы 60 Гц', 469);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (4, 'LG 55NANO766QA', '55" 3840x2160 (4K UHD), частота матрицы 60 Гц, Smart TV (LG webOS), HDR, Wi-Fi', 2290);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (4, 'LG C2 OLED55C24LA', '55" 3840x2160 (4K UHD), матрица OLED, частота матрицы 120 Гц, Smart TV (LG webOS), HDR, Wi-Fi', 4900);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (4, 'iFFALCON iFF43Q71', '43" 3840x2160 (4K UHD), частота матрицы 60 Гц, Smart TV (Android TV), HDR, Wi-Fi', 1599);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (5, 'Canon EOS R6', 'беззеркальная камера, байонет Canon RF, матрица Full frame (полный кадр) 20.1 Мп, без объектива (body), Wi-Fi, два слота для карт памяти', 7600);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (5, 'Sony Alpha a7', 'беззеркальная камера, байонет Sony E, матрица Full frame (полный кадр) 24.2 Мп, без объектива (body), Wi-Fi, два слота для карт памяти', 6650);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (5, 'Canon EOS 6D', 'зеркальная камера, байонет Canon EF, матрица Full frame (полный кадр) 26 Мп, без объектива (body), Wi-Fi', 3640);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (5, 'Fujifilm Instax Mini 11', 'камера для мгновенной печати', 380);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (5, 'Canon EOS 2000D Kit 18-55mm IS II', 'зеркальная камера, байонет Canon EF-S, матрица APS-C (1.6 crop) 24.1 Мп, с объективом F3.5-5.6 18-55 мм, Wi-Fi', 1550);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (6, 'Roadmax Uno', 'экран 7, TFT (800 x 480), ОЗУ 256 Мб, флэш-память 8 Гб, Windows CE 6.0', 199);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (6, 'NAVITEL E707', 'экран 7, TFT (800 x 480), процессор MStar MSB2531 800 МГц, флэш-память 8 Гб, Linux', 349);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (6, 'GEOFOX MID743GPS', 'экран 7, IPS (1024 x 600), процессор MediaTek MT8321 1300 МГц, ОЗУ 1 Гб, флэш-память 32 Гб, 3G, камера 5 Мп, Android 6.0 Marshmallow', 259);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (6, 'Garmin Drive 61 LMT-S', 'экран 6.1" TFT (800 x 480)', 462);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (6, 'NAVITEL C500', 'экран 5" TFT (480 x 272), ОЗУ 128 Мб, флэш-память 4 Гб, Windows CE 6.0', 154);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (7, 'HONOR Band 6', 'фитнес-браслет, поддержка Android/iOS, экран AMOLED 1.47" (368х194, сенсорный), шагомер, пульсометр, время работы: 2 недели, корпус: пластик, браслет: силикон', 130);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (7, 'Huawei Watch GT 3 Pro Ceramic', 'часы-компаньон, поддержка Android/iOS, экран AMOLED 1.32" (466x466, сенсорный), шагомер, пульсометр, время работы: 2 недели, корпус: керамика, браслет: керамика', 1349);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (7, 'Elari Kidphone Fresh', 'детские часы-телефон, поддержка Android/iOS, экран IPS, шагомер, время работы: 3 суток, корпус: пластик, браслет: силикон', 169);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (7, 'Canyon Sandy KW-34', 'детские часы-телефон, поддержка Android/iOS, экран TFT 1.44" (128x128, сенсорный), шагомер, время работы: 2 суток, корпус: пластик, браслет: силикон', 90);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (7, 'Elari FixiTime Fun', 'детские часы-телефон, поддержка Android/iOS, экран TFT 1.4" (128x128, сенсорный), шагомер, корпус: пластик, браслет: силикон', 116);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (8, 'ATLANT ХМ', 'встраиваемый, без No Frost, механическое управление, класс A, полезный объём: 234 л (167 + 67 л), перенавешиваемые двери, лоток для яиц, 54x56x178 см, белый', 1250);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (8, 'Samsung RB33A3440WW/WT', 'отдельностоящий, полный No Frost, электронное управление, класс A+, полезный объём: 328 л (230 + 98 л), инверторный компрессор, перенавешиваемые двери, выдвижная полка, складная полка, лоток для яиц, 59.5x67.5x185 см, белый', 2148);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (8, 'Bosch Series 6', 'отдельностоящий, полный No Frost, электронное управление, класс A++, полезный объём: 388 л (280 + 108 л), инверторный компрессор, зона свежести, перенавешиваемые двери, складная полка, полка для вина, лоток для яиц, 60x66x203 см, белый', 2483);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (8, 'Nordfrost (Nord) NR 403 AW', 'отдельностоящий, без No Frost, механическое управление, класс A+, полезный объём: 104 л, перенавешиваемые двери, лоток для яиц, 50x53x86 см, белый', 499);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (8, 'Olto RF-050', 'отдельностоящий, без No Frost, механическое управление, класс A+, перенавешиваемые двери, лоток для яиц, 42.4x43.5x50.6 см, серебристый', 370);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (9, 'ATLANT СМА 60У1213-01', 'отдельностоящая, автоматическая стиральная машина, загрузка до 6 кг, отжим 1200 об/мин, глубина 40.6 см (с люком 48.9 см), энергопотребление A+++, 16 программ', 1067);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (9, 'LG F2V5HG0W', 'отдельностоящая, стирально-сушильная машина, с паром, загрузка до 7 кг, отжим 1200 об/мин, глубина 45 см (с люком 49.5 см), энергопотребление B, прямой привод, защита от протечек, 14 программ', 2149);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (9, 'Bosch WLP20265BL', 'отдельностоящая, автоматическая стиральная машина, загрузка до 6.5 кг, отжим 1000 об/мин, глубина 44.6 см (с люком 48.8 см), энергопотребление A+++, защита от протечек, 15 программ', 1799);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (9, 'Bosch WHA122XEBL', 'отдельностоящая, автоматическая стиральная машина, загрузка до 7 кг, отжим 1200 об/мин, глубина 44.6 см (с люком 48.8 см), энергопотребление A+++, защита от протечек, Aquastop, 14 программ', 1959);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (9, 'Electrolux EW7WR447W', 'отдельностоящая, стирально-сушильная машина, с паром, загрузка до 7 кг, отжим 1400 об/мин, глубина 54.7 см (с люком 57.6 см), энергопотребление A, защита от протечек, 14 программ', 4190);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (10, 'AENO RC2S', 'влажная уборка, мощность 28 Вт, пылесборник 0.6 л, навигация: лидар (LDS), контактный бампер, датчики перепада высоты', 859);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (10, 'Dreame D9', 'влажная уборка, Mi Home/Яндекс Алиса, мощность 40 Вт, сила всасывания 3000 Па, пылесборник 0.57 л, с турбощеткой (разборная), навигация: контактный бампер, лидар (LDS), датчики перепада высоты, план нескольких этажей', 819);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (10, 'Dreame F9', 'влажная уборка, Mi Home/Яндекс Алиса, мощность 40 Вт, сила всасывания 2500 Па, пылесборник 0.6 л, с турбощеткой (разборная), навигация: контактный бампер, камера VSLAM, датчики перепада высоты', 649);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (10, 'iBoto Modern Frodo Smart L925 Aqua', 'влажная уборка, Яндекс Алиса/Amazon Echo/Google Home/фирменное приложение, мощность 50 Вт, сила всасывания 5000 Па, пылесборник 0.25 л, с турбощеткой, навигация: контактный бампер, лидар (LDS), датчики перепада высоты, план нескольких этажей, база самоочистки', 1340);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (10, 'Xiaomi Mi Robot Vacuum-Mop Essential MJSTG1', 'влажная уборка, Mi Home/Яндекс Алиса, сила всасывания 2200 Па, пылесборник 0.6 л, с турбощеткой (неразборная), навигация: контактный бампер, датчики перепада высоты', 465);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (11, 'Philips GC1758/80', '2000 Вт, с пароувлажнением, постоянная подача пара', 124);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (11, 'Aresa AR-3124', '2350 Вт, с пароувлажнением, постоянная подача пара', 123);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (11, 'Braun TexStyle 9 SI9188EBK', '2800 Вт, с пароувлажнением, подошва Eloxal Plus, постоянная подача пара', 356);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (11, 'Tefal FV2839E0', '2400 Вт, с пароувлажнением, постоянная подача пара', 255);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (11, 'Braun CareStyle 7 IS 7156 BK', '2400 Вт, с парогенератором, подошва Eloxal 3D Plus, постоянная подача пара', 1030);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (12, 'Gree Pular Inverter R32', 'инвертор, мощность охлаждения 2.65 кВт, мощность обогрева 2.85 кВт, обслуживаемая площадь 30 м?, шум 21-38 дБ, Wi-Fi: есть', 2376);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (12, 'LG Evo Max DC09RH', 'инвертор, мощность охлаждения 2.5 кВт, мощность обогрева 3.2 кВт, обслуживаемая площадь 25 м?, шум 22-42 дБ, Wi-Fi: есть, голосовое управление, ионизатор, обеззараживание ультрафиолетом', 2340);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (12, 'Royal Clima Perfetto', 'инвертор, мощность охлаждения 2.8 кВт, мощность обогрева 2.96 кВт, обслуживаемая площадь 30 м?, шум 20.5-37 дБ, Wi-Fi: поддерживается, модуль приобретается отдельно', 1950);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (12, 'Gree Bora R32', 'инвертор, мощность охлаждения 2.35 кВт, мощность обогрева 2.5 кВт, обслуживаемая площадь 20 м?, шум 24-40 дБ, Wi-Fi: есть', 2159);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (12, 'LG Eco S09EQR', 'инвертор, мощность охлаждения 2.5 кВт, мощность обогрева 3.2 кВт, обслуживаемая площадь 25 м?, шум 19-41 дБ, Wi-Fi: нет', 2145);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (13, 'Horizont 20MW700-1378BIS', 'отдельностоящая, микроволны (соло), объем 20 л, выходная мощность микроволн 700 Вт, управление механическое, цвет серебристый', 217);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (13, 'LG MS2042DB', 'отдельностоящая, микроволны (соло), объем 20 л, выходная мощность микроволн 700 Вт, управление сенсорное, автоприготовление, авторазмораживание, цвет черный', 379);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (13, 'Candy CMS20W', 'отдельностоящая, микроволны (соло), объем 20 л, выходная мощность микроволн 700 Вт, управление механическое, цвет белый', 219);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (13, 'Samsung ME88SUG', 'отдельностоящая, микроволны (соло), объем 23 л, выходная мощность микроволн 800 Вт, управление электронное, автоприготовление, авторазмораживание, цвет графит', 563);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (13, 'Midea AM820CUK-W', 'отдельностоящая, микроволны (соло), объем 20 л, выходная мощность микроволн 800 Вт, управление электронное, автоприготовление, авторазмораживание, цвет белый', 214);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (14, 'BMW 3 seria', '2.0 бензин, седан, передний привод', 60000);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (14, 'AUDI A6', '4.0 бензин, полный привод, 2018 год', 72000);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (14, 'Opel Insignia', '2.2 бензин, 180 л.с, передний привод, 2014 год', 35000);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (15, 'AIST Rocky Junior 1.0 2020', '24", горный, подростковый, сталь Hi-ten, вилка жесткая (сталь Hi-ten), переключатели: задний Shimano Tourney, тормоз ободной механический', 623);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (15, 'Stels Navigator 300 Gent 28 Z010 2020', '28", рама 20", городской, сталь Hi-ten, вилка жесткая (сталь Hi-ten), трансмиссия 1 скор. (1х1), тормоз ножной, вес 17.4 кг', 414);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (15, 'AIST 112-314 ', '28", городской, сталь Hi-ten, вилка жесткая, трансмиссия 1 скор. (1х1), тормоз ножной', 450);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (15, 'AIST Rosy Junior 1.0 2021 ', '24", рама 13", горный, женский, подростковый, сталь Hi-ten, вилка жесткая, трансмиссия 6 скор. (1х6), переключатели: задний Shimano, тормоз ободной механический, вес 13 кг', 598);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (15, 'Stels Navigator 400 MD', '24", рама 12", горный, подростковый, сталь Hi-ten, вилка амортизационная с ходом 50 мм, трансмиссия 18 скор. (3х6), переключатели: задний Microshift/передний Microshift, тормоз дисковый механический, вес 15.5 кг', 600);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (16, 'White Siberia WS-Luna 800W', 'взрослый/подростковый (макс. 140 кг), до 50 км/ч, мощность 800 Вт, запас хода 45 км, аккумулятор 18 А·ч, задний привод, колеса 10"/10", вес 23.5 кг', 1990);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (16, 'Xiaomi MiJia Electric Scooter M365 Pro', 'взрослый/подростковый (макс. 100 кг), до 25 км/ч, мощность 300 Вт, запас хода 45 км, аккумулятор 12.8 А·ч, передний привод, колеса 8.5"/8.5", вес 14.2 кг', 1487);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (16, 'Kugoo S3 ', 'взрослый/подростковый (макс. 100 кг), до 30 км/ч, мощность 350 Вт, запас хода 30 км, аккумулятор 6 А·ч, передний привод, колеса 8"/8", вес 11.7 кг', 850);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (16, 'Ninebot Kickscooter Max G30P ', 'взрослый/подростковый (макс. 100 кг), до 30 км/ч, мощность 350 Вт, запас хода 65 км, аккумулятор 15.3 А·ч, задний привод, колеса 10"/10", вес 19.1 кг', 1985);

INSERT INTO eshop_db.products (category_id, name, description, price)
VALUES (16, 'Kugoo C1 Plus ', 'взрослый/подростковый (макс. 130 кг), до 45 км/ч, мощность 500 Вт, запас хода 35 км, аккумулятор 10 А·ч, задний привод, колеса 10"/10", вес 21 кг', 1599);


--------------------------------------------------------
--  DML for Table eshop_db.images
--------------------------------------------------------
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, null, 'mobile.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (2, null, 'headphones.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (3, null, 'laptop.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (4, null, 'tv.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (5, null, 'camera.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (6, null, 'jps_nav.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (7, null, 'fitnessBracelet.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (8, null, 'fridge.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (9, null, 'washingMachine.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (10, null, 'robotMacuumCleaners.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (11, null, 'irons.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (12, null, 'airConditioners.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (13, null, 'microwaveOvens.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (14, null, 'car.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (15, null, 'bicycles.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (16, null, 'electricScooters.jpg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 1, 'honorX8.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 2, 'huaweiNovaY70.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 3, 'xiaomiRedmi9A.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 4, 'appleIphone13.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 5, 'appleIphone11.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 6, 'appleIphone13Pro.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 7, 'xiaomiRedmiNote11.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 8, 'appleIphone12.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 9, 'xiaomiRedmiNote11Pro.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 10, 'appleIphone13ProMax.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 11, 'xiaomi11T.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 12, 'samsungGalaxyA52.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 13, 'appleIphoneSe2022.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 14, 'xiaomiRedmiNote10Pro.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 15, 'samsungGalaxyS22.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 16, 'samsungGalaxyS21.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 17, 'appleIphoneXR.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 18, 'appleIphone13mini.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 19, 'appleIphone12mini.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 20, 'samsungGalaxyA53.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 21, 'appleIphone12Pro.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 22, 'pocoM4Pro.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 23, 'appleIphoneSE.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 24, 'xiaomiRedmi10CNFC.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 25, 'samsungGalaxyA535GSM.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 26, 'samsungGalaxyA32.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 27, 'honorX82.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 28, 'xiaomiMi11Ultra.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 29, 'pocoF3.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 30, 'xiaomiRedmi10.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (1, 31, 'samsungGalaxyS211.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (2, 32, 'honorEarbuds2Lite.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (2, 33, 'huaweiFreeBudsLipstick.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (2, 34, 'razerKrakenXLite.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (2, 35, 'canyon.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (2, 36, 'vensoSuperia.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (3, 37, 'HP_255_G8.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (3, 38, 'Lenovo_IdeaPad3.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (3, 39, 'HP_Pavilion15.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (3, 40, 'hpPavilion14.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (3, 41, 'appleMacbookAir13.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (4, 42, 'xiaomiMTvP150.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (4, 43, 'blaupunkt32w.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (4, 44, 'lg55na.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (4, 45, 'lgC2.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (4, 46, 'iffalconIf43.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (5, 47, 'Canon_EOS_R6.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (5, 48, 'Sony_Alpha_a7.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (5, 49, 'Canon_EOS_6D.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (5, 50, 'fujifilmInstaxMini11.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (5, 51, 'canonEos2000d.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (6, 52, 'Roadmax_Uno.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (6, 53, 'NAVITEL_E707.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (6, 54, 'GEOFOX_MID743GPS.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (6, 55, 'garminDrive61.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (6, 56, 'navitelC500.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (7, 57, 'honorBand6.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (7, 58, 'huaweiWatchGT3Pro.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (7, 59, 'elariKidphoneFresh.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (7, 60, 'canyonSandyKw34.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (7, 61, 'elariFixiTime.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (8, 62, 'ATLANT_ХМ.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (8, 63, 'Samsung_fridges.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (8, 64, 'Bosch_Serie6.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (8, 65, 'nordfrost.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (8, 66, 'oltoRf050.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (9, 67, 'atlantCma60y1213.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (9, 68, 'lgF2V.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (9, 69, 'boshWlp.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (9, 70, 'boshWha.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (9, 71, 'electrolux.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (10, 72, 'aenoRc2s.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (10, 73, 'dreameD9.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (10, 74, 'dreameF9.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (10, 75, 'ibotoModern.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (10, 76, 'xiaomiMiRobot.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (11, 77, 'philipsGc1758.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (11, 78, 'aresaAr.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (11, 79, 'braun.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (11, 80, 'tefal.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (11, 81, 'braunCarestyle.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (12, 82, 'greePularInvertertR32.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (12, 83, 'lgEvoMax.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (12, 84, 'greeBora.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (12, 85, 'royalClima.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (12, 86, 'lgEco.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (13, 87, 'horizont20mw700.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (13, 88, 'lgMs204.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (13, 89, 'candy.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (13, 90, 'samsungMe.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (13, 91, 'midea.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (14, 92, 'BMW_3.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (14, 93, 'AUDI_A6.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (14, 94, 'opel_insignia.png');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (15, 95, 'aistRockyJunior.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (15, 96, 'stels.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (15, 97, 'aist112.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (15, 98, 'aistRosy.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (15, 99, 'stelsNavigator.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (16, 100, 'whiteSiberiaWsLuna.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (16, 101, 'xiaomiMija.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (16, 102, 'kugooS3.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (16, 103, 'ninebot.jpeg');
INSERT INTO eshop_db.images(category_id, product_id, image_path) values (16, 104, 'kugooC1.jpeg');

