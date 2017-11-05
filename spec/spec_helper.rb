require "sqlite3"

DB = SQLite3::Database.new(":memory:")

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS authors (
    id integer PRIMARY KEY,
    name text NOT NULL
  );
SQL

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS books (
    id integer PRIMARY KEY,
    author_id integer NOT NULL,
    name text NOT NULL,
    FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE CASCADE ON UPDATE NO ACTION
  );
SQL

DB.execute <<-SQL
  INSERT INTO authors (id, name)
  VALUES
    (1, "Alan Adams"),
    (2, "Buddy Baker"),
    (3, "Carlos Clark");
SQL

DB.execute <<-SQL
  INSERT INTO books (id, author_id, name)
  VALUES
    (1, 2, "Morning Kyiv"),
    (2, 2, "How to assemble a bicycle"),
    (3, 3, "Cats & Dogs");
SQL
