module Web
  class ArticlesController < Articles::ApplicationController
    authenticate! except: [:index, :show]

    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = ArticleForm.new(Article.new)
    end

    def edit
      @article = ArticleForm.new(Article.find(params[:id]))
    end

    def create
      @article = ArticleForm.new(Article.new)

      if @article.validate(article_params)
        @article.save
        redirect_to @article
      else
        render 'new'
      end
    end

    def update
      @article = ArticleForm.new(Article.find(params[:id]))

      if @article.validate(article_params)
        @article.save
        redirect_to @article
      else
        render 'edit'
      end
    end

    def moderate
      @article = Article.find(params[:id])
      @article.moderate!
      redirect_to @article
    end

    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      redirect_to articles_path
    end

    private
    def article_params
      params.require(:article).permit(:title, :text, links_attributes: [:id, :url, :_destroy])
    end
  end
end
