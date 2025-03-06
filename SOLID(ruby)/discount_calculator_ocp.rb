# frozen_string_literal: true

class DiscountStrategy
  def apply(price, discount)
    raise NotImplementedError, "Define #{self.class}#apply(price, discount)"
  end
end

class PercentageDiscount < DiscountStrategy
  def apply(price, discount)
    price - (price * discount / 100)
  end
end

class FixedDiscount < DiscountStrategy
  def apply(price, discount)
    price - discount
  end
end

class DiscountCalculatorOCP
  def initialize(strategy)
    @strategy = strategy
  end

  def calculate(price, discount)
    @strategy.apply(price, discount)
  end
end

calculator1 = DiscountCalculatorOCP.new(PercentageDiscount.new)
puts calculator1.calculate(100, 10) # 90.0

calculator2 = DiscountCalculatorOCP.new(FixedDiscount.new)
puts calculator2.calculate(100, 15) # 85.0
