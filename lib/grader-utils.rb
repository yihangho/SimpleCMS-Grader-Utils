module GraderUtils
  def self.parse_number(input)
    input = input.to_s.strip

    return nil unless input =~ /\A\-?\d*(?:\.\d*)?\z/

    input.to_f
  end
end
