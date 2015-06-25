module BinaryTree
  def hang_node root, key
    if key != @key
      if key > root.key
        if root.right
          hang_node root.right, key
        else
          root.right = Node.new(key)
        end
      elsif key < root.key
        if root.left
          hang_node root.left, key
        else
          root.left = Node.new(key)
        end
      end
    end
  end
  class Node
    include Enumerable
    attr_accessor :key, :left, :right
    def initialize key
      @key = key
    end
    def each &block
      left.each(&block) if left
      block.call(self)
      right.each(&block) if right
    end
    def <=> key
      @key <=> key
    end
  end
end

