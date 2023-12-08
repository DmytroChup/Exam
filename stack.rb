class Stack
  attr_reader :items

  def initialize
    @items = []
  end

  # Додати елемент
  def push(element)
    @items.push(element)
  end

  # Вилучити останній елемент
  def pop
    @items.pop
  end

  # Переглянути останній елемент
  def peek
    @items.last
  end

  # Пустий чи ні
  def empty?
    @items.empty?
  end

  # Розмір стеку
  def size
    @items.size
  end
end

stack = Stack.new
stack.push(5)
stack.push(10)
stack.push(15)

puts "Peek: #{stack.peek}"
puts "Size: #{stack.size}"

puts "Pop: #{stack.pop}"
puts "Size after pop: #{stack.size}"

print "Stack: #{stack.items}"
