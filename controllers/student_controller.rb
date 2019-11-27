# require('sinatra')
# require('sinatra/contrib/all')
# require_relative('models/student')
# also_reload('models/*')

require('pry')

#INDEX
get('/students') do
  @students = Student.all()
  @houses = House.all()
  erb(:"students/index")
end



#NEW
get('/students/new') do
  @houses = House.all()
  erb(:"students/new")
end


post ("/students/house") do
  id = params['house_id'].to_i()
  @houses = House.all()
  @students = Student.find_students_by_house_id(id)
  erb(:"students/index")
end

#SHOW
get('/students/:id') do
  id = params['id'].to_i()
  @student = Student.find_student_by_id(id)
  erb(:'students/show')
end

#CREATE
post("/students") do
  @student = Student.new(params)
  @student.save()
  redirect("/students")
end
