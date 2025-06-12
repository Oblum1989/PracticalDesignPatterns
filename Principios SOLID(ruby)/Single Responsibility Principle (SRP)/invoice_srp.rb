# frozen_string_literal: true

# Este archivo demuestra una implementación correcta del Principio de Responsabilidad Única (SRP)
# Cada clase tiene una única razón para cambiar y una responsabilidad bien definida.

# Clase responsable únicamente de la lógica de negocio relacionada con facturas
# Responsabilidad: Manejo de items y cálculos de facturación
class InvoiceSRP
  # @param items [Array<Hash>] Lista de items donde cada item tiene :price y :quantity
  def initialize(items)
    @items = items
  end

  # Calcula el total de la factura
  # @return [Float] La suma total de (precio * cantidad) para todos los items
  def total
    @items.sum{ |item| item[:price] * item[:quantity] }
  end
end

# Clase responsable únicamente de la persistencia de datos
# Responsabilidad: Guardar facturas en la base de datos
class InvoiceRepository
  # Guarda una factura en la base de datos
  # @param invoice [InvoiceSRP] La factura a guardar
  def save(invoice)
    puts "Saving #{invoice} to db"
  end
end

# Clase responsable únicamente de la presentación
# Responsabilidad: Mostrar información de la factura
class InvoicePrinter
  # Imprime los detalles de una factura
  # @param invoice [InvoiceSRP] La factura a imprimir
  def print(invoice)
    puts "Invoice total: #{invoice.total}"
  end
end

# Ejemplo de uso del código que demuestra:
# 1. Clara separación de responsabilidades
# 2. Dependencias explícitas a través de la instanciación de objetos
# 3. Facilidad de testing al poder mockear cada componente independientemente
invoice = InvoiceSRP.new([{price: 2000, quantity: 5}, {price: 1000, quantity: 10}])

repository = InvoiceRepository.new
printer = InvoicePrinter.new

printer.print(invoice)
repository.save(invoice)
