class Node
	attr_accessor :value,:parent,:left_child,:right_child
	@@nodes = 0
	@@all_nodes = []
	@@root = nil
	def initialize(val , parent = nil ,left_child = nil,right_child = nil)
		@value = val
		@parent = parent
		if @@root == nil
			@@root = self
		end
		if  !(left_child.nil?) && left_child.value <= self.value
			@left_child = left_child 
		end

		if !(right_child.nil?) && right_child.value >= self.value
			@right_child = right_child
		end
		@@nodes += 1
		@@all_nodes << val
	end

	def add(num)

		current = @@root
		while(true)
		if num <= current.value
			if current.left_child == nil  
				current.left_child = Node.new(num,current) 
				break
			else
				current = current.left_child
			end
		else 
			if current.right_child == nil
				current.right_child =  Node.new(num,current) 
				break
			else
			current = current.right_child
			end
		end

		end 
	end

	def super_parent
		node = self.parent
		until node.parent == nil
			node = node.parent
		end
		node
	end
	def to_s
		"Value: #{value}
		Left Child: #{left_child&.value || 'x'}
		Right Child: #{right_child&.value || 'x'} 
		Parent: #{parent&.value || 'x'}"
	end
	def self.nodes
		@@nodes
	end 
	def self.all_nodes
		@@all_nodes
	end
end




def build_tree(arr)
	root = Node.new(arr[0])
	for num in arr[1..-1]
		root.add(num)
	end 
	root
end

b = build_tree([158,4,3249,232,19,15,19191,0,-10,49,1936]) # => 
  puts b.left_child.right_child

s =  Node.all_nodes
p s

		                  
current = b


# while current.right_child
# 	if current.right_child.left_child
# 		print "#{current.right_child.left_child.value} "
# 	end
# 	print "#{current.value} "
# 	 print "#{current.right_child.value} "
# 	 current = current.right_child
# end	                  