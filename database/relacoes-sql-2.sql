
-- Práticas
CREATE TABLE users(

    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL, 
    create_at TEXT DEFAULT(DATETIME('now', 'localtime'))NOT NULL);




SELECT * FROM users;

DROP TABLE users;

SELECT DATETIME("now", "localtime");

INSERT INTO users(id, name, email, password)
VALUES
   ( "01", "Gabriella", "gabriella@email.com", "gabi123"),
    ("02", "Vitoria", "vitoria@email.com", "vitoria123"),
    ("03", "Amanda", "amanda@belarmino.com", "amanda123")
;



CREATE TABLE follows(
    followers_id TEXT NOT NULL, 
    followed_id TEXT NOT NULL,
    FOREIGN KEY (followers_id)REFERENCES users(id),
    FOREIGN KEY (followed_id)REFERENCES users(id)
);

INSERT INTO follows(followers_id, followed_id)
VALUES
("01", "02"),
("01", "03"),
("03",  "02"),
("02", "01"); 

SELECT * FROM users INNER JOIN follows ON follows.followers_id = users.id;



SELECT * FROM users
LEFT JOIN follows
ON follows.followers_id = users.id;

SELECT * FROM users
LEFT JOIN follows
ON follows.followers_id = users.id
INNER JOIN users as usersFollowed
ON follows.followed_id = usersFollowed.id;

--removendo ambiguidades

SELECT
users.id as usersId,
users.name,
users.email,
users.password,
users.create_at as createAt,
follows.followers_id as followersId,
follows.followed_id as followedId,
usersFollowed.name as nameFollowrs
FROM users
LEFT JOIN follows
ON follows.followers_id = users.id
INNER JOIN users as usersFollowed
ON follows.followed_id = usersFollowed.id;