module Moderation
  class ArticlesController < ApplicationController
    def index
      default_ransack_params = { state_eq: 'moderation' }
      @q = Article.ransack(params[:q] || default_ransack_params)

      @articles = @q.result(distinct: true)
    end

    def edit
      @article = Moderation::ArticleType.find params[:id]
    end

    def update
      @article = Moderation::ArticleType.find params[:id]

      if @article.update(params.require(:article))
        redirect_to moderation_articles_path
      else
        render 'edit'
      end
    end
  end
end
