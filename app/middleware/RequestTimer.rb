class RequestTimer

  def initializer(app)
    @app = app
  end

  def call(env)
    start_time = Time.now
    Rails.logger.info(start_time)
    data = @app.call(env)
    end_time = Time.now
    Rails.logger.info(end_time)
    data
  end

end