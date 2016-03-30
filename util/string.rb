class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def red
    colorize(31)
  end

  def green
    colorize(32)
  end

  def yellow
    colorize(33)
  end

  def blue
    colorize(34)
  end

  def pink
    colorize(35)
  end

  def light_blue
    colorize(36)
  end

  def replace (placeholder, value)
    return self.gsub('#{' + placeholder + '}', value.to_s)
  end

  def is_number?
    true if Float(self) rescue false
  end

  def is_date?
    true if Date.parse(self) rescue false
  end

  def to_numeric
    return self.to_i if self == self.to_i.to_s
    return self.to_f if self == self.to_f.to_s
  end

  def parse_console_command
    command_parts = self.split(' ')

    hash = Hash.new
    hash['action']    = command_parts[0]
    hash['arguments'] = Hash.new

    # Everything that starts with - is an argument
    command_parts.each do |e|
      if e.start_with?('-')
        # Everything that follows until another - is met, goes as parameters
        flags = []
        i = command_parts.find_index(e)
        until command_parts[i+1].to_s.start_with?("-") || i+1 == command_parts.length do
          flags << command_parts[i+1]
          i += 1
        end

        # Remove dash
        e.slice!(0)

        if (flags.length) === 0
          hash['arguments'][e] = nil
        else
          hash['arguments'][e] = flags
        end
      end
    end

    return hash
  end

end