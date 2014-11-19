# This is a program that makes a hangman game with all the words in the english dictionary.
# Loads the necessary file (methods) into the program
require './h_methods.rb'

# Loads the dictionary into the program
dictionary = File.new('EnglishDictionary.txt', 'r')
dictionary_lines = dictionary.read.split("\n")
dictionary.close

# Chooses the word and puts its characters into an array
dictionary_lines.shuffle!
word_number = rand(109583)
word = dictionary_lines[word_number]

# Opening Screen
system 'clear'
puts "Welcome to Adam's Hangman Game! This program was made to allow you to play an offline game of hangman!"
puts 'I apologize for loading times between letter guesses.'
sleep 3
parts = 0
letter_guessed = []
game = true
letters_possible = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

# starts the game
while game
  sleep 2
  system 'clear'
  played = false
  draw_man(parts)
  if parts == 7
    puts "\nThe word you were trying to guess was actually #{word}.\n"
    puts 'Please play again! The word will be different. '
    sleep 3
    system 'clear'
    break
  end
  puts "\n"
  display_result(word,letter_guessed)
  puts "\n\nLetters Guessed: #{letter_guessed.to_s}"
  puts "\nInput 1 to guess another letter, or 2 to guess the word!"
  guess_option = gets.to_i

# Part of the game where letters are guessed and filled in
  if guess_option == 1
    puts 'What letter would you like to guess?'
    letter = gets.chomp.downcase.strip
    if letter_guessed.include?(letter)
      puts 'You already guessed that letter. Sorry, but for your ignorance you get a part.'
      parts = parts + 1
      played = true
    end
    letter_guessed.push(letter) unless letter_guessed.include?(letter)
    if letters_possible.include?(letter)
      if check_letter(word, letter) == false and played == false
        (parts = parts + 1)
        puts "Sorry, the letter #{letter} is not in the word."
      end
      puts "Congratulations! The letter #{letter} is in the word." if check_letter(word, letter) and played == false
    end
    unless letters_possible.include?(letter)
      puts 'Sorry, that is an invalid letter input. Please input something else.'
      letter_guessed.pop
    end
  end

  # guessing part of the game
  if guess_option == 2
    puts 'What word would you like to guess?'
    word_guess = gets.chomp.downcase.strip
    if word_guess != word
      puts 'Sorry, that was not the word. You get a strike.'
      parts = parts + 1
    end
    if word_guess == word
      !game
      puts "\nCONGRATULATIONS! YOU HAVE WON!"
      puts 'PLAY AGAIN, THE WORD WILL BE DIFFERENT!'
      sleep 3
      system 'clear'
      break
    end
  end

  # line of the program that stops the program from crashing on bad input
  puts "\nSorry, that is an invalid choice. Please choose again." if guess_option != 1 and guess_option != 2
end
#End of the program. DO NOT COPY MY PROGRAM