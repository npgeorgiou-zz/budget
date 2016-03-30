class List < Base

  def run(arguments)
    # Load data
    account = create_account

    # Process account according to user commands
    process_account(account, arguments)

    array = []
    account.entries.each do |e|
      array << e.to_hash
    end

    return array
  end

end