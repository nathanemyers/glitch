require "sqlite3"

class Database

  def initialize(db)
    puts "DB Bootup..."
    begin
      @db = SQLite3::Database.open db
    rescue
      puts "Could not find database: #{db}"
      puts "Initializing new database: #{db}..."
      @db = init(db)
      puts "Done!"
    end

  end



  private

  def init(db) 
    db = SQLite3::Database.new db

    # Create a table
    db.execute <<-SQL
      create table numbers (
        name varchar(30),
        val int
      );
    SQL

    return db
  end


end
