require "rulers/version"
require "rulers/routing"

module Rulers
  class Error < StandardError; end

  class Application
    def call(env)
      return error(404) if env['PATH_INFO'] == '/favicon.ico'

      klass, action = parse_url(env)

      controller = klass.new(env)

      body = controller.send(action)

      success(200, body)
    rescue StandardError => error
      error(500, error.message)
    end

    private

    def success(code, body = nil)
      [
        code,
        {'Content-Type' => 'text/html'},
        [body]
      ]
    end

    def error(code, message = nil)
      [
        code,
        {'Content-Type' => 'text/html'},
        ["Error! #{message}"]
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
