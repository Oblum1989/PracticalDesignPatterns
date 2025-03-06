# frozen_string_literal: true

module Workable
  def work
    raise NotImplementedError, "Debe implementarse en una subclase"
  end
end

module Eatable
  def eat
    raise NotImplementedError, "Debe implementarse en una subclase"
  end
end

class OfficeWorker
  include Workable
  include Eatable

  def work
    puts "Trabajando en la oficina..."
  end

  def eat
    puts "Tomando el almuerzo en la cafetería."
  end
end

class RobotWorker
  include Workable

  def work
    puts "El robot está ensamblando productos..."
  end
end

def process_worker(worker)
  worker.work
  worker.eat if worker.is_a?(Eatable)
end

human = OfficeWorker.new
robot = RobotWorker.new

process_worker(human)
process_worker(robot)