require "sqlite3"

class Database

  def initialize(db)
    puts "DB Bootup..."
    begin
      @db = init(db)
    rescue e
      puts "Error connecting to database"
      puts e.message
    end

    @db.results_as_hash = true
  end

  def add_source_image()
  end

  def create_run(name)
    puts "creating run #{name}"
    return @db.execute("INSERT INTO runs (name)
      VALUES(?)", [name])
  end

  def get_runs
    return @db.execute("SELECT * FROM runs")
  end

  private

  def init(db) 
    db = SQLite3::Database.new db

    # Create Source Image Table
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS source_images (
        id  INTEGER  PRIMARY KEY  NOT NULL,
        URL TEXT              NOT NULL 
      );
    SQL

    # Create Glitch Image Table
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS glitch_images (
        id                  INTEGER   PRIMARY KEY  NOT NULL,
        URL                 TEXT               NOT NULL,
        instruction_set_id  INT,
        source_image_id     INT,
        run_id              INT,
        FOREIGN KEY(instruction_set_id) REFERENCES instruction_set(id),
        FOREIGN KEY(source_image_id)    REFERENCES source_images(id)
        FOREIGN KEY(run_id)             REFERENCES runs(id)
      );
    SQL

    # Create Instruction Set Table
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS instruction_set (
        id           INTEGER   PRIMARY KEY  NOT NULL,
        name         TEXT               NOT NULL,
        instructions BLOB               NOT NULL
      );
    SQL


    # Create Runs Table
    db.execute <<-SQL
      CREATE TABLE IF NOT EXISTS runs (
        id           INTEGER   PRIMARY KEY  NOT NULL,
        name         TEXT               NOT NULL
      );
    SQL

    return db
  end


end
