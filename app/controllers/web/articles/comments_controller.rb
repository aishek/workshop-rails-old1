module Web
  module Articles
    class CommentsController < ApplicationController
      authenticate! only: :destroy

      def create
        @comment = article.comments.create(comment_params)
        redirect_to article_path(@article)
      end

      def like
        comment = article.comments.find(params[:id])
        LikeCommentService.new.call(comment: comment)

        redirect_to article_path(article)
      end

      def destroy
        @comment = article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(article)
      end

      private
      def comment_params
        params.require(:comment).permit(:commentor, :body)
      end
    end
  end
end
