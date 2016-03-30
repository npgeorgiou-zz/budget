require_relative '../util/numeric'

class Entry
  attr_accessor :dateCreated, :description, :dateInserted, :amount, :balance

  def initialize(dateCreated, description, dateInserted, amount, balance)
    @dateCreated  = Time.parse(dateCreated)
    @description  = description
    @dateInserted = Time.parse(dateInserted)
    @amount       = amount.gsub('.', '').gsub(',', '.').to_f
    @balance      = balance.gsub('.', '').gsub(',', '.').to_f
  end

  def to_hash
    hash = {
        'Created'     => @dateCreated.strftime("%d %b %y"),
        'Description' => @description,
        'Inserted'    => @dateInserted.strftime("%d %b %y"),
        'Amount'      => @amount,
        'Balance'     => @balance
    }
    return hash
  end

end