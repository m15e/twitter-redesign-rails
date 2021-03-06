class SourcesController < ApplicationController
  include ApplicationHelper

  before_action :check_login
  before_action :set_source, only: %i[show edit update destroy]

  # GET /sources
  # GET /sources.json
  def index
    @source = Source.new
    @sources = Source.order('created_at DESC').includes(:author, :comments)
    @users = User.where.not(id: current_user).limit(15)
    @following = User.find(current_user).followeds
  end

  # GET /sources/1
  # GET /sources/1.json
  def show; end

  # GET /sources/new
  def new
    @source = Source.new
  end

  # GET /sources/1/edit
  def edit; end

  # POST /sources
  # POST /sources.json
  def create
    if current_user
      @source = User.find(current_user).sources.new(source_params)
    else
      flash[:notice] = 'you need to be logged in to create posts!'
      redirect_to sources_path
    end

    respond_to do |format|
      if @source.save
        format.html { redirect_to request.referrer, notice: 'Source was successfully created.' }
        format.json { render :show, status: :created, location: @source }
      else
        format.html { render :new }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sources/1
  # PATCH/PUT /sources/1.json
  def update
    respond_to do |format|
      if @source.update(source_params)
        format.html { redirect_to @source, notice: 'Source was successfully updated.' }
        format.json { render :show, status: :ok, location: @source }
      else
        format.html { render :edit }
        format.json { render json: @source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sources/1
  # DELETE /sources/1.json
  def destroy
    if @source.destroy
      redirect_to sources_url, notice: 'Source was successfully destroyed.'
    else
      redirect_to request.referrer, notice: 'Source did not get destroyed.'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_source
    @source = Source.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def source_params
    params.require(:source).permit(:text)
  end
end
