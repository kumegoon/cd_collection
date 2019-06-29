class CommentsController < ApplicationController
  before_action :set_cd, only: [:show, :new, :create, :edit]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.attributes = {
      cd_id: params[:cd_id],
      user_id: current_user.id 
    }
    if @comment.save
      redirect_to @comment.cd, notice: "レビューを登録しました"
    else  
      render :new
    end
  end

  def show
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.cd, notice: "レビューを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.cd, notice: "レビューを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :evaluation)
  end

  def set_cd
    @cd = Cd.find(params[:cd_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
