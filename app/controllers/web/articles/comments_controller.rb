module Web
  module Articles
    class CommentsController < Web::Articles::Comments::ApplicationController
      authenticate! only: :destroy

      def create
        @comment = resource_article.comments.create(comment_params)
        redirect_to article_path(resource_article)
      end

      def destroy
        resource_comment.destroy
        redirect_to article_path(resource_article)
      end

      private
      def comment_params
        params.require(:comment).permit(:commentor, :body)
      end
    end
  end
end
