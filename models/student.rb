require_relative('../db/sql_runner.rb')
# Does that mean it takes the PG functionality it?

class Student

  attr_reader :id, :house_id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house_id = options['house_id'].to_i
    @age = options['age']

  end

  def save()
    sql = "INSERT INTO students
    (
      first_name,
      last_name,
      house_id,
      age
    )
    VALUES
    (
        $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data[0]['id'].to_i
  end

  def house()
    sql = "SELECT *
    FROM houses
    WHERE houses.id = $1"
    house_data = SqlRunner.run(sql, [@house_id])
    house = House.map_items(house_data)
    return house
  end

  # How does it know the house class exists?

  # def self.map_items(student_data)
  #   result = student_data.map { |student| House.new( student ) }
  #   return result
  # end

  

  def self.find_by_id(id)
    sql = "SELECT * FROM students WHERE id = $1"
    student = SqlRunner.run(sql, [id])
    return Student.new(student[0])
  end

  def self.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map{ |student| Student.new(student) }
  end

  def self.delete_all()
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

  # def self.map_items(student_data)
  #   result = student_data.map { |student| Student.new( student ) }
  #   return result
  # end

end
