# frozen_string_literal: true
require 'singleton'
require 'json'
require_relative 'app_logger'

# Base de Datos Simulada con Singleton
class Database
  include Singleton

  FILE_PATH = './Singleton/database.json'

  def initialize
    @logger = AppLogger.instance
    @data = load_data
  end

  def save_invoice(invoice)
    @data[:invoices] << invoice.to_hash
    File.write(FILE_PATH, JSON.pretty_generate(@data))
    @logger.log("Factura guardada: #{invoice.total}")
  end

  private

  def load_data
    return { invoices: [] } unless File.exist?(FILE_PATH)

    JSON.parse(File.read(FILE_PATH), symbolize_names: true)
  end
end