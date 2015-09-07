class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def article_params
      params.require(:article).permit(:title, :article_type, :annotation, :content)
    end
end
