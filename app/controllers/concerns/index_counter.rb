module IndexCounter

  private

  def increment_counter
    session[:counter] = session.fetch(:counter, 0) + 1
  end

  def set_counter
    @counter = session[:counter]
  end

  def adjust_counter
    session[:counter] = 0
  end
end