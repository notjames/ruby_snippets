class Node
  attr_reader :name, :weight
  attr_accessor :right, :left

  def initialize(name, weight)
    raise ArgumentError, 'arg "weight" must be an Integer type' unless weight.is_a?(Integer)
    raise ArgumentError, 'arg "name" must be a String type'     unless name.is_a?(String)

    @name   = name
    @weight = weight
    @left   = @right = nil
  end

  def insert(name, weight)
    if weight < @weight
      if @left.nil?
        @left = Node.new(name, weight)  
      else
        @left.insert(name, weight)
      end
    elsif weight > @weight
      if @right.nil?
        @right = Node.new(name, weight)
      else
        @right.insert(name, weight)
      end
    end
  end
end
