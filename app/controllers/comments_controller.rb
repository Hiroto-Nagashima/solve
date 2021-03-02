class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @comments = @post.comments
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  # def eachComment
  #   target_id = params[:post_id]

  #   target_comment_list = Comment.where(post_id: target_id)

  #   render json: target_comment_list.to_json
  # end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
