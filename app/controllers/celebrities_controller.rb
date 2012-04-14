class CelebritiesController < ApplicationController
  # GET /celebrities
  # GET /celebrities.json
  def index
    @celebrities = Celebrity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @celebrities }
    end
  end

  # GET /celebrities/1
  # GET /celebrities/1.json
  def show
    @celebrity = Celebrity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @celebrity }
    end
  end

  # GET /celebrities/new
  # GET /celebrities/new.json
  def new
    @celebrity = Celebrity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @celebrity }
    end
  end

  # GET /celebrities/1/edit
  def edit
    @celebrity = Celebrity.find(params[:id])
  end

  # POST /celebrities
  # POST /celebrities.json
  def create
    @celebrity = Celebrity.new(params[:celebrity])

    respond_to do |format|
      if @celebrity.save
        format.html { redirect_to @celebrity, notice: 'Celebrity was successfully created.' }
        format.json { render json: @celebrity, status: :created, location: @celebrity }
      else
        format.html { render action: "new" }
        format.json { render json: @celebrity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /celebrities/1
  # PUT /celebrities/1.json
  def update
    @celebrity = Celebrity.find(params[:id])

    respond_to do |format|
      if @celebrity.update_attributes(params[:celebrity])
        format.html { redirect_to @celebrity, notice: 'Celebrity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @celebrity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /celebrities/1
  # DELETE /celebrities/1.json
  def destroy
    @celebrity = Celebrity.find(params[:id])
    @celebrity.destroy

    respond_to do |format|
      format.html { redirect_to celebrities_url }
      format.json { head :no_content }
    end
  end
end
