module Formatter
  class Http
    def format (output)

      return JSON.pretty_generate(output)
    end
  end
end
