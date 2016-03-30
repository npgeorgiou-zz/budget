require 'time'

class From < Base

  def initialize(argv)
    # Create timestamp for from argument
    @from = Time.parse(argv[0])
  end

  def before_handle(account)
  end

  def actual_handle(account)
    account.entries.delete_if { |e| e.dateCreated < @from }
    return nil
  end

  def after_handle(account)
  end

end