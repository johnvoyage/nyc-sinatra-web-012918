class FiguresController < ApplicationController
set :views, Proc.new { File.join(root, "../views/figures") }


  get '/figures/new' do
    erb :new
  end

post '/figures' do
  test = Figure.create(name: params[:name])
  test
  # binding.pry
end


end
