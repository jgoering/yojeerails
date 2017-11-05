class Balancer
  def balance(paths)
    movecount = ideal_length(paths) - 1
    unused = find_unused(paths)
    unused.each do |path|
      largest = find_largest(paths)
      # split this path
      path.concat(largest.pop(movecount))
    end
    return paths
  end

  def find_unused(paths)
    paths.select { |path| path.size == 1 }
  end

  def find_largest(paths)
    paths.max_by(&:size)
  end

  def ideal_length(paths)
    paths.sum(&:size) / paths.size
  end
end