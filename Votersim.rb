# I structured the arrays in a way that each person and their info is linked to the same index in all the different arrays.
# Say for example our list contains only 2 people:
# @v_or_p = ["Politician", "Politician"]
# @names = ["Donald", "Hillary"]
# @party_or_politics = ["Republican", "Democrat"]
# @detail = [["Politician", "Donald", "Republican"], ["Politician", "Hillary", "Democrat"]]
# So if i need to update or delete "Hillary", i would need to make the action for index 1 in all the arrays.
# Structuring it this way makes things much more simpler and easier...and ofcourse unbreakable :)
class Politician
  attr_accessor :party_politic, :name

  def initialize(name, party_politic)
    @name = name
    @party_politic = party_validator(party_politic)
  end

  # def party_politic= party_politic
  #   @party_politic = party_validator(party_politic)
  # end

  def party_validator(party_politic)
    case party_politic.downcase
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
  attr_accessor :party_politic, :name

  def initialize(name, party_politic)
    @name = name
    @party_politic = politic_validator(party_politic)
  end

  # def party_politic= party_politic
  #   @party_politic = politic_validator(party_politic)
  # end

  def politic_validator(party_politic)
    case party_politic.downcase
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
  attr_accessor :names, :v_or_p, :party_or_politics, :detail, :politicians, :voters
  def initialize
    @v_or_p = [] #this array will contain Voter or Politician only
    @names = []   #this array will contain the names only
    @party_or_politics = [] #this array will contain the party/politics only
    @politicians = []
    @voters = []
    @detail = [] #this array will contain all the info
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
  #I found it much easier to create a method for creating a politician/voter, instead of a class
  # def create_politician
  #   puts "Insert new Party: (D)emocrat or (R)epublican?"
  #   party = gets.downcase.chomp
  #   if party == "d"
  #     party = "Democrat"
  #   elsif party == "r"
  #     party = "Republican"
  #   else
  #     create_politician
  #   end
  #   puts "Insert name:"
  #   name = gets.chomp
  #   @v_or_p << "Politician"
  #   @names << name
  #   @party_or_politics << party
  #   # Array.new("Politician", name, party)
  #   @detail << ["Politician", name, party] # Polician.new(name, party)
  #   # @detail.map(&:name) => ["Donald"]
  #   list_detail
  # end

  def create_politician
    puts "Insert name: "
    name = gets.chomp
    puts "Insert new Party: (D)emocrat or (R)epublican?"
    party_politic = gets.downcase.chomp
    @politicians << Politician.new(name, party_politic)
    list_detail
  end

  def create_voter
    puts "Insert name:"
    name = gets.chomp
    puts "Insert new Politics: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    party_politic = gets.downcase.chomp
    @voters << Voter.new(name, party_politic)
    list_detail
  end

  def list_detail
    if @politicians.empty? && @voters.empty?
      puts "List is empty"
    else
      @politicians.each do |politician|
        p "#{politician.class}, #{politician.name}, #{politician.party_politic}" #this is only to puts each Politician/Voter on a new line
      end
      @voters.each do |voter|
        p "#{voter.class}, #{voter.name}, #{voter.party_politic}" #this is only to puts each Politician/Voter on a new line
      end
    end
  end

  def list_politicians
    if @politicians.empty?
      puts "Politician's list is now empty"
    else
      @politicians.each do |politician|
        p "#{politician.class}, #{politician.name}, #{politician.party_politic}" #this is only to puts each Politician/Voter on a new line
      end
    end
  end



    def list_voters
      if @voters.empty?
        puts "Voter's list is now empty"
      else
        @voters.each do |voter|
          p "#{voter.class}, #{voter.name}, #{voter.party_politic}" #this is only to puts each Politician/Voter on a new line
        end
      end
    end







  # def updating_name #this is a method to update name in @names array
  #   puts "Insert new name"
  #   @new_name = gets.chomp
  #   update_name_in_detail
  #   @names.map! {|x| x == @update_name ? @new_name : x}
  #   list_detail
  #   main_menu
  # end
  #
  # def update_name_in_detail #this is a method to update name in @detail array
  #   i = 0
  #   while i < @names.length
  #     if @detail[i].include?(@update_name)
  #       @detail[i][1] = @new_name
  #     end
  #     i += 1
  #   end
  # end
  #
  # def update_party_politics_in_detail # method to update party/politics in @detail array
  #   i = 0
  #   while i < @names.length
  #     if @detail[i].include?(@update_name)
  #       @detail[i][2] = @new_party_politics
  #     end
  #     i += 1
  #   end
  # end
  #
  # def updating_politician_party #method that updates party in @party_or_politics array
  #   puts "Insert new Party: (D)emocrat or (R)epublican"
  #   @new_party_politics = gets.chomp.downcase
  #   if @new_party_politics == "d"
  #     @new_party_politics = "Democrat"
  #     @party_or_politics[@names.index(@update_name)] = @new_party_politics
  #     update_party_politics_in_detail
  #   elsif @new_party_politics == "r"
  #     @new_party_politics = "Republican"
  #     @party_or_politics[@names.index(@update_name)] = @new_party_politics
  #     update_party_politics_in_detail
  #   else
  #     updating_politician_party
  #   end
  #   list_detail
  #   main_menu
  # end
  #
  # def updating_voter_politics #method that updates politics in @party_or_politics array
  #   puts "Insert new Politics: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
  #   @new_party_politics = gets.chomp.downcase
  #   if @new_party_politics == "l"
  #     @new_party_politics = "Liberal"
  #     @party_or_politics[@names.index(@update_name)] = @new_party_politics
  #     update_party_politics_in_detail
  #   elsif @new_party_politics == "c"
  #     @new_party_politics = "Conservative"
  #     @party_or_politics[@names.index(@update_name)] = @new_party_politics
  #     update_party_politics_in_detail
  #   elsif @new_party_politics == "t"
  #     @new_party_politics = "Tea Party"
  #     @party_or_politics[@names.index(@update_name)] = @new_party_politics
  #     update_party_politics_in_detail
  #   elsif @new_party_politics == "s"
  #     @new_party_politics = "Socialist"
  #     @party_or_politics[@names.index(@update_name)] = @new_party_politics
  #     update_party_politics_in_detail
  #   elsif @new_party_politics == "n"
  #     @new_party_politics = "Neutral"
  #     @party_or_politics[@names.index(@update_name)] = @new_party_politics
  #     update_party_politics_in_detail
  #   else
  #     updating_voter_politics
  #   end
  #   list_detail
  #   main_menu
  # end
  #
  # def update
  #   if @detail.empty?
  #     puts "List is empty"
  #     main_menu
  #   end
  #   puts "Who would you like to update?\n#{@names}"
  #   @update_name = gets.chomp
  #   if @names.include?(@update_name)
  #     puts "Would you like to change the name?"
  #     if confirm?
  #       updating_name
  #     elsif @v_or_p[@names.index(@update_name)] == "Politician"
  #       puts "Would you like to change the party?"
  #       if confirm?
  #         updating_politician_party
  #       end
  #     else #@voters.include?(update_name)
  #       puts "Would you like to change the politics?"
  #       if confirm?
  #         updating_voter_politics
  #       end
  #     end
  #   else
  #     puts "Invalid entry"
  #     update
  #   end
  #   main_menu
  # end
  #





  # def delete
  #   if @detail.empty?
  #     puts "List is empty"
  #     main_menu
  #   end
  #   puts "Who would you like to delete?\n#{@names}"
  #   delete_name = gets.chomp
  #   if @names.include?(delete_name)
  #     @index = @names.index(delete_name)
  #     if confirm?
  #       @names.delete_at(@index)
  #       @v_or_p.delete_at(@index)
  #       @party_or_politics.delete_at(@index)
  #       @detail.delete_at(@index)
  #       list_detail
  #       main_menu
  #     else
  #       main_menu
  #     end
  #   else
  #     puts "Invalid entry!"
  #     main_menu
  #   end
  #   main_menu
  # end

  def update_politician_name
    list_politicians
    puts "Who would you like to update?"
    name = gets.chomp
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
    puts "Insert new party: (R)epublican or (D)emocrat?"
    new_party = gets.chomp
    @politicians.each do |politician|
      if name == politician.name
        politician.party_politic = politician.party_validator(new_party)
      end
    end
    list_politicians
  end

  # def party_validator(party_politic)
  #   case party_politic.downcase
  #     when "d"
  #       "Democrat"
  #     when "r"
  #       "Republican"
  #     else
  #       puts "Please enter a valid party:"
  #       input = gets.chomp.downcase
  #       party_validator(input)
  #   end
  # end

  def update
    puts "Would you like to update a (P)olitician or (V)oter?"
    input = gets.chomp.downcase
    if input == "p"
      puts "Would you like to update the (N)ame or (P)arty?"
      input2 = gets.chomp.downcase
      if input2 == "n"
        update_politician_name
      elsif input2 == "p"
        update_politician_party
      else
        update
      end
    elsif input == "v"
      puts "Would you like to update the (N)ame or (P)olitic?"
      input3 = gets.chomp.downcase
      if input3 == "n"
        update_voter_name
      elsif input3 == "p"
        update_voter_politic
      else
        update
      end
    else
      update
    end
    main_menu
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

  def delete_politician #ask first who would like to delete first p or v
    if @politicians.empty?
      puts "Politician's list is empty"
      main_menu
    else
      puts "Politicians:"
      list_politicians

      puts "Who would you like to delete?"
      name = gets.chomp
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

  def delete_voter #ask first who would like to delete first p or v
    if @voters.empty?
      puts "Voter's list is empty"
      main_menu
    else
      puts "Voters:"
      list_voters

      puts "Who would you like to delete?"
      name = gets.chomp
      @voters.each do |voter|
        if voter.name == name
          @voters.delete(voter)
        end
      end
    end
    list_voters
  end


end

world = World.new
world.main_menu









