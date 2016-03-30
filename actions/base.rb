require 'require_all'
require 'yaml'
require 'csv'
require 'json'
require_all 'models/'
require_all 'pipe/'
require_relative '../models/account'
require_relative '../models/entry'

class Base

  def initialize
    @config = YAML.load_file('config/config.yaml')
  end

  def create_account
    # Load csv data
    data_file    = @config['data_file']
    input_string = File.read(data_file)
    array = CSV.parse(input_string, :col_sep => ';')

    # Instantiate account and fill it with header and entries
    account = Account.new
    account.header = array.shift
    array.each do |row|
      account.add_entry(Entry.new(row[0], row[1], row[2], row[3], row[4]))
    end

    return account
  end

  def process_account(account, arguments)

    # Instantiate a pipeline to add tasks to it
    pipeline = Pipeline.new
    commands = YAML.load_file('config/config.yaml')['commands']

    # For each user command, e.g -from, create a Step instance
    arguments.each do |command, argv|
        # Check if command is allowed
        if !commands.include? command
          throw "Command #{command} not allowed"
        end

        # Create a Step instance
        class_name = command.capitalize
        step       = Object.const_get(class_name).new(argv)
        pipeline.add_step(step)
    end

    # Execute the pipeline
    return pipeline.execute(account)
  end
end