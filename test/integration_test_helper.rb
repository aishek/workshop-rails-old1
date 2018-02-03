require 'test_helper'

class ActiveSupport::TestCase
  def auth_headers(user: 'viraj', password: 'password')
    {
      'Authorization' => "Basic #{Base64.encode64("#{user}:#{password}")}"
    }
  end
end

