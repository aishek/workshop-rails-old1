module Web
  module Articles
    module Comments
      class LikesController < Web::Articles::Comments::ApplicationController
        def create
          Article::Comment::LikeMutator.create! resource_comment

          redirect_to article_path(resource_article)
        end
      end
    end
  end
end
