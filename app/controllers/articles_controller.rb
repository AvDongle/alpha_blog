class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :show, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all

  end

  def edit
  end

  def create
    #debugger
    #render plain:params[:article].inspect
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was made yay"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article successfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    flash[:danger] = "Article was kuputski"
  end

  private
  def article_params
    params.require(:article).permit(:title,:description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
