# class Voter < World
#   attr_accessor :politics
#   def initialize(name, politics)
#     super(name)
#     @politics = politics
#     @voters = []
#   end
# end
class Politician
  attr_accessor :party, :name

  def initialize(name, party)
    @name = name
    @party = party_validator(party)
  end

  def party= party
    @party = party_validator(party)
  end

  def party_validator(party)
    case party.downcase
      when "d"
        "Democrat"
      when "r"
        "Republican"
      else
        puts "Please enter a valid party:"
        input = gets.chomp.downcase
        party_validator(input)
    end
  end
end

class World
  def initialize
    @voters = []
    @politicians = []
  end

end

def create_politician
  puts "What is the politician's name?"
  name = hets.chomp
  puts "What is the politician's party"
  puts "(D)emocrat or (R)epublican"
  party = gets.downcase.chomp
  @politician << Politician.new(name, party)
  start
end

def update_politician
  puts "Politicians:"
  puts @politicians
  puts "who "
  name = gets.chomp
  @politicians.each do |politician|
    if name == politician.name
      puts "New name?" #yes or no
      new_name = gets.chomp
      puts "new party?"
      puts "D or R"#new-name? gets.chomp
      new_party = gets.downcase
      politician.name = new_name
      politician.party = new_party
    end
  end
end


  def delete_politician #ask first who would like to delete first p or v
    puts "Politicians:"
    puts @politicians

    puts "who"
    name = gets.chomp
    @politicians.each do |politician|
      if politician.name == name
        @politicians.delete(politician)
      end
    end
    start
  end


    end
  end

end