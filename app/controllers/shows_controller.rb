class ShowsController < ApplicationController
  # GET /shows
  # GET /shows.json
  
  respond_to :html, :xml, :json, :js
  
  def index
    @shows = Show.all

    respond_to do |format|
      format.html # show.html.erb
      format.js  { render :json => @shows.to_json(:include=>[:people]), :callback => params[:callback] }
      format.json  { render :json => @shows }
      format.xml  { render :xml => @shows }
    end

  end

  # GET /shows/1
  # GET /shows/1.json
  def show
    @show = Show.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js  { render :json => @show, :callback => params[:callback] }
      format.json  { render :json => @show }
      format.xml  { render :xml => @show }
    end
  end

  # GET /shows/new
  # GET /shows/new.json
  def new
    @show = Show.new

    respond_with(@show) do |format|
      format.js  { render :json => @show.to_json(:include=>[:people]), :callback => params[:callback] }
    end
  end

  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
  end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(params[:show])

    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render json: @show, status: :created, location: @show }
      else
        format.html { render action: "new" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.json
  def update
    @show = Show.find(params[:id])

    respond_to do |format|
      if @show.update_attributes(params[:show])
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :ok }
    end
  end
end
