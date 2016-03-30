require_relative '../../formatters/table'
require_relative '../../parser'
require_relative '../../util/object'
require_relative '../../util/string'
require 'unirest'
require 'yaml'
require 'json'

class Run

  # Initialize with default formatter
  def initialize (formatter = Formatter::Table.new)
    @host      = YAML.load_file('config/config.yaml')['host']
    @port      = YAML.load_file('config/config.yaml')['port']
    @formatter = formatter

    # Run help action
    response = Unirest.post "#{@host}:#{@port}/api",
                            headers: { 'Accept' => 'application/json' },
                            parameters: 'help'.parse_console_command.encode

    output = response.body
    write(output)

    # Start listening for input
    read
  end

  def read
    while true do
      # Get console input
      input  = gets.chomp

      # Expand arguments
      input = input.gsub('-fr', '-from')
          .gsub('-hs', '-has')
          .gsub('-in', '-income')
          .gsub('-ex', '-expense')
          .gsub('-am', '-amount')

      # Parse it
      input = input.parse_console_command

      response = Unirest.post "#{@host}:#{@port}/api",
                              headers:{ 'Accept' => 'application/json' },
                              parameters:input.encode

      output = response.body
      write(output)
    end
  end

  def write(output)
    if output.class == String then
      puts output
    else
      puts @formatter.format(output)
    end

  end
end
