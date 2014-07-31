module GschoolEnumerable

  def g_each(&block)
    for item in self
      block.call(item)
    end
    return self
  end

  def g_select
    array = []
    self.g_each do |item|
      if yield(item)
        array << item
      end
    end
    array
  end

  def g_reject
    array = []
    self.g_each do |item|
      if yield(item) == false
        array << item
      end
    end
    array
  end


  def g_map
    array = []
    self.g_each do |item|
      array << yield(item)
    end
    array
  end

  def g_find
    self.g_each do |item|
      return item if yield(item)
    end
    nil
  end


  def g_select!
    array = []
    self.g_each do |item|
      if yield(item) == false
        item.g_reject
      end
    end
    array
  end

end
