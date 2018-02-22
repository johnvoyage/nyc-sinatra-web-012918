class FiguresController < ApplicationController
# set :views, Proc.new { File.join(root, "../views/figures") }


  get '/figures/new' do
    # binding.pry
    # @landmarks = Landmark.all
    # @titles = Title.all
    # binding.pry
    erb :'/figures/new'
  end

  post '/figures' do
    # binding.pry
    @figure = Figure.create(name: params[:figure][:name])
    binding.pry
    if !params[:title][:ids].empty?
    # binding.pry
    # params[:title][:name] = Title.find(109).name
    FigureTitle.create(figure_id: @figure.id, title_id: Title.find_by(name: @figure.title).id)
      # @figure.titles << Title.create(name: params[:title][:name])
    end
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])

    end
    # binding.pry
    @figure.save
    # binding.pry
    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id' do
    # binding.pry
    @figure = Figure.find(params[:id])
    # binding.pry
    erb :'figures/show'
  end



end
