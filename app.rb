require "sinatra"
require "sinatra/reloader"

get("/howdy") do
erb(:testing)
end

get("/square/new") do
  erb(:square_calculator)
end

get('/square/results') do
  erb(:square_results)
end
