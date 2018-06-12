DROP TABLE exhibits;
DROP TABLE artists;

CREATE TABLE artists (
  id serial4 primary key,
  name varchar(255),
  style varchar(255),
  image text
);
CREATE TABLE exhibits (
  id serial4 primary key,
  title varchar(255),
  date INT4,
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE,
  category varchar(255),
  image text
);
