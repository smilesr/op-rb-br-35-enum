module Enumerable
  def my_each
    return self unless block_given?
    for i in self 
      yield i
    end  
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0..self.length-1
      yield i, self[i]
    end
  end

  def my_select

    my_arr=[]
    self.my_each do |x|
      if yield x
        my_arr.push(x)
      end
    end
  return my_arr
  end

  def my_all?
    return self unless block_given?
    self.my_each do |x|
      if !(yield x)
        return false
      end
    end
    return true

  end

  def my_any?
    return self unless block_given?
    self.my_each do |x|
      if yield x
        return true
      end
    end
    return false
  end

  def my_none?
    return self unless block_given?
    self.my_each do |x|
      if yield x
        return false
      end
    end
    return true
  end

  def my_count
    count = 0
    self.my_each do |x|
      count += 1
    end
    return count

  end

  # def my_map
  #   return self unless block_given?
  #   array_result=[]
  #   self.my_each do |x|
  #     array_result.push(yield x)
  #     p array_result
  #   end
  #   return array_result
  # end

  # def my_map(pro)
  #   array_result=[]
  #   self.my_each do |x|
  #     array_result.push(pro.call x)
  #   end
  #   return array_result
  # end

  def my_map(pro = nil)
    array_result=[]
    self.my_each do |x|
      if pro.nil?
        array_result.push(yield x)
      else
        array_result.push(pro.call x)
      end
    end
    
    return array_result
  end

  def my_inject
    return self unless block_given?
    sum = 0
    self.my_each do |n|
      yield sum, n
      sum += n
    end
    return sum
  end
end

def multiply_els
  arr = [2,4,5]
  arr.my_inject{|agg, x| agg + x}
end 

arr = [2,4,6,7,12]
# proc_thing = Proc.new{|x| x * 2}
result = arr.my_map{|x| x * 2}
# result = arr.my_map(proc_thing) 
# result = arr.my_map{|x| x * 3}
p result

