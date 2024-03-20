require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  erb(:hello)
end

get("/howdy") do
  erb(:testing)
end

get("/square/new") do
  erb(:square_calculator)
end

get("/square/results") do
  @the_num = params.fetch("input_number").to_f
  @the_result = params.fetch("input_number").to_f * params.fetch("input_number").to_f
  erb(:square_results)
end

get("/square_root/results") do
  @the_num = params.fetch("input_number").to_f
  @the_result = Math.sqrt(@the_num).to_f
  erb(:square_root_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = (params.fetch("apr").to_f / 100) / 12
  @years = (params.fetch("years").to_i) * 12
  @principal = params.fetch("principal").to_f

  denominator = 1 - (1 + @apr) ** (-@years)
  numerator = (@apr * @principal) / denominator

  @payment = numerator.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new")do
erb(:random)
end

get("/random/results") do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @random = rand(@min...@max).to_f

  erb(:random_results)
end
