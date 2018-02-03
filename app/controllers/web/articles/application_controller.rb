module Web
  module Articles
    class ApplicationController < Web::ApplicationController
      before_action { append_view_path 'app/views/web/articles' }

      def article
        @article ||= Article.find(params[:article_id])
      end
    end
  end
end
