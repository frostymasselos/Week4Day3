require_relative('../models/student.rb')
require_relative('../models/house.rb')
require('pry-byebug')

Student.delete_all()
House.delete_all()

gryffindor = House.new({
  "name" => "Gryffindor"
  })
slytherin = House.new({
  "name" => "Slytherin"
  })
hufflepuff = House.new({
  "name" => "Hufflepuff"
  })
ravenclaw = House.new({
  "name" => "Ravenclaw"
  })

  gryffindor.save()
  slytherin.save()
  hufflepuff.save()
  ravenclaw.save()

  student1 = Student.new({
      "first_name" => "Harry",
      "last_name" => "Potter",
      "house_id" => gryffindor.id,
      "age" => 14

    })

  student2 = Student.new({
      "first_name" => "Ron",
      "last_name" => "Weasley",
      "house_id" => slytherin.id,
      "age" => 13
    })

  student3 = Student.new({
      "first_name" => "Hermiona",
      "last_name" => "Grenger",
      "house_id" => hufflepuff.id,
      "age" => 12
    })

    student1.save()
    student2.save()
    student3.save()
binding.pry
nil
