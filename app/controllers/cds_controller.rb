class CdsController < ApplicationController
  def index
    @cds = Cd.all 
  end

  def new
    @cd = Cd.new
  end

  def create
    @cd = Cd.new(cd_params)
    if @cd.save
      redirect_to @cd, notice: "CDを登録しました"
    else  
      render :new
    end
  end

  def show
    @cd = Cd.find(params[:id])
  end

  private

  def cd_params
    params.require(:cd).permit(:title, :artist_name, :price, :description, :genre_id)
  end
end
