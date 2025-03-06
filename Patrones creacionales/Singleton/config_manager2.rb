# frozen_string_literal: true

class ConfigManager2
  @instance = nil

  def self.instance
    @instance ||= new
  end

  private_class_method :new # Evita crear instancias con ConfigManager.new

  def initialize
    puts "Cargando configuración..."
    @settings = { theme: "light", language: "en" }
  end

  def get_setting(key)
    @settings[key]
  end
end

config1 = ConfigManager2.instance
config2 = ConfigManager2.instance

puts config1 == config2 # ✅ true (misma instancia)
puts config1.get_setting(:theme) # "light"

# config3 = ConfigManager2.new # ❌ Error: `private method 'new' called`
