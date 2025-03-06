# frozen_string_literal: true

class Invoice
  def initialize(items)
    @items = items
  end

  def total
    @items.sum{ |item| item[:price] * item[:quantity] }
  end

  def save_to_db
    puts "Saving to DB"
  end

  def print_invoice
    puts "Invoice total: #{total}"
  end
end

# Uso de código
invoice = Invoice.new([{price: 2000, quantity: 5}, {price: 1000, quantity: 10}])

total = invoice.total
save_to_db = invoice.save_to_db
printer = invoice.print_invoice