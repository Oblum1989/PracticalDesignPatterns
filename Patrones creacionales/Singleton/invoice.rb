# frozen_string_literal: true
require_relative 'app_logger'
require_relative 'database'

# Representa una factura
class Invoice
  attr_reader :items, :customer_email

  def initialize(items, customer_email)
    @items = items
    @customer_email = customer_email
    @logger = AppLogger.instance
  end

  def total
    items.sum { |item| item[:price] * item[:quantity] }
  end

  def to_hash
    {
      customer_email: customer_email,
      items: items,
      total: total
    }
  end

  def process
    @logger.log("Generando factura para #{customer_email}")
    Database.instance.save_invoice(self)
    @logger.log("Factura generada exitosamente.")
  end
end
