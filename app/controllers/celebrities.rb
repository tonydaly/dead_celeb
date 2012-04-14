DeadCelebrities.controllers :celebrities do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index, :map => '/' do
    @celebrities = Celebrity.all
    render 'celebrities/index'
  end

  get :show, :with => :id do
    @celebrity = Celebrity.find_by_id params[:id]
    render 'celebrities/show'
  end

end
