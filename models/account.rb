require 'json'

class Account
  attr_accessor :header
  attr_reader :entries

  def initialize
    @header = []
    @entries = []
  end

  def add_entry(e)
    entries << e
  end

end