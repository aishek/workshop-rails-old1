module Web
  class ArticlesController < Articles::ApplicationController
    authenticate! except: [:index, :show]

    def index
      @articles = Article.all
    end

    def show
      @article = resource_article
    end

    def new
      @article = ArticleType.new
    end

    def create
      @article = ArticleType.new params.require(:article)

      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end

    def edit
      @article = ArticleType.find params[:id]
    end

    def update
      @article = ArticleType.find params[:id]

      if @article.update(params.require(:article))
        redirect_to @article
      else
        render 'edit'
      end
    end

    def moderate
      resource_article.moderate!
      redirect_to resource_article
    end

    def destroy
      resource_article.destroy
      redirect_to articles_path
    end
  end
end
