CREATE TABLE blog.author(
  author_id serial PRIMARY KEY,
  username varchar (50) UNIQUE NOT NULL,
  password varchar (50) NOT NULL,
  email varchar(355) UNIQUE NOT NULL,
  created_on TIMESTAMP NOT NULL,
  last_login TIMESTAMP
);

CREATE TABLE blog.post(
  post_id SERIAL PRIMARY KEY NOT NULL,
  author_id SERIAL NOT NULL,
  CONSTRAINT author FOREIGN KEY (author_id)
    REFERENCES author(author_id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  date_posted TIMESTAMP NOT NULL
);

CREATE TABLE blog.comment (
  comment_id  SERIAL PRIMARY KEY NOT NULL,
  post_id     SERIAL NOT NULL,
  CONSTRAINT post FOREIGN KEY (post_id)
    REFERENCES blog.post(post_id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  date_posted TIMESTAMP NOT NULL
);

CREATE TABLE blog.comment_content(
  comment_id SERIAL PRIMARY KEY NOT NULL,
  CONSTRAINT comment FOREIGN KEY (comment_id)
    REFERENCES blog.comment(comment_id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  content text
);

CREATE TABLE blog.post_content(
  post_id serial PRIMARY KEY NOT NULL,
  CONSTRAINT post FOREIGN KEY (post_id)
    REFERENCES blog.post(post_id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  content text
);

