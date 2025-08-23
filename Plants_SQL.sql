USE project_db_plants;

-- 1. Да се проектира база от данни и да се представи ER диаграма със
-- съответни CREATE TABLE заявки за средата MySQL.

CREATE TABLE Class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(100) NOT NULL
);

CREATE TABLE Family (
    family_id INT PRIMARY KEY AUTO_INCREMENT,
    family_name VARCHAR(100) NOT NULL,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES Class(class_id) ON DELETE CASCADE
);

CREATE TABLE Genus (
    genus_id INT PRIMARY KEY AUTO_INCREMENT,
    genus_name VARCHAR(100) NOT NULL,
    family_id INT,
    FOREIGN KEY (family_id) REFERENCES Family(family_id) ON DELETE CASCADE
);

CREATE TABLE Species (
    species_id INT PRIMARY KEY AUTO_INCREMENT,
    species_name VARCHAR(100) NOT NULL,
    description TEXT,
    genus_id INT,
    FOREIGN KEY (genus_id) REFERENCES Genus(genus_id) ON DELETE CASCADE
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

CREATE TABLE Images (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    image_path VARCHAR(255),
    species_id INT,
    FOREIGN KEY (species_id) REFERENCES Species(species_id) ON DELETE CASCADE
);

CREATE TABLE Viewed (
    view_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    species_id INT,
    view_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (species_id) REFERENCES Species(species_id) ON DELETE CASCADE
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    comment_text TEXT,
    comment_date DATE,
    user_id INT,
    species_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (species_id) REFERENCES Species(species_id) ON DELETE CASCADE
);

-- Вмъкване на начални данни 
INSERT INTO Class (class_name) VALUES 
('Magnoliopsida'), 
('Liliopsida'), 
('Pinopsida');

INSERT INTO Family (family_name, class_id) VALUES 
('Rosaceae', 1),
('Liliaceae', 2),
('Amaryllidaceae', 2),
('Buxaceae', 1),
('Hydrangeaceae', 1),
('Lamiaceae', 1),
('Fagaceae', 1),
('Betulaceae', 1),
('Sapindaceae', 1),
('Pinaceae', 3);

INSERT INTO Genus (genus_name, family_id) VALUES 
('Rosa', 1),
('Tulipa', 2),
('Narcissus', 3),
('Buxus', 4),
('Hydrangea', 5),
('Lavandula', 6),
('Quercus', 7),
('Betula', 8),
('Acer', 9),
('Pinus', 10);

INSERT INTO Species (species_name, description, genus_id) VALUES 
('Rosa gallica', 'Старинен сорт роза', 1),
('Tulipa gesneriana', 'Градински лалета', 2),
('Narcissus poeticus', 'Поетичен нарцис', 3),
('Buxus sempervirens', 'Вечнозелен чемшир', 4),
('Hydrangea macrophylla', 'Хортензия с големи цветове', 5),
('Lavandula angustifolia', 'Лавандула', 6),
('Quercus robur', 'Обикновен дъб', 7),
('Betula pendula', 'Бяла бреза', 8),
('Acer platanoides', 'Листно клен', 9),
('Pinus sylvestris', 'Обикновен бор', 10);

INSERT INTO Users (username, email) VALUES
('ivan123', 'ivan@example.com'),
('maria_flower', 'maria@example.com'),
('georgi_garden', 'georgi@example.com');

INSERT INTO Images (image_path, species_id) VALUES
('https://media.istockphoto.com/id/1406385562/photo/gallic-rose-or-rose-of-provins-french-rose-close-up.jpg?s=612x612&w=0&k=20&c=OH4MprwoG_CPVFJPPndkz0eOjxBjTZnTw82jlDS6yWs=', 1),
('https://media.istockphoto.com/id/1417899517/photo/garden-tulip.jpg?s=612x612&w=0&k=20&c=qe7crE3SJyd3fhpiYIsShppOVfmlUD2zFQAjF6MFNlE=', 2),
('https://media.istockphoto.com/id/1752084535/photo/close-up-of-white-narcissus-flowers-in-spring-garden-beautiful-daffodils-against-green-bokeh.jpg?s=612x612&w=0&k=20&c=
LVxbnxJ7r9o0LE78-3a5wjyJx-65d9O9YROajtVgh0w=', 3),
('https://media.istockphoto.com/id/493238552/photo/boxwood-bushes-round-shape-formal-park.jpg?s=612x612&w=0&k=20&c=1de9FyJJzRQ0X_nZPLjGBt6rioPQIRRm4E40paT8_2s=', 4),
('https://cdn.pixabay.com/photo/2019/11/11/22/57/hydrangea-macrophylla-4619708_640.jpg', 5),
('https://media.istockphoto.com/id/829506188/photo/close-up-shot-of-lavender-flowers.jpg?s=612x612&w=0&k=20&c=usvD22_wINvW5tmDun9gq34MSxyCSAVyWY2pQ6NR15A=', 6),
('https://media.istockphoto.com/id/610946966/photo/large-english-oak-or-quercus-robur-against-a-bright-sky.jpg?s=612x612&w=0&k=20&c=ZV43Tv_aL8UVYvrsrp2BKrJXAW2xMlLOIvr1fBmK5ZI=', 7),
('https://www.architecturalplants.com/wp-content/uploads/2020/10/betulapendula2.jpg', 8),
('https://assets.barcham.co.uk/media/cache/sylius_shop_product_large/d1/4e/820ef05cc03c749e7daefd3c666f.jpeg', 9),
('https://upload.wikimedia.org/wikipedia/commons/1/18/Scots_Pine_%28Pinus_sylvestris%29_-_Kristiansand%2C_Norway_2021-08-10.jpg', 10);

INSERT INTO Viewed (user_id, species_id, view_date) VALUES
(1, 1, '2025-04-01'),
(1, 3, '2025-04-03'),
(2, 5, '2025-04-04'),
(2, 2, '2025-04-02'),
(3, 4, '2025-04-03'),
(3, 4, '2025-04-05');

INSERT INTO Comments (comment_text, comment_date, user_id, species_id) VALUES
('Много красиво цвете!', '2025-04-02', 1, 1),
('Обичам лалета!', '2025-04-03', 2, 2),
('Полезно растение за градината.', '2025-04-04', 3, 4),
('Чудесно дърво за сянка.', '2025-04-05', 1, 7),
('Обожавам аромата на лавандула.', '2025-04-06', 2, 6);

-- 2. Напишете заявка, в която демонстрирате SELECT с ограничаващо условие по избор.
SELECT * 
FROM Species
WHERE species_name LIKE 'Rosa%';

-- 3. Напишете заявка, в която използвате агрегатна функция и GROUP BY по ваш избор.
SELECT g.genus_name, COUNT(s.species_id) AS total_species
FROM Genus g
JOIN Species s ON g.genus_id = s.genus_id
GROUP BY g.genus_name;

-- 4. Напишете заявка, в която демонстрирате INNER JOIN по ваш избор.
SELECT u.username, s.species_name, c.comment_text
FROM Comments c
INNER JOIN Users u ON c.user_id = u.user_id
INNER JOIN Species s ON c.species_id = s.species_id;

SELECT s.species_name, s.description, i.image_path
FROM Species s
INNER JOIN Images i ON s.species_id = i.species_id;

-- 5. Напишете заявка, в която демонстрирате OUTER JOIN по ваш избор.
SELECT u.username, c.comment_text, c.comment_date
FROM Users u
LEFT JOIN Comments c ON u.user_id = c.user_id;

-- 6. Напишете заявка, в която демонстрирате вложен SELECT по ваш избор.
SELECT species_name
FROM Species
WHERE species_id IN (
    SELECT species_id
    FROM Viewed
    WHERE user_id = (
        SELECT user_id
        FROM Users
        WHERE username = 'ivan123'
    )
);

-- 7. Напишете заявка, в която демонстрирате едновременно JOIN и агрегатна функция.
SELECT c.class_name, COUNT(cm.comment_id) AS comment_count
FROM Comments cm
JOIN Species s ON cm.species_id = s.species_id
JOIN Genus g ON s.genus_id = g.genus_id
JOIN Family f ON g.family_id = f.family_id
JOIN Class c ON f.class_id = c.class_id
GROUP BY c.class_name;

-- 8. Създайте тригер по ваш избор.

INSERT INTO Users (username, email)
VALUES ('nikolai_plants', 'nikolai@example.com');

CREATE TABLE UserWelcome (
    welcome_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    username VARCHAR(100),
    welcome_message VARCHAR(255),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

DELIMITER $$
CREATE TRIGGER after_user_insert
AFTER INSERT ON Users
FOR EACH ROW
BEGIN
    INSERT INTO UserWelcome (user_id, username, welcome_message, created_at)
    VALUES (
        NEW.user_id,
        NEW.username,
        CONCAT('Welcome, ', NEW.username, '!'),
        NOW()
    );
END
$$ DELIMITER ;

SELECT * FROM UserWelcome;

-- 9. Създайте процедура, в която демонстрирате използване на курсор.
CREATE TABLE UsersWithViews (
    user_id INT,
    username VARCHAR(100),
    total_views INT
);

DELIMITER $$

CREATE PROCEDURE FindUsersWithViews()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE u_id INT;
    DECLARE u_name VARCHAR(100);
    DECLARE view_count INT;

    DECLARE user_cursor CURSOR FOR 
        SELECT user_id, username FROM Users;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN user_cursor;

    user_loop: LOOP
        FETCH user_cursor INTO u_id, u_name;
        IF done THEN
            LEAVE user_loop;
        END IF;

        SELECT COUNT(*) INTO view_count
        FROM Viewed
        WHERE user_id = u_id;

        IF view_count > 0 THEN
            INSERT INTO UsersWithViews (user_id, username, total_views)
            VALUES (u_id, u_name, view_count);
        END IF;

    END LOOP;
    CLOSE user_cursor;
END$$

DELIMITER ;

CALL FindUsersWithViews();
SELECT * FROM UsersWithViews;

