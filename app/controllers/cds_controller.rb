class CdsController < ApplicationController
  before_action :set_cd, only: [:edit, :update, :destroy]

  def index
    @q = Cd.ransack(params[:q])
    @cds = @q.result.with_attached_image.find_newest_cds(params[:page])
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
    @cd = Cd.with_attached_image.includes(comments: :user).find(params[:id])
  end

  def edit
  end

  def update
    if @cd.update(cd_params)
      redirect_to @cd , notice: "CDを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @cd.destroy
    redirect_to cds_path, notice: "CDを削除しました。"
  end

  private

  def cd_params
    params.require(:cd).permit(:title, :artist_name, :price, :description, :genre_id, :new_image, :genre_id)
  end

  def set_cd
    @cd = Cd.find(params[:id])
  end
end
