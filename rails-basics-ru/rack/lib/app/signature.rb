# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, response = @app.call(env)
    body = response.first
    sig = get_hash(body)
    body += "\n#{sig}"

    headers['Content-Length'] = body.length.to_s

    [status, headers, [body]]

    # END
  end

  private

  def get_hash(body)
    Digest::SHA256.hexdigest(body)
  end
end
