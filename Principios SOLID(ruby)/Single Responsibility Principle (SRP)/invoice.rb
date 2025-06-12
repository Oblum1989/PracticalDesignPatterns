# frozen_string_literal: true

# NOTA: Este código NO sigue el Principio de Responsabilidad Única (SRP) por las siguientes razones:
# 1. Las clases InvoiceSaver e InvoicePrinter están fuertemente acopladas a Invoice a través de métodos de clase
# 2. La estructura actual hace difícil testear y mantener el código por separado
# 3. Los cambios en la persistencia o presentación podrían afectar a la lógica de negocio
#
# Para ver una implementación que SÍ sigue SRP, consultar el archivo invoice_srp.rb
class Invoice
  attr_reader :items

  # Inicializa una nueva factura con una lista de items
  # @param items [Array<Hash>] Array de hashes conteniendo price y quantity de cada item
  def initialize(items)
    @items = items
  end

  # Calcula el total de la factura multiplicando precio por cantidad para cada item
  # @return [Float] El total de la factura
  def total
    @items.sum { |item| item[:price] * item[:quantity] }
  end
end

# Esta implementación viola SRP al usar métodos de clase que crean un acoplamiento fuerte
# con la clase Invoice. Debería ser una clase independiente con métodos de instancia.
class InvoiceSaver
  # Guarda una factura en la base de datos
  # @param invoice [Invoice] La factura a guardar
  def self.save_to_db(invoice)
    puts "Saving invoice with total #{invoice.total} to DB"
  end
end

# Al igual que InvoiceSaver, esta implementación crea un acoplamiento innecesario
# y dificulta el testing al usar métodos de clase en lugar de métodos de instancia
class InvoicePrinter
  # Imprime los detalles de una factura
  # @param invoice [Invoice] La factura a imprimir
  def self.print(invoice)
    puts "Invoice total: #{invoice.total}"
  end
end

# Ejemplo de uso del código - Note cómo el uso de métodos de clase
# hace que las dependencias sean implícitas en lugar de explícitas
invoice = Invoice.new([{ price: 2000, quantity: 5 }, { price: 1000, quantity: 10 }])

invoice.total
InvoiceSaver.save_to_db(invoice)
InvoicePrinter.print(invoice)
