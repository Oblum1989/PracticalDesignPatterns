# frozen_string_literal: true

class NotificationService
  def send_message(message)
    raise NotImplementedError, "Debe implementarse en una subclase"
  end
end

class EmailService < NotificationService
  def send_message(message)
    puts "Enviando email: #{message}"
  end
end

class SMSService < NotificationService
  def send_message(message)
    puts "Enviando SMS: #{message}"
  end
end

class Notification
  def initialize(service)
    @service = service
  end

  def send_notification(message)
    @service.send_message(message)
  end
end

email_notifier = Notification.new(EmailService.new)
sms_notifier = Notification.new(SMSService.new)

email_notifier.send_notification("Hola, tienes una nueva alerta por Email.")
sms_notifier.send_notification("Hola, tienes una nueva alerta por SMS.")