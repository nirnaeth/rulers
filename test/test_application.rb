require_relative "test_helper"

# Setup
class TestApp < Rulers::Application; end

# Tests
class RulersAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_response_is_200
    get "/"

    assert last_response.ok?
  end

  def test_body_contains_expected_text

    get "/"


    assert_true last_response.body.include? "Hello" # the body contains "Hello"
  end
end
