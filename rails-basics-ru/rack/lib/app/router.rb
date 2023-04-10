# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    path = request.path
    if path == '/'
      [200, { 'Content-Type' => 'text/html' }, ['Hello, world!']]
    elsif path == '/about'
      [200, { 'Content-Type' => 'text/html' }, ['This is the about page.']]
    else
      [404, { 'Content-Type' => 'text/html' }, ['404 Not Found']]
    end
    # END
  end
end
