# This file makes an offline game of hangman possible by creating the methods necessary for the game.

# Man Drawer Method
def draw_man(parts)
  if parts == 0
    puts "____________"
    puts "|      |    "
    puts "|           "
    puts "|           "
    puts "|           "
    puts "|           "
    puts "|           "
    puts "----------- "
  end
  if parts == 1
    puts "____________"
    puts "|      |    "
    puts "|      @    "
    puts "|           "
    puts "|           "
    puts "|           "
    puts "|           "
    puts "----------- "
  end
  if parts == 2
    puts "____________"
    puts "|      |    "
    puts "|      @    "
    puts "|      |    "
    puts "|           "
    puts "|           "
    puts "|           "
    puts "----------- "
  end
  if parts == 3
    puts "____________"
    puts "|      |    "
    puts "|      @    "
    puts "|     /|    "
    puts "|           "
    puts "|           "
    puts "|           "
    puts "----------- "
  end
  if parts == 4
    puts "____________"
    puts "|      |    "
    puts "|      @    "
    puts "|     /|\\  "
    puts "|           "
    puts "|           "
    puts "|           "
    puts "----------- "
  end
  if parts == 5
    puts "____________"
    puts "|      |    "
    puts "|      @    "
    puts "|     /|\\  "
    puts "|      |    "
    puts "|           "
    puts "|           "
    puts "----------- "
  end
  if parts == 6
    puts "____________"
    puts "|      |    "
    puts "|      @    "
    puts "|     /|\\  "
    puts "|      |    "
    puts "|     /     "
    puts "|           "
    puts "----------- "
  end
  if parts == 7
    puts "____________"
    puts "|      |    "
    puts "|      @    "
    puts "|     /|\\  "
    puts "|      |    "
    puts "|     / \\  "
    puts "|           "
    puts "----------- "
  end
  if parts != 0 and parts != 1 and parts != 2 and parts != 3 and parts != 4 and parts != 5 and parts != 6 and parts != 7
  end
end

# Letter Checker Method
def check_letter(word,letter)
  characters = word.split('').to_a
  present = characters.include?(letter)
  if present
    n = 0
    locations = []
    characters.each do |character|
      n = n + 1
      locations.push(n) if character == letter
    end
    return locations
  end
  false unless present
end

# Result Displayer Method
def display_result(word,letters_played)
  characters = word.split('').to_a
  word_length = characters.count
  letter_array = Array.new(word_length,'_ ')
  letters_played.each do |letter|
    locations = check_letter(word,letter)
    locations.each do |location|
      letter_array[location-1] = letter
    end if locations
  end
  puts "\n"
  print letter_array
  true
end