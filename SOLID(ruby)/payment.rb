# frozen_string_literal: true

class Payment
  def pay(amount)
    raise NotImplementedError, "Este método debe ser implementado en la subclase"
  end
end

class CreditCardPayment < Payment
  def pay(amount)
    puts "Pagando $#{amount} con tarjeta de crédito"
  end
end

class CryptoPayment < Payment
  def pay(amount)
    raise "No se puede procesar pagos directamente con criptomonedas"
  end
end

def process_payment(payment, amount)
  payment.pay(amount)
end

credit_card = CreditCardPayment.new
crypto = CryptoPayment.new

process_payment(credit_card, 100)
process_payment(crypto, 200)