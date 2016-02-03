class Politician
  attr_accessor :party, :name
  def initialize(name, party)
    @name = name
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

class Voter
  attr_accessor :politic, :name
  def initialize(name, politic)
    @name = name
    @politic = politic_validator(politic)
  end

  def politic_validator(politic)
    case politic.downcase
      when "c"
        "Conservative"
      when "l"
        "Liberal"
      when "t"
        "Tea Party"
      when "s"
        "Socialist"
      when "n"
        "Neutral"
      else
        puts "Please enter a valid politic:"
        input = gets.chomp.downcase
        politic_validator(input)
    end
  end
end


class World
  attr_accessor :politicians, :voters
  def initialize
    @politicians = []
    @voters = []
  end

  def main_menu
    puts "What would you like to do?
(C)reate, (L)ist, (U)pdate, (D)elete, or (E)xit"
    @action = gets.downcase.chomp
    if @action == "c"
      create
    elsif @action == "l"
      list_detail
    elsif @action == "u"
      update
    elsif @action == "d"
      delete
    elsif @action == "e"
      exit
    else
      main_menu
    end
    main_menu
  end

  def confirm?
    puts "Confirm with: (Y)es or (N)o"
    confirm = gets.downcase.chomp
    if confirm == "y"
      return true
    elsif confirm == "n"
      return false
    else
      confirm?
    end
  end

  def create
    puts "Would you like to create a
(P)olitician or (V)oter?"
    @create_input = gets.downcase.chomp
    if @create_input == "p"
      create_politician
    elsif @create_input == "v"
      create_voter
    else
      create
    end
    main_menu
  end

  def create_politician
    puts "Insert name: "
    name = gets.chomp
    puts "Insert new Party: (D)emocrat or (R)epublican?"
    party = gets.downcase.chomp
    @politicians << Politician.new(name, party)
    list_detail
  end

  def create_voter
    puts "Insert name:"
    name = gets.chomp
    puts "Insert new Politics: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    politic = gets.downcase.chomp
    @voters << Voter.new(name, politic)
    list_detail
  end

  def list_detail
    if @politicians.empty? && @voters.empty?
      puts "List is empty"
    else
      @politicians.each do |politician|
        p "#{politician.class}, #{politician.name}, #{politician.party}"
      end
      @voters.each do |voter|
        p "#{voter.class}, #{voter.name}, #{voter.politic}"
      end
    end
  end

  def list_politicians
    if @politicians.empty?
      puts "Politician's list is now empty"
    else
      @politicians.each do |politician|
        p "#{politician.class}, #{politician.name}, #{politician.party}"
      end
    end
  end

    def list_voters
      if @voters.empty?
        puts "Voter's list is now empty"
      else
        @voters.each do |voter|
          p "#{voter.class}, #{voter.name}, #{voter.politic}"
        end
      end
    end

  def update
    puts "Would you like to update a (P)olitician or (V)oter?"
    input = gets.chomp.downcase
    if input == "p"
      if @politicians.empty?
        puts "Politician's list is empty"
        main_menu
      else
        update_politician_name_or_party
      end
    elsif input == "v"
      if @voters.empty?
        puts "Voter's list is empty"
        main_menu
      else
        update_voter_name_or_politic
      end
    else
      update
    end
    main_menu
  end

  def update_politician_name_or_party
    puts "Would you like to update the (N)ame or (P)arty?"
    input2 = gets.chomp.downcase
    if input2 == "n"
      update_politician_name
    elsif input2 == "p"
      update_politician_party
    else
      update_politician_name_or_party
    end
  end

  def update_politician_name
    list_politicians
    puts "Who would you like to update?"
    name = gets.chomp

    @politicians.each do |politician|
      if !politician.name.include?(name)
        puts "That politician does not exist!"
        main_menu
      end
    end

    puts "Insert new name:"
    new_name = gets.chomp
    @politicians.each do |politician|
      if name == politician.name
        politician.name = new_name
      end
    end
    list_politicians
  end

  def update_politician_party
    list_politicians
    puts "Who would you like to update?"
    name = gets.chomp

    @politicians.each do |politician|
      if !politician.name.include?(name)
        puts "That politician does not exist!"
        main_menu
      end
    end

    puts "Insert new party: (R)epublican or (D)emocrat?"
    new_party = gets.chomp
    @politicians.each do |politician|
      if name == politician.name
        politician.party = politician.party_validator(new_party)
      end
    end
    list_politicians
  end

  def update_voter_name_or_politic
    puts "Would you like to update the (N)ame or (P)olitic?"
    input3 = gets.chomp.downcase
    if input3 == "n"
      update_voter_name
    elsif input3 == "p"
      update_voter_politic
    else
      update_voter_name_or_politic
    end
  end

  def update_voter_name
    list_voters
    puts "Who would you like to update?"
    name = gets.chomp

    @voters.each do |voter|
      if !voter.name.include?(name)
        puts "That voter does not exist!"
        main_menu
      end
    end

    puts "Insert new name:"
    new_name = gets.chomp
    @voters.each do |voter|
      if name == voter.name
        voter.name = new_name
      end
    end
    list_voters
  end

  def update_voter_politic
    list_voters
    puts "Who would you like to update?"
    name = gets.chomp

    @voters.each do |voter|
      if !voter.name.include?(name)
        puts "That voter does not exist!"
        main_menu
      end
    end

    puts "Insert new Politics: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral?"
    new_politic = gets.chomp
    @voters.each do |voter|
      if name == voter.name
        voter.politic = voter.politic_validator(new_politic)
      end
    end
    list_voters
  end

  def delete
    puts "Would you like to delete a (P)olitician or (V)oter?"
    input = gets.chomp.downcase
    if input == "p"
      delete_politician
    elsif input == "v"
      delete_voter
    else
      delete
    end
    main_menu
  end

  def delete_politician
    if @politicians.empty?
      puts "Politician's list is empty"
      main_menu
    else
      puts "Politicians:"
      list_politicians

      puts "Who would you like to delete?"
      name = gets.chomp #check if name exists first

      @politicians.each do |politician|
        if !politician.name.include?(name)
          puts "That politician does not exist!"
          main_menu
        end
      end

      if confirm?
        @politicians.each do |politician|
          if politician.name == name
            @politicians.delete(politician)
          end
        end
      else
        main_menu
      end

    end

    list_politicians
  end

  def delete_voter
    if @voters.empty?
      puts "Voter's list is empty"
      main_menu
    else
      puts "Voters:"
      list_voters

      puts "Who would you like to delete?"
      name = gets.chomp

      @voters.each do |voter|
        if !voter.name.include?(name)
          puts "That voter does not exist!"
          main_menu
        end
      end

      if confirm?
        @voters.each do |voter|
          if voter.name == name
            @voters.delete(voter)
          end
        end
      else
        main_menu
      end
    end
    list_voters
  end

end

world = World.new
world.main_menu
