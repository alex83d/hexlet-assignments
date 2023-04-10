# frozen_string_literal: true

class AdminPolicy
  STATUS = 403
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    return [STATUS, {}, []] if admin_path?(env)
    
    @app.call(env)
    # END
  end

  private

  def admin_path?(env)
    path = env['PATH_INFO']
    path.start_with?('/admin')
  end
end
