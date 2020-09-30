require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
    SELECT
      *
    FROM
      plays
    WHERE
      title = ?
    SQL
    return nil if play.length <= 0
  end

  def self.find_by_playwright(playwright_id)
    plays = PlayDBConnection.instance.execute(<<-SQL, playwright_id)
    SELECT
      *
    FROM
      plays
    WHERE
      playwright_id = ?
    SQL

    plays.map { |data| Play.new(data) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright

  attr_accessor :birth_year, :name

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum)}
  end

  def self.find_by_name(name)
    person = PlayDBConnection.instance.execute(<<-SQL, name)
    SELECT
      *
    FROM
      playwrights
    WHERE
      name = ?
    SQL
    
    return nil if person.length <= 0

    Playwright.new(person.first)

  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{name} is already in the DB" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
    INSERT INTO
      playwrights (name, birth_year)
    VALUES
      (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{name} is not in the DB" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
    UPDATE
      playwrights
    SET
      name = ?, birth_year = ?
    WHERE
      id = ?
    SQL
  end

  def get_plays
    raise "#{name} is not in the DB" unless @id
    plays = PlayDBConnection.instance.execute(<<-SQL, @id)
    SELECT
      *
    FROM
      plays
    WHERE
      playwright_id = ?
    SQL
    plays.map { |play| Play.new(play) }
  end

end