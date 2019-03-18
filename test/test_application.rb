require_relative "test_helper"

# Setup
class TestApp < Rulers::Application; end

# Tests
class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"

    assert last_response.ok?

    body = last_response.body

    assert body["Hello"] # the body contains "Hello"
  end
end
