CREATE TABLE "User" (
    id bigserial PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    username VARCHAR(50) NOT NULL,
    password VARCHAR(256) NOT NULL,
    birth_date date,
    gender boolean,
    user_pic VARCHAR(256)
);

CREATE TABLE tweet (
    id bigserial PRIMARY KEY,
    user_id bigint REFERENCES "User"(id),
    text VARCHAR(240),
    photo VARCHAR(256),
    pub_date date,
    replies_to bigint REFERENCES Tweet(id),
    retweets bigint REFERENCES Tweet(id)
);

CREATE TABLE mention(
    id BIGSERIAL PRIMARY KEY,
    tweet_id bigint REFERENCES Tweet(id),
    user_id bigint REFERENCES "User"(id)
);

CREATE TABLE hashtag(
    id BIGSERIAL PRIMARY KEY,
    text VARCHAR(239)
);

CREATE TABLE tweethashtag(
    id SERIAL PRIMARY KEY,
    tweet_id bigint REFERENCES Tweet(id),
    hashtag_id bigint REFERENCES Hashtag(id)
);

CREATE TABLE userlike(
    id serial PRIMARY KEY,
    user_id bigint REFERENCES "User"(id),
    tweet_id bigint REFERENCES Tweet(id)
);

ALTER TABLE "User" RENAME TO "user";

INSERT INTO "user" (first_name, last_name, username, password, birth_date, gender, user_pic)
VALUES ('Александр', 'Кузнецов', 'wumBach', '362536jhk51j3gjhg34', '1999-01-01', TRUE, '');

INSERT INTO tweet (user_id, text, photo, pub_date, replies_to, retweets) VALUES
                (1, 'Hello! This is my first tweet!', '', '2021-09-21', Null, NULL),
                (1, 'Hello! This is my second tweet!', '', '2021-09-21', Null, NULL),
                (1, 'Hello! This is my third tweet!', '', '2021-09-21', Null, NULL),
                (1, 'Hello! This is my fourth tweet!', '', '2021-09-21', Null, NULL),
                (1, 'Hello! This is my fifth tweet!', '', '2021-09-21', Null, NULL);
