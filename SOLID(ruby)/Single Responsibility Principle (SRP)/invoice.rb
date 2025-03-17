# frozen_string_literal: true

class Invoice
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def total
    @items.sum { |item| item[:price] * item[:quantity] }
  end
end

class InvoiceSaver
  def self.save_to_db(invoice)
    puts "Saving invoice with total #{invoice.total} to DB"
  end
end

class InvoicePrinter
  def self.print(invoice)
    puts "Invoice total: #{invoice.total}"
  end
end

# Uso de código
invoice = Invoice.new([{ price: 2000, quantity: 5 }, { price: 1000, quantity: 10 }])

invoice.total
InvoiceSaver.save_to_db(invoice)
InvoicePrinter.print(invoice)
