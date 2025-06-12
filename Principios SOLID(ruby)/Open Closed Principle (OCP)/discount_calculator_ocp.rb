# frozen_string_literal: true

# Esta implementación cumple con el Principio Abierto/Cerrado (OCP) al:
# 1. Definir una clase abstracta para la estrategia de descuento
# 2. Permitir añadir nuevos tipos de descuento sin modificar el código existente
# 3. Usar inyección de dependencias para la estrategia de descuento

# Clase abstracta que define el contrato para las estrategias de descuento
# Cada nueva estrategia debe implementar el método apply
class DiscountStrategy
  # @param price [Float] El precio original
  # @param discount [Float] El valor del descuento
  # @return [Float] El precio con el descuento aplicado
  def apply(price, discount)
    raise NotImplementedError, "Define #{self.class}#apply(price, discount)"
  end
end

# Implementación de descuento porcentual
# Extiende DiscountStrategy sin modificar su código
class PercentageDiscount < DiscountStrategy
  # @param price [Float] El precio original
  # @param discount [Float] El porcentaje de descuento (0-100)
  # @return [Float] El precio con el descuento porcentual aplicado
  def apply(price, discount)
    price - (price * discount / 100)
  end
end

# Implementación de descuento de monto fijo
# Extiende DiscountStrategy sin modificar su código
class FixedDiscount < DiscountStrategy
  # @param price [Float] El precio original
  # @param discount [Float] El monto fijo a descontar
  # @return [Float] El precio con el descuento fijo aplicado
  def apply(price, discount)
    price - discount
  end
end

# Calculadora que utiliza el patrón Strategy para aplicar descuentos
# Esta clase está cerrada para modificación pero abierta para extensión
class DiscountCalculatorOCP
  # @param strategy [DiscountStrategy] La estrategia de descuento a utilizar
  def initialize(strategy)
    @strategy = strategy
  end

  # @param price [Float] El precio original
  # @param discount [Float] El valor del descuento (interpretado según la estrategia)
  # @return [Float] El precio final con el descuento aplicado
  def calculate(price, discount)
    @strategy.apply(price, discount)
  end
end

# Ejemplos de uso que demuestran cómo diferentes estrategias
# pueden ser utilizadas sin modificar el código existente
calculator1 = DiscountCalculatorOCP.new(PercentageDiscount.new)
puts calculator1.calculate(100, 10) # 90.0 (10% de descuento)

calculator2 = DiscountCalculatorOCP.new(FixedDiscount.new)
puts calculator2.calculate(100, 15) # 85.0 (descuento fijo de 15)
