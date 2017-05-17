module Rack
  class RejectMethods
    METHOD_BLACKLIST = %w(TRACE).freeze

    def initialize(app)
      @app = app
      @blacklist = blacklist
    end

    def call(env)
      return @app.call(env) unless @blacklist.include?(env['REQUEST_METHOD'])
      [405, {}, ["TRACE requests not allowed!\n"]]
    end

    private def blacklist
      ENV.fetch('HTTP_METHOD_BLACKLIST'.split(',')) { METHOD_BLACKLIST }
    end
  end
end
