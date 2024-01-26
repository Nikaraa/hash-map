require_relative "linked-list/lib/linked_list.rb"

class HashMap
  attr_accessor :bucket, :index
  def initialize
    @LOAD_FACTOR = 0.75
    @bucket = Array.new(16)
    @capacity = 16
  end

  def hash(value)
    hash_code = 0
    prime_number = 13
    value.each_char { |v| hash_code = prime_number * hash_code + v.ord }
    hash_code % @capacity
  end

  def set(key, value)
    if (Float(@bucket.count - @bucket.count(nil) % capacity)) >= LOAD_FACTOR
      @bucket += Array.new(capacity)
      @capacity = @bucket.length
    end
    new_list = LinkedList.new
    new_list.append(value)
    @bucket[key] = new_list
  end

  def get(key)
    if !@bucket[key].nil?
      @bucket[key].head.value
    else
      nil
    end
  end

  def key?(key)
    if @bucket[key]
      true
    else
      false
    end
  end

  def remove(key)
    value = @bucket[key]
    @bucket[key] = nil
    value
  end

  def length
    @bucket.length - @bucket.count(nil)
  end

  def clear
    @bucket = Array.new(16)
  end

  def keys
    array_of_keys = []
    array_of_values = @bucket.select { |key| !key.nil? }
    array_of_values = @bucket.each { |key| array_of_keys.push.index(key) }
    array_of_keys
  end

  def values
    val_arrays = []
    array_of_values = @bucket.select { |key| !key.nil? }
    array_of_values = @bucket.each { |key| val_arrays.push.head.value }
    val_arrays
  end

  def entries
    array_of_entries=[]
    self.values.each_with_index {|val, i| array_of_entries.push([self.keys[i], val])}
    array_of_entries
  end
end
