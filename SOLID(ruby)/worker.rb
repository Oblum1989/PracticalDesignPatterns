# frozen_string_literal: true

module Worker
  def work
    raise NotImplementedError, "Debe implementarse en una subclase"
  end

  def eat
    raise NotImplementedError, "Debe implementarse en una subclase"
  end
end

class OfficeWorker
  include Worker

  def work
    puts "Trabajando en la oficina..."
  end

  def eat
    puts "Tomando el almuerzo en la cafetería."
  end
end

class RobotWorker
  include Worker

  def work
    puts "El robot está ensamblando productos..."
  end

  def eat
    raise "ERROR: ¡Los robots no comen!"
  end
end

def process_worker(worker)
  worker.work
  worker.eat unless worker.is_a?(RobotWorker)
end

human = OfficeWorker.new
robot = RobotWorker.new

process_worker(human)
process_worker(robot)