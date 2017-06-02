#!/usr/bin/env ruby
# Author Jim Conner

class Node
  attr_reader :name, :weight
  attr_accessor :right, :left

  def initialize(name, weight)
    raise ArgumentError, 'arg "weight" is required' if weight.nil?
    raise ArgumentError, 'arg "name" is required'   if name.nil?

    @name   = String name
    @weight = Integer weight

    raise ArgumentError, 'arg "weight" must be an integer type' unless weight.is_a?(Integer)
    raise ArgumentError, 'arg "name" must be a string type'     unless name.is_a?(String)

    @left   = @right = nil
  end
end

class Controller
  attr_reader :node, :keys, :names
  attr_accessor :name, :weight

  def initialize(root_node)
    if root_node.is_a?(Node)
      @node = root_node 
      @keys = [root_node.weight]
      @names= [root_node.name]
    else
      raise ArgumentError, 'Arg must be type Node'
    end
  end

  def insert(name, weight)
    inserted = false

    if @keys.include?(weight)
      puts inserted.inspect
      #$stderr.puts 'Duplicate tree entry not allowed for weight %s.' % [weight]

      return false
    end

    if @names.include?(name)
      puts inserted.inspect
      #$stderr.puts 'Duplicate tree entry not allowed for name %s.' % [name]

      return false
    end

    while not inserted
      if weight < @node.weight
        if @node.left.nil?
          @node.left  = Node.new(name, weight)
          inserted = true
        else
          @node = @node.left
        end
      else
        if @node.right.nil?
          @node.right = Node.new(name, weight)
          inserted = true
        else
          @node = @node.right
        end
      end
    end

    @keys  = (@keys << weight).sort
    @names << name
    puts inserted.inspect

    return inserted
  end

  def printOrderedNames
    puts @names.sort.join(' ')
  end

  def weight_exists?(root, weight)
    node    = root
    present = false

    begin
      while node.weight != weight
        node = node.left  if weight < node.weight
        node = node.right if weight > node.weight
      end
      
      present = true if node
    rescue; end

    present
  end
end

node       = Node.new('aRoot', 5)
controller = Controller.new(node)
controller.insert('aNode',1)
controller.insert('bNode',5)
controller.insert('aNode',6)
controller.insert('dNode',8)
controller.insert('aRoot',18)

controller.printOrderedNames
