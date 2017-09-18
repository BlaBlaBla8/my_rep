class ArticlesController < ApplicationController

  def index

    @articles = Article.all

  end

  def create

# render plain: params[:article].inspect

    @article = Article.new(article_params)

    if @article.save

      redirect_to article_path(@article)
      flash[:notice] = "Article was successfully created"
    else

      render 'new'
    end

  end


  def new

    @article = Article.new

  end

  def edit

    @article = Article.find(params[:id])

  end


  def show
    @article = Article.find(params[:id])
  end

  def update

    @article = Article.find(params[:id])

    if @article.update(article_params)

      flash[:notice] = "article was successfully updated"

      redirect_to article_path(@article)

    else

      render 'edit'
      flash[:notice] = "an error has occurred while updating"
    end
  end

  def destroy

    @article = Article.find(params[:id])

    @article.destroy

    flash[:notice] = 'Nice one, it has been deleted'

    redirect_to articles_path

  end


  private

  def article_params

    params.require(:article).permit(:title, :description)

  end

end