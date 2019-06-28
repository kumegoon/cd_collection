class CommentsController < ApplicationController
  before_action :set_cd, only: [:new, :create]
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

  private

  def comment_params
    params.require(:comment).permit(:title, :body, :evaluation)
  end

  def set_cd
    @cd = Cd.find(params[:cd_id])
  end
end
