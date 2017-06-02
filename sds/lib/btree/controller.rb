class Controller
  attr_reader :node, :keys, :names, :parent
  attr_accessor :name, :weight

  def initialize(root_node)
    if root_node.is_a?(Node)
      @node     = root_node 
      @keys     = [root_node.weight]
      @names    = [root_node.name]
      @num_hops = @parent = nil
    else
      raise ArgumentError, 'Arg must be type Node'
    end
  end

  def insert(name, weight)
    inserted = false

    if @keys.include?(weight)
      puts inserted.to_s
      $stderr.puts 'Duplicate tree entry not allowed for weight %s.' % [weight]

      return inserted
    end

    if @names.include?(name)
      puts inserted.to_s
      $stderr.puts 'Duplicate tree entry not allowed for name %s.' % [name]

      return inserted
    end

    begin
      if @node.nil?
        @node = Node.new(name, weight)
      else
        @node.insert(name, weight)
      end
      inserted = true
    rescue; end

    @keys  = (@keys << weight).sort
    @names << name
    puts inserted.to_s

    return inserted
  end

  def printOrderedNames
    puts @names.sort.join(' ')
  end

  def weight_exists?(root, weight)
    if _find_weight(root, weight)
      puts 'Parent node weight for %s is: %s' % [weight, @parent]
    else
      puts 'Node with weight of %s was not found.' % [weight]
    end
  end

  private
  def _find_weight(node, weight)
    return nil if node.nil?

    if weight < node.weight
      @parent = node.weight
      _find_weight(node.left, weight)
    elsif weight > node.weight
      @parent = node.weight
      _find_weight(node.right,weight)
    else
      return node
    end
  end
end
