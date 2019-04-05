module Enumerable

  def my_each
    c = 0
    while c < size - 1
      yield(self[c])
      c += 1
    end
  end

  def my_each_with_index
    c = 0
    while c < size - 1
      yield(self[c], c)
      c += 1
    end
  end

  def my_select
    array = Array.new
    c = 0
    while c < size - 1
      array << self[c] if yield(self[c])
      c += 1
    end

    return array
  end

end
