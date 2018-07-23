require_relative('../db/sqlRunner.rb')

class Tag
  attr_accessor :id, :tag_name

  def initialize(options)
    @id = options['id']
    @tag_name = options['tag_name']
  end

  def save
    sql = "INSERT INTO tags(tag_name) VALUES ($1) RETURNING id"
    values = [@tag_name]
    hash = SqlRunner.run(sql, values).first
    @id = hash['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM tags"
    hashes = SqlRunner.run(sql)
    result = hashes.map { |e| Tag.new(e)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    hash = SqlRunner.run(sql, values).first
    result =  Tag.new(hash)
    return result
  end

  def update
    sql = "UPDATE tags SET tag_name = $1 WHERE id = $2"
    values = [@tag_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by(id)
    sql = "DELETE FROM tags WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end
end
