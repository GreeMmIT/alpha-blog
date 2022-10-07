class ArticlesController < ApplicationController

  def show
    #byebug
    @article =  Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end
   
  def create
    @article = Article.new(params.require(:article).permit(:title, :description, :body, :subtitle))
    if @article.save
      flash[:notice] = "Articolo salvato correttamente"
      redirect_to article_path(@article) #pesca in automatico l'id dell'articolo appena creato e esegue la route show 
    else
      render 'new'
    end 
  end



end
