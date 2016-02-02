# I structured the arrays in a way that each person and their info is linked to the same index in all the different arrays.
# Say for example our list contains only 2 people:
# @v_or_p = ["Politician", "Politician"]
# @names = ["Donald", "Hillary"]
# @party_or_politics = ["Republican", "Democrat"]
# @detail = [["Politician", "Donald", "Republican"], ["Politician", "Hillary", "Democrat"]]
# So if i need to update or delete "Hillary", i would need to make the action for index 1 in all the arrays.
# Structuring it this way makes things much more simpler and easier...and ofcourse unbreakable :)

class World
  attr_accessor :names, :v_or_p, :party_or_politics, :detail
  def initialize
    @v_or_p = [] #this array will contain Voter or Politician only
    @names = []   #this array will contain the names only
    @party_or_politics = [] #this array will contain the party/politics only
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
  def create_politician
    puts "Insert new Party: (D)emocrat or (R)epublican?"
    party = gets.downcase.chomp
    if party == "d"
      party = "Democrat"
    elsif party == "r"
      party = "Republican"
    else
      create_politician
    end
    puts "Insert name:"
    name = gets.chomp
    @v_or_p << "Politician"
    @names << name
    @party_or_politics << party
    # Array.new("Politician", name, party)
    @detail << ["Politician", name, party] # Polician.new(name, party)
    # @detail.map(&:name) => ["Donald"]
    list_detail
  end

  def create_voter
    puts "Insert new Politics: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    politics = gets.downcase.chomp
    if politics == "l"
      politics = "Liberal"
    elsif politics == "c"
      politics = "Conservative"
    elsif politics == "t"
      politics = "Tea Party"
    elsif politics == "s"
      politics = "Socialist"
    elsif politics == "n"
      politics = "Neutral"
    else
      create_voter
    end
    puts "Insert name:"
    name = gets.chomp
    @v_or_p << "Voter"
    @names << name
    @party_or_politics << politics
    @detail << ["Voter", name, politics]
    list_detail
  end

  def list_detail
    if @detail.empty?
      puts "List is empty"
    else
      @detail.each {|x| p x} #this is only to puts each Politician/Voter on a new line
    end
  end

  def updating_name #this is a method to update name in @names array
    puts "Insert new name"
    @new_name = gets.chomp
    update_name_in_detail
    @names.map! {|x| x == @update_name ? @new_name : x}
    list_detail
    main_menu
  end

  def update_name_in_detail #this is a method to update name in @detail array
    i = 0
    while i < @names.length
      if @detail[i].include?(@update_name)
        @detail[i][1] = @new_name
      end
      i += 1
    end
  end

  def update_party_politics_in_detail # method to update party/politics in @detail array
    i = 0
    while i < @names.length
      if @detail[i].include?(@update_name)
        @detail[i][2] = @new_party_politics
      end
      i += 1
    end
  end

  def updating_politician_party #method that updates party in @party_or_politics array
    puts "Insert new Party: (D)emocrat or (R)epublican"
    @new_party_politics = gets.chomp.downcase
    if @new_party_politics == "d"
      @new_party_politics = "Democrat"
      @party_or_politics[@names.index(@update_name)] = @new_party_politics
      update_party_politics_in_detail
    elsif @new_party_politics == "r"
      @new_party_politics = "Republican"
      @party_or_politics[@names.index(@update_name)] = @new_party_politics
      update_party_politics_in_detail
    else
      updating_politician_party
    end
    list_detail
    main_menu
  end

  def updating_voter_politics #method that updates politics in @party_or_politics array
    puts "Insert new Politics: (L)iberal, (C)onservative, (T)ea Party, (S)ocialist, or (N)eutral"
    @new_party_politics = gets.chomp.downcase
    if @new_party_politics == "l"
      @new_party_politics = "Liberal"
      @party_or_politics[@names.index(@update_name)] = @new_party_politics
      update_party_politics_in_detail
    elsif @new_party_politics == "c"
      @new_party_politics = "Conservative"
      @party_or_politics[@names.index(@update_name)] = @new_party_politics
      update_party_politics_in_detail
    elsif @new_party_politics == "t"
      @new_party_politics = "Tea Party"
      @party_or_politics[@names.index(@update_name)] = @new_party_politics
      update_party_politics_in_detail
    elsif @new_party_politics == "s"
      @new_party_politics = "Socialist"
      @party_or_politics[@names.index(@update_name)] = @new_party_politics
      update_party_politics_in_detail
    elsif @new_party_politics == "n"
      @new_party_politics = "Neutral"
      @party_or_politics[@names.index(@update_name)] = @new_party_politics
      update_party_politics_in_detail
    else
      updating_voter_politics
    end
    list_detail
    main_menu
  end

  def update
    if @detail.empty?
      puts "List is empty"
      main_menu
    end
    puts "Who would you like to update?\n#{@names}"
    @update_name = gets.chomp
    if @names.include?(@update_name)
      puts "Would you like to change the name?"
      if confirm?
        updating_name
      elsif @v_or_p[@names.index(@update_name)] == "Politician"
        puts "Would you like to change the party?"
        if confirm?
          updating_politician_party
        end
      else #@voters.include?(update_name)
        puts "Would you like to change the politics?"
        if confirm?
          updating_voter_politics
        end
      end
    else
      puts "Invalid entry"
      update
    end
    main_menu
  end

  def delete
    if @detail.empty?
      puts "List is empty"
      main_menu
    end
    puts "Who would you like to delete?\n#{@names}"
    delete_name = gets.chomp
    if @names.include?(delete_name)
      @index = @names.index(delete_name)
      if confirm?
        @names.delete_at(@index)
        @v_or_p.delete_at(@index)
        @party_or_politics.delete_at(@index)
        @detail.delete_at(@index)
        list_detail
        main_menu
      else
        main_menu
      end
    else
      puts "Invalid entry!"
      main_menu
    end
    main_menu
  end

end

world = World.new
world.main_menu









