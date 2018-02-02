module Web
  module Articles
    class ApplicationController < Web::ApplicationController
      before_action { append_view_path 'app/views/web/articles' }
    end
  end
end
