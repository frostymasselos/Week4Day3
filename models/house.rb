require_relative('../db/sql_runner.rb')
# Does that mean it takes the PG functionality it?

class House

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses
    (
      name
    )
    VALUES
    (
        $1
    )
    RETURNING id"
    values = [@name]
    house_data = SqlRunner.run(sql, values)
    @id = house_data[0]['id'].to_i
  end

  # Why do you need the RETURNING statement?

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    house = SqlRunner.run(sql, [id])
    return House.new(house[0])
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    return houses.map{ |house| House.new(house) }
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

  def self.map_items(student_data)
    result = student_data.map { |student| House.new( student ) }
    return result
  end

end
