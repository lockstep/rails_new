module Rack
  class RejectTrace
    def initialize(app)
      @app = app
    end

    def call(env)
      return @app.call(env) unless env['REQUEST_METHOD'] == 'TRACE'
      [405, {}, []]
    end
  end
end
