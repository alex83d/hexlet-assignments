# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    status, headers, response = @app.call(env)
    body = response.body
    end_time = Time.now

    ex_time = duration(start_time, end_time)

    headers['X-Execution-Time'] = format('%.2f', ex_time)

    [status, headers, [body]]
  end

  private

  def duration(start_t, end_t)
    ((end_t - start_t) * 1_000_000).round(2)
  end
end
