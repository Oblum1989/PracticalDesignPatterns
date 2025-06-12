# frozen_string_literal: true

# NOTA: Esta implementación NO cumple con el Principio Abierto/Cerrado (OCP) porque:
# 1. Para añadir nuevos tipos de descuento, necesitamos modificar la clase existente
# 2. El método calculate tiene múltiples responsabilidades y razones para cambiar
# 3. La lógica de los diferentes tipos de descuento está acoplada en un solo método
#
# Para ver una implementación que SÍ cumple con OCP, consultar discount_calculator_ocp.rb

class DiscountCalculator
  # Calcula el precio final después de aplicar un descuento
  # @param price [Float] El precio original del producto
  # @param discount [Float] El monto o porcentaje de descuento a aplicar
  # @param type [Symbol] El tipo de descuento (:percent para porcentaje, :fixed para monto fijo)
  # @return [Float] El precio final después del descuento
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

## Ejemplo de uso del código
calculator = DiscountCalculator.new
puts calculator.calculate(2000, 10, :percent) # Aplica un 10% de descuento
puts calculator.calculate(1000, 200, :fixed)  # Aplica un descuento fijo de 200
