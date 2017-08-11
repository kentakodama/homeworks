class LRUCache
    def initialize(size)
      @size = size
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      # first check if it exists in the cache,
      if includes?(el)
        @cache.delete(el)
        @cache << el
      else
        @cache.shift if full?
        @cache << el
      end
      #if it exists in the chache, delete it then push the element to the cache
      #if it doesnt exist, check if full  shift off one element and push the elemenet
    end

    def show
      # shows the items in the cache, with the LRU item first
      @cache.dup
    end

    private
    # helper methods go here!

    def full?
      @cache.length == @size
    end

    def includes?(el)
      @cache.include?(el)
    end

end


  johnny_cache = LRUCache.new(4)

    johnny_cache.add("I walk the line")
    johnny_cache.add(5)

    johnny_cache.count # => returns 2

    johnny_cache.add([1,2,3])
    johnny_cache.add(5)
    johnny_cache.add(-5)
    johnny_cache.add({a: 1, b: 2, c: 3})
    johnny_cache.add([1,2,3,4])
    johnny_cache.add("I walk the line")
    johnny_cache.add(:ring_of_fire)
    johnny_cache.add("I walk the line")
    johnny_cache.add({a: 1, b: 2, c: 3})


    p johnny_cache.show
