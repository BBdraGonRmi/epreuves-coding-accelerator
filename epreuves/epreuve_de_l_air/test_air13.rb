class String
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
end


class ProgramTest

  attr_accessor :test_name
  attr_accessor :file_name
  attr_accessor :parameter
  attr_accessor :output
  attr_accessor :test_number
  attr_accessor :test_result
  attr_accessor :number_of_tests

  def self.all
    # Lazy-initialize the collection to an empty array
    @all ||= {}
  end

  def initialize(file_name, *rest)
    @file_name = file_name
    @number_of_tests = 1

    if rest[0] == nil
      @test_result = test_program_takes_one_argument(file_name)
    else
      @parameter = rest[0]
      @output = rest[1]
      @test_result = test_output(file_name, parameter, output)
    end

    if ProgramTest.all.include?(self.file_name)
      ProgramTest.all[self.file_name][0] += 1             #test_number incrementation
      ProgramTest.all[self.file_name] << self.test_result
    else
      ProgramTest.all["#{self.file_name}"] = [self.number_of_tests, self.test_result]
    end
  end
end


def load_file_names(folder_name, file_format)
  file_names_array = []
  files_in_folder = to_words_array(%x(ls), /\n/)
  for each_file in files_in_folder
    if each_file =~ file_format
      file_names_array << each_file
    end
  end
  return file_names_array
end


def to_words_array(sentence, string_separator)
  array_index = 0
  word = ""
  words_array = []
  for each_character in sentence.chars
    if each_character =~ string_separator
      words_array[array_index] = word
      word = ""
      array_index += 1
    else
      word << each_character
    end
  end
  return words_array
end


def test_program_takes_one_argument(file_name)
  output = %x(ruby #{file_name} "argument")
  if output == "Usage: ruby program_name.rb arguments\n"
    return false
  else
    return true
  end
end


def test_output(file_name, parameter, output)
  test_output = %x(ruby #{file_name} #{parameter})
  if test_output == output
    return true
  else
    return false
  end
end


def do_tests(file_names_array, test_counter)
  for each_file in file_names_array
    ProgramTest.new(each_file)
    test_counter += 1
  end

  ProgramTest.new("air00.rb", '"Bonjour les gars"', "Bonjour\nles\ngars\n")
  test_counter += 1

  ProgramTest.new("air01.rb", '"Crevette magique dans la mer des étoiles" "la"', "Crevette magique dans \n mer des étoiles\n")
  test_counter += 1

  ProgramTest.new("air02.rb", '"Je" "teste" "des" "trucs" " "', "Je teste des trucs\n")
  test_counter += 1

  ProgramTest.new("air03.rb", "1 2 3 4 5 4 3 2 1", "5\n")
  test_counter += 1
  ProgramTest.new("air03.rb", "bonjour monsieur bonjour", "monsieur\n")
  test_counter += 1

  ProgramTest.new("air04.rb", '"Hello milady,    bien ou quoi ??"', "Helo milady, bien ou quoi ?\n")
  test_counter += 1

  ProgramTest.new("air05.rb", '1 2 3 4 5 "+2"', "3 4 5 6 7\n")
  test_counter += 1

  ProgramTest.new("air05.rb", '10 11 12 20 "-5"', "5 6 7 15\n")
  test_counter += 1

  ProgramTest.new("air06.rb", '"Michel" "Albert" "Thérèse" "Benoit" "t"', "Albert, Thérèse, Benoit\n")
  test_counter += 1

  ProgramTest.new("air06.rb", '"Michel" "Albert" "Thérèse" "Benoit" "a"', "Albert\n")
  test_counter += 1

  ProgramTest.new("air07.rb", "1 3 4 2", "1 2 3 4\n")
  test_counter += 1

  ProgramTest.new("air07.rb", "10 20 30 40 50 60 70 90 33", "10 20 30 33 40 50 60 70 90\n")
  test_counter += 1

  ProgramTest.new("air08.rb", "10 20 30 fusion 15 25 35", "10 15 20 25 30 35\n")
  test_counter += 1

  ProgramTest.new("air09.rb", '"Michel" "Albert" "Thérèse" "Benoit"', "Albert, Thérèse, Benoit, Michel\n")
  test_counter += 1

  ProgramTest.new("air10.rb", "file.txt", "Je danse le mia\n")
  test_counter += 1

  ProgramTest.new("air11.rb", "o 5", "    o\n   ooo\n  ooooo\n ooooooo\nooooooooo\n")
  test_counter += 1

  ProgramTest.new("air12.rb", "6 5 4 3 2 1", "array is complitely sorted: 1 2 3 4 5 6\n")
  test_counter += 1

  return test_counter
end


def print_tests_results(success_counter)
  for each_test in ProgramTest.all

    for i in 1...each_test[1].length

      if each_test[1][i] == true
        test_result = "success".green
        success_counter += 1
      else
        test_result = "failure".red
      end

      puts "#{each_test[0][0...-3]} (#{i}/#{each_test[1][0]}): #{test_result}"
    end
  end

  return success_counter
end

folder_name = "epreuve_de_l_air"
file_format = /^air\d\d.rb$/
file_names_array = load_file_names(folder_name, file_format)

test_counter = 0
test_counter = do_tests(file_names_array, test_counter)

success_counter = 0
success_counter = print_tests_results(success_counter)

puts
puts "Total success: (#{success_counter}/#{test_counter})"
