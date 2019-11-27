require_relative '../models/student'
require_relative '../models/house'
require 'pry'



house1_info = {
  'name' => 'Gryffindor'
}
house2_info = {
  'name' => 'Slytherin'
}
house3_info = {
  'name' => 'Hufflepuff'
}
house4_info = {
  'name' => 'Ravenclaw'
}


House.delete_all()


house1 = House.new(house1_info)
house1.save()
house2 = House.new(house2_info)
house2.save()
house3 = House.new(house3_info)
house3.save()
house4 = House.new(house4_info)
house4.save()


student1_info = {
  'first_name' => 'Harry',
  'last_name' => 'Dinkledorf',
  'house_id' => house1.id,
  'age' => '18'
}

student2_info = {
  'first_name' => 'Ron',
  'last_name' => 'Weasley',
  'house_id' => house1.id,
  'age' => '18'
}

student3_info = {
  'first_name' => 'Draco',
  'last_name' => 'Malfoy',
  'house_id' => house2.id,
  'age' => '18'
}

student1 = Student.new(student1_info)
student1.save()
student2 = Student.new(student2_info)
student2.save()
student3 = Student.new(student3_info)
student3.save()

binding.pry
nil
