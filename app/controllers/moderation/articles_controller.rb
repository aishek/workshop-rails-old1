module Moderation
  class ArticlesController < ApplicationController
    def index
      default_ransack_params = { state_eq: 'moderation' }
      @q = Article.ransack(params[:q] || default_ransack_params)

      @articles = @q.result(distinct: true)
    end

    def edit
      @article = Article.find params[:id]
      @moderate_article_form = ModerateArticleForm.new(@article)
    end

    def update
      @article = Article.find params[:id]
      @moderate_article_form = ModerateArticleForm.new(@article)

      if @moderate_article_form.validate(article_params)
        @moderate_article_form.save

        redirect_to moderation_articles_path
      else
        render 'edit'
      end
    end

    private
    def article_params
      params.require(:moderate_article).permit(:state_event, :category_id)
    end
  end
end
