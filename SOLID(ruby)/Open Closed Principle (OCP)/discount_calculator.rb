# frozen_string_literal: true

class DiscountCalculator
  def calculate(price, discount, type)
    if type == :percent
      price - (price * discount / 100)
    elsif type == :fixed
      price - discount
    else
      price
    end
  end
end

## prueba de código
calculator = DiscountCalculator.new
puts calculator.calculate(2000, 1000, 1000)
puts calculator.calculate(1000, 1000, 1000)
