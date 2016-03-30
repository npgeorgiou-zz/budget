# Holds an array or has of Steps, that it executes sequentially
class Pipeline

  def initialize
    @steps = []
  end

  def add_step(s)
    @steps << s
  end

  # Execute the pipeline tasks
  def execute(account)
    @steps.each do |step|
      step.handle(account)
    end

    return account
  end
end