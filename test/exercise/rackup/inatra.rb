module Inatra
  class << self
    @@routes = {}

    def routes(&block)
      instance_eval(&block)
    end

    def method_missing(method_name, *args, &block)
      if block_given?
        path = args.first
        add_route(method_name, path, block)
      else
        raise 'No block given'
      end
    end

    def call(env)
      method = env['REQUEST_METHOD'].downcase.to_sym
      path = env['PATH_INFO']

      route = @@routes.dig(method, path)
      route.call
    end

    private

    def add_route(method_name, path, body)
      @@routes.merge!(method_name => { path => body })
    end
  end
end
