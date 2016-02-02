require_relative "Votersim"
class Politician < World
  attr_accessor :party, :p_name
  def initialize(p_name, party)
    @names << @p_name
    @v_or_p << "Politician"
    @party_or_politics << @party
    list_detail
  end

  def listing
  end

end


class Politician < World
  attr_accessor :party, :p_name, :names
  def initialize
    @names
    create_politician
  end

  def create_politician
    puts "Insert new Party: (D)emocrat or (R)epublican?"
    party = gets.downcase.chomp[0]
    if party == "d"
      party = "Democrat"
    elsif party == "r"
      party = "Republican"
    else
      create_politician
    end
    puts "Insert name:"
    name = gets.chomp
    @names << name
    @v_or_p << "Politician"
    @party_or_politics << party
  end
end