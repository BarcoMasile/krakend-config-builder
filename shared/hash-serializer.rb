
class HashSerializer
  def initialize
    @params = []
  end

  def to_hash
    @params.inject({}) do |dict, var|
      dict[var] = self.send(var)
      dict
    end
  end
end
