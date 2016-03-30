require 'terminal-table'
require_relative '../util/numeric'
require_relative '../util/string'

module Formatter
  class Table

    def format (output)
      if output.size == 0
        return 'no results'
      end

      # TODO: read abt ruby blocks
      table = Terminal::Table.new do |t|
        headers = output[0].keys
        t.add_row headers
        t.add_separator

        # Add entries
        output.each do |hash|
          row = [];
          hash.each do |key, value|
            if value.is_a? Float then
              value_string      = value.format_float_to_string_of_my_liking
              value > 0 ? value = value_string.green : value = value_string.red
            end

            if value.is_a? String then
              value = value.squeeze(' ')
            end

            row << value
          end
          t.add_row(row)
        end
      end

      return table
    end
  end
end
