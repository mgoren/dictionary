require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/todo')

get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/confirmation") do
  @description = params.fetch('description')
  if @description != ""
    task = Task.new(@description)
    task.save()
  end
  erb(:confirmation)
end

get("/reset") do
  Task.clear()
  erb(:reset)
end
