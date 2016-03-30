require 'json'
require 'yaml'

class Object

=begin
An utility function that is used to encode data for inter-system network transfer.
The data format used is defined in the config file.
The purpose of it is to provide a centralized place of encoding in case a different format is deemed better
=end
  def encode
    case YAML.load_file('config/config.yaml')['encoding']
      when 'json'
        return JSON.generate self
      else
        throw :'unsupported encoding format'
    end

    return JSON.generate self
  end

=begin
An utility function that is used to decode data for inter-system network transfer.
The data format used is defined in the config file.
The purpose of it is to provide a centralized place of decoding in case a different format is deemed better
=end
  def decode
    case YAML.load_file('config/config.yaml')['encoding']
      when 'json'
        return JSON.parse self
      else
        throw :'unsupported decoding format'
    end
  end

end