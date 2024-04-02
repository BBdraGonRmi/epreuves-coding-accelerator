class String
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
end

class ProgramTest

  attr_accessor :file_name
  attr_accessor :parameter
  attr_accessor :output
  attr_accessor :test_number
  attr_accessor :test_result

  def initialize(file_name, parameter, output, test_name)
    @file_name = file_name
    @parameter = parameter
    @output = output
    @test_number = test_number
    @test_result = test_output(file_name, parameter, output)
  end

end

class Program

  attr_accessor :file_name
  attr_accessor :test

  def initialize(file_name)
    @file_name = file_name

    def set_program_test(parameter, output, test_number)
      test_name = "test" + test_number.to_s
      @test = ProgramTest.new(parameter, output, test_name)
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


def test_output(program_name, argument, output)
  #puts "ruby #{program_name} #{argument}"
  test_output = %x(ruby #{program_name} #{argument})
  #p output
  if test_output == output
    return true
  else
    return false
  end
end

def test_program_takes_one_argument(program_name)
  output = %x(ruby #{program_name} "argument")
  if output == "Usage: ruby program_name.rb arguments\n"
    return false
  else
    return true
  end
end



argument = '"Salut les gars" "les"'
output = "Salut \n gars\n"

folder_name = "epreuve_de_l_air"
file_format = /^air\d\d.rb$/

file_names_array = load_file_names(folder_name, file_format)

success_counter = 0
test_counter = 0
file_number = 0
program_names_array = []

for each_file in file_names_array
  program_name = "program#{file_number}"
  program_name = each_file
  program_names_array << program_name
  file_number += 1
end


for each_file in file_names_array

  test_result = test_output(each_file, argument, output)

  test_counter += 1
  if test_result == true
    test_result = "success".green
    success_counter += 1
  else
    test_result = "failure".red
  end
  puts "#{each_file[0...-3]}: #{test_result}"


end

puts "..."
puts "Total success: (#{success_counter}/#{test_counter})"

air_zero = Program.new("air00")
test_trois = ProgramTest.new("air01.rb", '"Salut les gars" "les"', "Salut \n gars\n", 3)
puts test_trois.file_name
puts test_trois.parameter
puts test_trois.output
puts test_trois.test_number
puts test_trois.test_result
