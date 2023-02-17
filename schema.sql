DROP TABLE IF EXISTS item;

CREATE TABLE
    item (
        id SERIAL PRIMARY KEY,
        genre_id INT NOT NULL,
        author_id INT NOT NULL,
        label_id INT NOT NULL,
        publish_date DATE NOT NULL,
        archived BOOLEAN,
        FOREIGN KEY (genre_id) REFERENCES genre (id),
        FOREIGN KEY (author_id) REFERENCES author (id),
        FOREIGN KEY (label_id) REFERENCES label (id)
    );

DROP INDEX IF EXISTS item_genre_id_asc;

CREATE INDEX item_genre_id_asc ON item (genre_id ASC);

DROP INDEX IF EXISTS item_author_id_asc;

CREATE INDEX item_author_id_asc ON item (author_id ASC);

DROP INDEX IF EXISTS item_label_id_asc;

CREATE INDEX item_label_id_asc ON item (label_id ASC);

DROP TABLE IF EXISTS author;

CREATE TABLE genre(
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255)
);

CREATE TABLE music_album (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  on_spotify BOOLEAN,
  publish_date DATE,
  genre_id INTEGER REFERENCES genre(id)
);

CREATE TABLE
    author (
        id SERIAL PRIMARY KEY,
        first_name VARCHAR(100) NOT NULL,
        last_name VARCHAR(100) NOT NULL
    );

DROP TABLE IF EXISTS game;

CREATE TABLE
    game (
        id SERIAL PRIMARY KEY,
        item_id INT NOT NULL,
        multiplayer BOOLEAN NOT NULL,
        last_player_at DATE NOT NULL,
        FOREIGN KEY (item_id) REFERENCES item (id)
    );

DROP INDEX IF EXISTS game_item_id_asc;

CREATE INDEX game_item_id_asc ON item (item_id ASC);

CREATE TABLE books(
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  label_ID INTEGER,
  author_ID INTEGER,
  genre_ID INTEGER,
  CONSTRAINT fk_label FOREIGN KEY (label_ID) REFERENCES label(ID),
  CONSTRAINT fk_author FOREIGN KEY (author_ID) REFERENCES author(ID),
  CONSTRAINT fk_genre FOREIGN KEY (genre_ID) REFERENCES genre(ID)
);

CREATE TABLE label(
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(50) NOT NULL,
  color VARCHAR(50) NOT NULL
);