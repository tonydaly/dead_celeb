Admin.controllers :celebrities do

  get :index do
    @celebrities = Celebrity.all
    render 'celebrities/index'
  end

  get :new do
    @celebrity = Celebrity.new
    render 'celebrities/new'
  end

  post :create do
    @celebrity = Celebrity.new(params[:celebrity])
    if @celebrity.save
      flash[:notice] = 'Celebrity was successfully created.'
      redirect url(:celebrities, :edit, :id => @celebrity.id)
    else
      render 'celebrities/new'
    end
  end

  get :edit, :with => :id do
    @celebrity = Celebrity.find(params[:id])
    render 'celebrities/edit'
  end

  put :update, :with => :id do
    @celebrity = Celebrity.find(params[:id])
    if @celebrity.update_attributes(params[:celebrity])
      flash[:notice] = 'Celebrity was successfully updated.'
      redirect url(:celebrities, :edit, :id => @celebrity.id)
    else
      render 'celebrities/edit'
    end
  end

  delete :destroy, :with => :id do
    celebrity = Celebrity.find(params[:id])
    if celebrity.destroy
      flash[:notice] = 'Celebrity was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Celebrity!'
    end
    redirect url(:celebrities, :index)
  end
end
