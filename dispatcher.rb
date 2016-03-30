require 'require_all'
require_all 'actions/'
require_relative 'util/string'

class Dispatcher

  def dispatch(user_input)
    action_string   = user_input['action'].capitalize
    arguments       = user_input['arguments']

    # Get Action from user input
    action_instance  = Object.const_get(action_string).new

    # Run Action with user arguments
    return action_instance.run(arguments)
  end

end