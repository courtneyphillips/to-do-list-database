require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/to_do")

DB = PG.connect({:dbname => "to_do"})

get("/") do
  @tasks = To_Do.all()
  erb(:index)
end

post("/final_list") do
  description = params.fetch("description")
  day = params.fetch("day")
  newtask = To_Do.new(day, description)
  newtask.add()
  erb(:success)
end
