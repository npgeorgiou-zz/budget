class Sum < Base

  def run(arguments)
    # Load data
    account = create_account

    # Process account according to user commands
    process_account(account, arguments)

    # Calculate sum
    sum = 0
    account.entries.each do |entry|
      sum += entry.amount
    end

    hash = {'Sum' => sum}
    return [hash]
  end
end