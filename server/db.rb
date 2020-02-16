require "sqlite3"

db = SQLite3::Database.new "test.db"

# Create a table
rows = db.execute <<-SQL
  create table numbers (
    name varchar(30),
    val int
  );
SQL
