# frozen_string_literal: true

class EmailService
  def send_email(message)
    puts "Enviando email: #{message}"
  end
end

class Notification
  def initialize
    @email_service = EmailService.new
  end

  def send_notification(message)
    @email_service.send_email(message)
  end
end

notifier = Notification.new
notifier.send_notification("Hola, tienes una nueva alerta.")

