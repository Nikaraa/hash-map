require_relative "linked-list/lib/linked_list.rb"

class HashSet
  def initialize
    @buckets = Array.new(16) { LinkedList.new }
    @capacity = @buckets.length
    @LOAD_FACTOR = 16
  end

  def hash(value)
    hash_code = 0
    prime_number = 13
    value.each_char { |v| hash_code = prime_number * hash_code + v.ord }
    hash_code
  end

  def get_index(key)
    idx = hash(key) % @capacity
    idx
  end

  def set(key, value)
    if (Float(@bucket.count - @bucket.count(nil) % capacity)) >= LOAD_FACTOR
      @bucket += Array.new(capacity*2) {LinkedList.new}
      @capacity = @bucket.length
    end
    idx = get_index(key)
    bucket[idx].append(key)
  end

  def get(key)
    idx = get_index(key)
    return nil if bucket[idx].empty?
    bucket[idx].find_enum { |node| node.value == key }.value
  end

  def key?(key)
    !!get(key)
  end

  def remove(key)
    idx = get_index(key)
    return nil if bucket[idx].empty?
    bucket[idx].each do |node, i|
      break bucket[idx].remove_at(i) if node.value == key
    end
  end

  def length
    idx = get_index
    return bucket[idx].size
  end

  def clear
    initialize
  end

  def keys
    bucket.each_with_object do |bucket, all|
      next all if bucket.empty?
      bucket.each do |node|
        all.push(node.value)
      end
    end
  end
end
