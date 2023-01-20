class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created'
    else
      redirect_to @article, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
