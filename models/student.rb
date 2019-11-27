require_relative '../db/sqlrunner'
require_relative("house")

class Student

  attr_accessor :first_name, :last_name, :house, :age
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i()
    @age = options['age'].to_i()
  end

  def pretty_name()
    return @first_name + " " + @last_name
  end

  def save()
    sql = 'INSERT INTO students (first_name, last_name, house_id, age)
    VALUES ($1, $2, $3, $4) RETURNING id;'
    values = [@first_name, @last_name, @house_id, @age]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = 'SELECT * FROM students;'
    students_info = SqlRunner.run(sql)
    return students_info.map{ |student_info| Student.new(student_info) }
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def self.find_student_by_id(id)
    sql = 'SELECT * FROM students WHERE id = $1;'
    values = [id]
    found_student = SqlRunner.run(sql, values)
    return Student.new(found_student[0])
  end

  def house()
    sql = "SELECT *
    FROM houses
    WHERE id = $1;"

    values = [@house_id]
    house_info = SqlRunner.run(sql, values)
    return House.new(house_info[0])
  end

  def self.find_students_by_house_id(id)
    sql = "SELECT * FROM students WHERE house_id = $1;"
    values = [id]
    students_info = SqlRunner.run(sql, values)
    return students_info.map{|student_info| Student.new(student_info)}
  end

end
