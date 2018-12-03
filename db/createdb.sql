#DROP DATABASE default;
#CREATE DATABASE default;
#USE default;
CREATE TABLE Author(
  author_id int AUTO_INCREMENT NOT NULL,
  username varchar (50) NOT NULL,
  password varchar (50) NOT NULL,
  email varchar(100) NOT NULL,
  last_login TIMESTAMP,
  PRIMARY KEY (author_id)
);

CREATE TABLE Post(
  post_id int AUTO_INCREMENT NOT NULL,
  author_id int NOT NULL,
  date_posted DATE NOT NULL,
  FOREIGN KEY(author_id) REFERENCES Author (author_id) ON DELETE CASCADE,
  PRIMARY KEY(post_id)
);

CREATE TABLE Comment (
  comment_id  int AUTO_INCREMENT NOT NULL,
  post_id     int NOT NULL,
  date_posted TIMESTAMP NOT NULL,
  FOREIGN KEY (post_id) REFERENCES Post(post_id) ON DELETE CASCADE ,
  PRIMARY KEY(comment_id)
);

CREATE TABLE Comment_Content(
  comment_id INT NOT NULL,
  content text,
  FOREIGN KEY (comment_id) REFERENCES Comment(comment_id) ON DELETE CASCADE,
  PRIMARY KEY(comment_id)
);

CREATE TABLE Post_Content(
  post_id INT NOT NULL,
  content text,
  FOREIGN KEY (post_id) REFERENCES Post(post_id) ON DELETE CASCADE,
  PRIMARY KEY (post_id)
);

