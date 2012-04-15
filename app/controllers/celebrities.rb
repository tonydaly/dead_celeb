DeadCelebrities.controllers :celebrities do
  get :index, :map => '/' do
    @celebrities      = Celebrity.all
    @dead_celebrities = Celebrity.dead

    render 'celebrities/index'
  end

  get :show, :with => :id do
    @celebrity = Celebrity.find_by_id params[:id]
    render 'celebrities/show'
  end

  get :new do
    @celebrity = Celebrity.new
  end

  post :create do
    celeb = Celebrity.create name: params[:name], dead: false

    DeathStream.new celeb
  end
end
