class ArticlesController < ApplicationController
  before_action :find_article, except: [:new,:create,:index,:from_author]
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  def index
    @articles = Article.all
  end
  def show

  end
  def edit
    
  end 
  def new 
    @article = Article.new 
  end
  def update

    @article.update(title: params[:article][:title], content: params[:article][:content])
    redirect_to @article

end
    def create
       @article = current_user.articles.create(title: params[:article][:title], content: params[:article][:content])
       redirect_to @article

       #También se puede asociar el artículo con el creador mediante @article = Article.create(title: params[:article][:title], content: params[:article][:content], user: current_user) pero la mejor forma de hacerlo es la que utilizamos arriba.

  end 
  def destroy
    @article.destroy
    redirect_to root_path
  
  end
  def from_author
       @user = User.find(params[:user_id])
  end
  def find_article
    @article = Article.find(params[:id])
  end
end
