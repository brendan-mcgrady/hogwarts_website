require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
also_reload('models/*')
require_relative('controllers/student_controller.rb')

get '/' do
  erb(:home)
end
