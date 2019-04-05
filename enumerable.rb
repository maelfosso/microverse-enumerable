module Enumerable

  def my_each
    c = 0
    while c < size - 1
      yield(self[c])
      c += 1
    end
  end

end
