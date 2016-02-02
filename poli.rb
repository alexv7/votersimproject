class Politician
  attr_accessor :name, :party
  def initialize name, party
    @name = name
    @party = party
  end
end

politicians = []

politicians << Politician.new("Donald", "Republican")
politicians << Politician.new("Hilary", "Democrat")

p politicians

politicians.each do |politician|
  if politician.name == "Donald"
    politician.name = "Donald Trump"
  end
end

p politicians