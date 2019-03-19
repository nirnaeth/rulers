module Rulers
  class Application

    def parse_url(env)
      _, controller, action, after = env["PATH_INFO"].split('/', 4) # split no more than 4 times

      [class_for(controller), action]
    end

    private

    def class_for(controller)
      controller = controller.capitalize # ex: https://www.mysite.com/people/create" -> People"
      controller += "Controller" # "PeopleController"

      # https://ruby-doc.org/core-2.6.2/Module.html#method-i-const_get
      # The value of the constant is returned if a definition is found, otherwise a NameError is raised.
      # It will recursively look up constant names if a namespaced class name is provided
      Object.const_get(controller)
    end
  end
end
