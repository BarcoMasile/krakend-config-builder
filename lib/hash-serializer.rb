
class HashSerializer
  def initialize
    @params = []
  end

  def to_hash
    @params.inject({}) do |dict, var|
      value = self.send(var)
      dict[var] = value unless value.nil?
      dict
    end
  end
end
