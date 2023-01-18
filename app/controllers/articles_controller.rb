class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article updated successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy

    redirect_to root_path, status: :see_other, notice: 'Article was successfully destroyed'
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
