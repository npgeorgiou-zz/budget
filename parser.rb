class Parser

  # Parses a string and returns a hash of options and parameters
  def parse(str)
    command_parts = str.split(' ')

    user_input = Hash.new
    user_input['action'] = command_parts[0]
    user_input['arguments'] = Hash.new

    # Everything that starts with - is a command
    command_parts.each do |e|
      if e.start_with?("-")
        # Everything that follows until another - is met, goes as parameters
        a = []
        i = command_parts.find_index(e)

        until command_parts[i+1].to_s.start_with?("-") || i+1 == command_parts.length do
          a << command_parts[i+1]
          i += 1
        end

        if (a.length) === 0
          user_input['arguments'][e] = nil
        end
        if (a.length) === 1
          user_input['arguments'][e] = a[0]
        end
        if (a.length) > 1
          user_input['arguments'][e] = a
        end
      end
    end

    return user_input
  end

end