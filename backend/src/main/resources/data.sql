-- Seed data for the Price Comparison Platform (H2 in-memory)
-- Auto-generated: 4 platforms x 6 products x 3 historical price points each

-- Platforms (ids 1-4, in insertion order)
INSERT INTO platforms (name, logo_url, default_shipping_cost) VALUES ('Amazon', 'https://cdn.example.com/logos/amazon.svg', 0.0);
INSERT INTO platforms (name, logo_url, default_shipping_cost) VALUES ('Flipkart', 'https://cdn.example.com/logos/flipkart.svg', 40.0);
INSERT INTO platforms (name, logo_url, default_shipping_cost) VALUES ('eBay', 'https://cdn.example.com/logos/ebay.svg', 5.0);
INSERT INTO platforms (name, logo_url, default_shipping_cost) VALUES ('BestBuy', 'https://cdn.example.com/logos/bestbuy.svg', 0.0);

-- Products (ids 1-6, in insertion order)
INSERT INTO products (name, brand, category, image_url, description) VALUES ('Apple iPhone 15 128GB', 'Apple', 'Smartphones', 'https://cdn.example.com/img/iphone15.jpg', '6.1-inch Super Retina XDR display, A16 Bionic chip, 128GB storage.');
INSERT INTO products (name, brand, category, image_url, description) VALUES ('Samsung Galaxy S24', 'Samsung', 'Smartphones', 'https://cdn.example.com/img/galaxys24.jpg', '6.2-inch Dynamic AMOLED display, Snapdragon 8 Gen 3, 256GB storage.');
INSERT INTO products (name, brand, category, image_url, description) VALUES ('Sony WH-1000XM5 Headphones', 'Sony', 'Audio', 'https://cdn.example.com/img/sonywh1000xm5.jpg', 'Industry-leading noise cancelling wireless headphones.');
INSERT INTO products (name, brand, category, image_url, description) VALUES ('Dell XPS 13 Laptop', 'Dell', 'Laptops', 'https://cdn.example.com/img/dellxps13.jpg', '13.4-inch FHD+ display, Intel Core i7, 16GB RAM, 512GB SSD.');
INSERT INTO products (name, brand, category, image_url, description) VALUES ('Apple Watch Series 9', 'Apple', 'Wearables', 'https://cdn.example.com/img/watchseries9.jpg', '45mm GPS, Always-On Retina display, S9 chip.');
INSERT INTO products (name, brand, category, image_url, description) VALUES ('Nintendo Switch OLED', 'Nintendo', 'Gaming', 'https://cdn.example.com/img/switcholed.jpg', '7-inch OLED screen, 64GB internal storage, enhanced audio.');

-- Price history: 3 snapshots per (product, platform), 10 days ago -> today
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 1, 871.84, 0.0, TRUE, 'https://amazon.example.com/product/1', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 1, 839.55, 0.0, TRUE, 'https://amazon.example.com/product/1', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 1, 807.26, 0.0, TRUE, 'https://amazon.example.com/product/1', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 2, 769.01, 40.0, TRUE, 'https://flipkart.example.com/product/1', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 2, 758.29, 40.0, FALSE, 'https://flipkart.example.com/product/1', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 2, 753.65, 40.0, TRUE, 'https://flipkart.example.com/product/1', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 3, 813.66, 5.0, TRUE, 'https://ebay.example.com/product/1', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 3, 783.53, 5.0, TRUE, 'https://ebay.example.com/product/1', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 3, 753.39, 5.0, TRUE, 'https://ebay.example.com/product/1', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 4, 743.11, 0.0, TRUE, 'https://bestbuy.example.com/product/1', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 4, 766.82, 0.0, FALSE, 'https://bestbuy.example.com/product/1', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (1, 4, 790.54, 0.0, TRUE, 'https://bestbuy.example.com/product/1', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 1, 715.89, 0.0, TRUE, 'https://amazon.example.com/product/2', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 1, 738.73, 0.0, TRUE, 'https://amazon.example.com/product/2', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 1, 761.58, 0.0, TRUE, 'https://amazon.example.com/product/2', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 2, 669.73, 40.0, TRUE, 'https://flipkart.example.com/product/2', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 2, 691.11, 40.0, TRUE, 'https://flipkart.example.com/product/2', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 2, 712.48, 40.0, TRUE, 'https://flipkart.example.com/product/2', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 3, 769.62, 5.0, TRUE, 'https://ebay.example.com/product/2', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 3, 780.32, 5.0, FALSE, 'https://ebay.example.com/product/2', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 3, 765.78, 5.0, TRUE, 'https://ebay.example.com/product/2', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 4, 730.39, 0.0, TRUE, 'https://bestbuy.example.com/product/2', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 4, 753.7, 0.0, TRUE, 'https://bestbuy.example.com/product/2', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (2, 4, 777.01, 0.0, FALSE, 'https://bestbuy.example.com/product/2', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 1, 316.6, 0.0, TRUE, 'https://amazon.example.com/product/3', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 1, 326.71, 0.0, TRUE, 'https://amazon.example.com/product/3', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 1, 336.81, 0.0, TRUE, 'https://amazon.example.com/product/3', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 2, 322.09, 40.0, TRUE, 'https://flipkart.example.com/product/3', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 2, 332.37, 40.0, TRUE, 'https://flipkart.example.com/product/3', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 2, 342.65, 40.0, TRUE, 'https://flipkart.example.com/product/3', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 3, 315.93, 5.0, TRUE, 'https://ebay.example.com/product/3', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 3, 326.02, 5.0, TRUE, 'https://ebay.example.com/product/3', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 3, 336.1, 5.0, FALSE, 'https://ebay.example.com/product/3', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 4, 354.86, 0.0, TRUE, 'https://bestbuy.example.com/product/3', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 4, 351.17, 0.0, TRUE, 'https://bestbuy.example.com/product/3', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (3, 4, 353.92, 0.0, TRUE, 'https://bestbuy.example.com/product/3', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 1, 1095.43, 0.0, TRUE, 'https://amazon.example.com/product/4', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 1, 1054.86, 0.0, FALSE, 'https://amazon.example.com/product/4', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 1, 1014.29, 0.0, TRUE, 'https://amazon.example.com/product/4', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 2, 1045.96, 40.0, TRUE, 'https://flipkart.example.com/product/4', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 2, 1007.22, 40.0, TRUE, 'https://flipkart.example.com/product/4', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 2, 968.48, 40.0, TRUE, 'https://flipkart.example.com/product/4', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 3, 904.68, 5.0, TRUE, 'https://ebay.example.com/product/4', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 3, 933.56, 5.0, TRUE, 'https://ebay.example.com/product/4', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 3, 962.43, 5.0, TRUE, 'https://ebay.example.com/product/4', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 4, 1045.62, 0.0, TRUE, 'https://bestbuy.example.com/product/4', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 4, 1006.9, 0.0, TRUE, 'https://bestbuy.example.com/product/4', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (4, 4, 968.17, 0.0, TRUE, 'https://bestbuy.example.com/product/4', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 1, 392.67, 0.0, TRUE, 'https://amazon.example.com/product/5', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 1, 399.74, 0.0, TRUE, 'https://amazon.example.com/product/5', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 1, 389.03, 0.0, FALSE, 'https://amazon.example.com/product/5', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 2, 376.0, 40.0, TRUE, 'https://flipkart.example.com/product/5', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 2, 380.97, 40.0, TRUE, 'https://flipkart.example.com/product/5', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 2, 380.96, 40.0, TRUE, 'https://flipkart.example.com/product/5', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 3, 390.27, 5.0, FALSE, 'https://ebay.example.com/product/5', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 3, 388.65, 5.0, TRUE, 'https://ebay.example.com/product/5', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 3, 386.52, 5.0, TRUE, 'https://ebay.example.com/product/5', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 4, 435.45, 0.0, TRUE, 'https://bestbuy.example.com/product/5', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 4, 419.32, 0.0, TRUE, 'https://bestbuy.example.com/product/5', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (5, 4, 403.19, 0.0, FALSE, 'https://bestbuy.example.com/product/5', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 1, 353.25, 0.0, TRUE, 'https://amazon.example.com/product/6', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 1, 352.35, 0.0, TRUE, 'https://amazon.example.com/product/6', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 1, 359.73, 0.0, TRUE, 'https://amazon.example.com/product/6', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 2, 349.41, 40.0, TRUE, 'https://flipkart.example.com/product/6', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 2, 349.01, 40.0, TRUE, 'https://flipkart.example.com/product/6', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 2, 357.06, 40.0, TRUE, 'https://flipkart.example.com/product/6', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 3, 329.99, 5.0, FALSE, 'https://ebay.example.com/product/6', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 3, 340.52, 5.0, TRUE, 'https://ebay.example.com/product/6', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 3, 351.05, 5.0, TRUE, 'https://ebay.example.com/product/6', '2026-09-18 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 4, 338.39, 0.0, TRUE, 'https://bestbuy.example.com/product/6', '2026-09-08 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 4, 349.19, 0.0, TRUE, 'https://bestbuy.example.com/product/6', '2026-09-14 09:00:00');
INSERT INTO price_entries (product_id, platform_id, price, shipping_cost, in_stock, product_url, recorded_at) VALUES (6, 4, 359.99, 0.0, TRUE, 'https://bestbuy.example.com/product/6', '2026-09-18 09:00:00');

-- A sample active price alert
INSERT INTO price_alerts (product_id, email, target_price, active) VALUES (1, 'student@example.com', 700.0, TRUE);
