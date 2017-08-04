class Map

  def initialize
    @dictionary = []
  end

  def assign(key, value)
    #if it includes key, delete old then add new
    if @dictionary.any? { |pair| pair[0] == key }
      @dictionary.each do |existing|
        if existing[0] == key
          existing[1] = value
        end
      end
    else
      @dictionary << [key, value]
    end
  end

  def lookup(key)
    @dictionary.each do |pair|
      return pair[1] if pair[0] == key
    end
    nil
  end

  def remove(key)

    results = []
    @dictionary.each_with_index do |pair, i|
      results << pair unless pair[0] == key
    end

    @dictionary = results 
  end

  def show
    @dictionary
  end

end
