class LoadError
  def library_name
    self.message.split(" -- ").last
  end
end
