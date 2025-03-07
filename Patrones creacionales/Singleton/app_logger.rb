# frozen_string_literal: true

require 'singleton'

# Singleton Logger - Asegura que solo hay una instancia para registrar logs
class AppLogger
  include Singleton

  LOG_FILE = './Singleton/app.log'

  def initialize
    @file = File.open(LOG_FILE, 'a')
  end

  def log(message)
    timestamped_message = "[#{Time.now.strftime('%Y-%m-%d %H:%M:%S')}] #{message}"
    @file.puts(timestamped_message)
    @file.flush
    puts timestamped_message
  end
end