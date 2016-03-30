class Base

  def handle(account)
    before_handle(account)
    actual_handle(account)
    after_handle(account)

    return account
  end

end