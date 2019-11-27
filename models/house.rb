require_relative '../db/sqlrunner'

class House

  attr_accessor :name
  attr_reader :id

  def initialize(info)
    @id = info['id'].to_i() if info['id']
    @name = info['name']
  end

  def save()
    sql = 'INSERT INTO houses (name) VALUES ($1) RETURNING id;'
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM houses;'
    houses = SqlRunner.run(sql)
    return houses.map{ |house| House.new(house) }
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    SqlRunner.run(sql)
  end


  def self.find_house_by_id(id)
    sql = 'SELECT * FROM houses WHERE id = $1;'
    values = [id]
    house_info = SqlRunner.run(sql, values)
    return House.new(house_info[0])
  end

  def students()
    sql = "SELECT * FROM students WHERE
    house_id = $1;"
    values = [@id]
    students_info = SqlRunner.run(sql, values)
    return students_info.map{|student_info| Student.new(student_info)}
  end

end
