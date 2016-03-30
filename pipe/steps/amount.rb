class Amount < Base

  def initialize(argv)
    string = argv[0]
    # Example user input: <=50 , 50, >50
    possible_symbols = '>= <= = > <'.split(' ')
    possible_symbols.each do |s|
      if string.include?(s)
        @sign   = string[0...s.length]
        @amount = string[s.length...string.length].to_f
        return
      end
    end

    # If no symbol found, assign =
    @sign = '='
    @amount = string.to_f
  end

  def before_handle(account)
  end

  def actual_handle(account)

    case @sign
      when '>'
        account.entries.delete_if { |e| !(e.amount.abs > @amount) }
      when '<'
        account.entries.delete_if { |e| !(e.amount.abs < @amount) }
      when '>='
        account.entries.delete_if { |e| !(e.amount.abs >= @amount) }
      when '<='
        account.entries.delete_if { |e| !(e.amount.abs <= @amount) }
      when '='
        account.entries.delete_if { |e| !(e.amount.abs == @amount) }
      else
        puts 'wrong operand'
        exit
    end

    return nil
  end

  def after_handle(account)
  end

end