class Income < Base

  def initialize(argv)
  end

  def before_handle(account)
  end

  def actual_handle(account)
    account.entries.delete_if { |e| e.amount < 0 }
    return nil
  end

  def after_handle(account)
  end

end