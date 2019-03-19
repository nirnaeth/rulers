require_relative "test_helper"

# Setup
class TestController < Rulers::Controller
  def action_test
    "Hello"
  end
end

class TestApp < Rulers::Application; end

# Tests
class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_response_is_200
    get "/test/action_test"

    assert last_response.ok?
  end

  def test_body_contains_expected_text
    get "/test/action_test"

    assert_true last_response.body.include? "Hello" # the body contains "Hello"
  end

  def test_custom_page_for_server_error
    get "/test/no_idea"

    assert last_response.body.include? "Error!"
  end
end
