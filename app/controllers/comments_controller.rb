class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    render :index
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = Comment.find(params[:id])
    @comment.destroy
    render :index
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
