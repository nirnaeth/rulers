require "rulers/version"
require "rulers/routing"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      klass, action = parse_url(env)

      controller = klass.new(env)

      response = controller.send(action)

      [
        200,
        {'Content-Type' => 'text/html'},
        [response]
      ]
    end
  end

  class Controller
    def initialize(env)
      @env = env
    end

    def env
      @env
    end
  end
end
