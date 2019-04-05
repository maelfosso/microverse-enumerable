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

  def my_all
    return false if !block_given?

    c = 0
    while c < size - 1
      return false if !yield(self[c])
      c += 1
    end

    return true
  end

  def my_any
    return true if !block_given?

    c = 0
    while c < size - 1
      return true if yield(self[c])
      c += 1
    end

    return false
  end

  def my_none
    return true if !block_given?

    c = 0
    while c < size - 1
      return false if yield(self[c])
      c += 1
    end

    return true
  end

  def my_count(x=nil)
    return size if !block_given? && x.nil?

    if !block_given?
      if (!x.nil?)
        c = 0
        n = 0
        while c < size - 1
          n += 1 if self[c] == x
          c += 1
        end

        return n
      else
        return size
      end
    end

    c = 0
    n = 0
    while c < size - 1
      n += 1 if yield(self[c])
      c += 1
    end

    return n
  end



end
