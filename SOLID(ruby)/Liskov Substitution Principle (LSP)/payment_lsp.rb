# frozen_string_literal: true

class PaymentLSP
  def pay(amount)
    raise NotImplementedError, "Debe implementarse en una subclase"
  end
end

class OnlinePayment < PaymentLSP
  def pay(amount)
    puts "Pagando $#{amount} con un método de pago en línea"
  end
end

class CreditCardPayment < OnlinePayment
  def pay(amount)
    puts "Pagando $#{amount} con tarjeta de crédito"
  end
end

class CryptoPayment < PaymentLSP
  def generate_wallet_address(amount)
    "Se generó una dirección de wallet para recibir $#{amount} en criptomonedas"
  end
end

def process_payment(payment, amount)
  if payment.is_a?(OnlinePayment)
    payment.pay(amount)
  elsif payment.is_a?(CryptoPayment)
    puts payment.generate_wallet_address(amount)
  else
    raise "Método de pago no soportado"
  end
end

credit_card = CreditCardPayment.new
crypto = CryptoPayment.new

process_payment(credit_card, 100)
process_payment(crypto, 200)
