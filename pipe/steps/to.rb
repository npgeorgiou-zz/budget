require 'time'

class To < Base

  def initialize(argv)
    @to = Time.parse(argv[0])
  end

  def before_handle(account)
  end

  def actual_handle(account)
    account.entries.delete_if { |e| e.dateCreated > @to }
    return nil
  end

  def after_handle(account)
    return nil
  end

end