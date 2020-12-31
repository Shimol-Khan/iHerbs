class HerbsController < ApplicationController

  load_and_authorize_resource
  before_action :set_herb, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @herbs = Herb.all.order('created_at DESC').where(["name like ?", "%#{params[:search]}%"]).paginate(page: params[:page], per_page: 6)
  end

  def show
  end

  def new
    @herb = current_user.herbs.build
  end

  def edit
  end

  def create
    @herb = current_user.herbs.build(herb_params)

    respond_to do |format|
      if @herb.save
        format.html { redirect_to @herb, notice: 'Herb was successfully created.' }
        format.json { render :show, status: :created, location: @herb }
      else
        format.html { render :new }
        format.json { render json: @herb.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @herb.update(herb_params)
        format.html { redirect_to @herb, notice: 'Herb was successfully updated.' }
        format.json { render :show, status: :ok, location: @herb }
      else
        format.html { render :edit }
        format.json { render json: @herb.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @herb.destroy
    respond_to do |format|
      format.html { redirect_to herbs_url, notice: 'Herb was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_herb
      @herb = Herb.find(params[:id])
    end

    def herb_params
      params.require(:herb).permit(:name, :description, :usage, :image_link, :user_id)
    end
end
