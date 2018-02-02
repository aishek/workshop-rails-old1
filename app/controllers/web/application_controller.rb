module Web
  class ApplicationController < ::ApplicationController
    def self.authenticate!(options = {})
      settings = options.merge name: "viraj", password: "password"
      http_basic_authenticate_with settings
    end
  end
end
