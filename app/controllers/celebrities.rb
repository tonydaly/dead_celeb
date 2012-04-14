DeadCelebrities.controllers :celebrities do
  layout :application

  get :index, :map => '/' do
    @celebrities = Celebrity.all
     render 'celebrities/index'
  end

  get :show, :with => :id do
    @celebrity = Celebrity.find_by_id params[:id]
    render 'celebrities/show'
  end

  post :create do
    celeb = Celebrity.create name: params[:name]

    DeathStream.new celeb
  end
end
