require 'json'

module GraderUtils
  def self.parse_number(input)
    input = input.to_s.strip

    return nil unless input =~ /\A\-?\d*(?:\.\d*)?\z/

    input.to_f
  end

  def self.parse_string(input)
    input = input.to_s.strip

    if input[0] == "'" && input[-1] == "'"
      input[0] = input[-1] = '"'
      JSON.parse("[#{input}]")[0]
    elsif input[0] == '"' && input[-1] == '"'
      JSON.parse("[#{input}]")[0]
    else
      input
    end
  end
end
