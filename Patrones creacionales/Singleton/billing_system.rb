# frozen_string_literal: true
require_relative 'app_logger'
require_relative 'invoice'

# Simulación del proceso
class BillingSystem
  def self.run
    logger = AppLogger.instance
    logger.log('Iniciando sistema de facturación...')

    items = [
      { name: 'Laptop', price: 1200, quantity: 1 },
      { name: 'Mouse', price: 50, quantity: 2 },
      { name: 'Keyboard', price: 100, quantity: 1 }
    ]

    invoice = Invoice.new(items, 'customer@example.com')
    invoice.process

    logger.log('Proceso de facturación finalizado.')
  end
end
