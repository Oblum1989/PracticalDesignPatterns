# frozen_string_literal: true

class InvoiceSRP
  def initialize(items)
    @items = items
  end

  def total
    @items.sum{ |item| item[:price] * item[:quantity] }
  end
end

class InvoiceRepository
  def save(invoice)
    puts "Saving #{invoice} to db"
  end
end

class InvoicePrinter
  def print(invoice)
    puts "Invoice total: #{invoice.total}"
  end
end

#Uso del código
invoice = InvoiceSRP.new([{price: 2000, quantity: 5}, {price: 1000, quantity: 10}])

repository = InvoiceRepository.new
printer = InvoicePrinter.new

printer.print(invoice)
repository.save(invoice)