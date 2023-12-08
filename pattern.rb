# Абстрактний клас або інтерфейс для обробників запитів
class Handler
  attr_reader :successor

  def initialize(successor = nil)
    @successor = successor
  end

  def handle_request(request)
    if can_handle_request?(request)
      handle(request)
    elsif @successor
      @successor.handle_request(request)
    else
      puts "Неможливо обробити запит: #{request}"
    end
  end

  def can_handle_request?(request)
    raise NotImplementedError, "#{self.class} повинен реалізувати 'can_handle_request?'"
  end

  def handle(request)
    raise NotImplementedError, "#{self.class} повинен реалізувати 'handle'"
  end
end

# Конкретний обробник для операції додавання
class AddHandler < Handler
  def can_handle_request?(request)
    request[:operation] == 'add'
  end

  def handle(request)
    result = request[:operands].sum
    puts "Додавання чисел #{request[:operands]} дорівнює #{result}"
  end
end

# Конкретний обробник для операції множення
class MultiplyHandler < Handler
  def can_handle_request?(request)
    request[:operation] == 'multiply'
  end

  def handle(request)
    result = request[:operands].inject(:*)
    puts "Множення чисел #{request[:operands]} дорівнює #{result}"
  end
end

# Створення ланцюжка обробників
add_handler = AddHandler.new
multiply_handler = MultiplyHandler.new(add_handler)

# Послідовно надсилаємо запити на обробку
multiply_handler.handle_request(operation: 'add', operands: [3, 5]) # Обробник множення передає запит обробнику додавання
multiply_handler.handle_request(operation: 'multiply', operands: [2, 3]) # Обробник множення обробляє цей запит
multiply_handler.handle_request(operation: 'subtract', operands: [10, 5]) # Неможливо обробити цей запит
