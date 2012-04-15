DeadCelebrities.controllers :celebrities do
  get :index, :map => '/' do
    if current_user
      @celebrities      = current_user.celebrities
    else
      @celebrities = []
    end
    @dead_celebrities = Celebrity.dead

    @celebrities.each do |c|
      DeathStream.new c, current_user
    end
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
    celeb = Celebrity.create name: params[:name]

    DeathStream.new celeb, current_user

    redirect "/"
  end
end
