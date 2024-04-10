#PREPARING STRING COLORS
class String
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
end


#PARSING FUNCTION ?
def load_tests()

  tests = [
    [
      {
        file_name:  "air00.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air00.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air00.rb",
        input:      '"Bonjour les gars"',
        output:     "Bonjour\nles\ngars\n"
      }
    ],

    [
      {
        file_name:  "air01.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air01.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name: "air01.rb",
        input:      '"Crevette magique dans la mer des étoiles" "la"',
        output:     "Crevette magique dans \n mer des étoiles\n"
      }
    ],

    [
      {
        file_name:  "air02.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air02.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air02.rb",
        input:      '"Je" "teste" "des" "trucs" " "',
        output:     "Je teste des trucs\n"
      }
    ],

    [
      {
        file_name:  "air03.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air03.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name: "air03.rb",
        input:      "1 2 3 4 5 4 3 2 1",
        output:     "5\n"
      },

      {
        file_name: "air03.rb",
        input:      "bonjour monsieur bonjour",
        output:     "monsieur\n"
      }
    ],

    [
      {
        file_name:  "air04.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air04.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air04.rb",
        input:      '"Hello milady!!    biennn ou quoi"',
        output:     "Helo milady! bien ou quoi\n"
      }
    ],

    [
      {
        file_name:  "air05.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air05.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air05.rb",
        input:      '1 2 3 4 5 "+2"',
        output:     "3 4 5 6 7\n"
      },

      {
        file_name:  "air05.rb",
        input:      '10 11 12 20 "-5"',
        output:     "5 6 7 15\n"
      }
    ],

    [
      {
        file_name:  "air06.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air06.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air06.rb",
        input:      '"Michel" "Albert" "Thérèse" "Benoit" "t"',
        output:     "Albert, Thérèse, Benoit\n"
      },

      {
        file_name:  "air06.rb",
        input:      '"Michel" "Albert" "Thérèse" "Benoit" "a"',
        output:     "Albert\n"
      }
    ],

    [
      {
        file_name:  "air07.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air07.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air07.rb",
        input:      "1 3 4 2",
        output:     "1 2 3 4\n"
      },

      {
        file_name:  "air07.rb",
        input:      "10 20 30 40 50 60 70 90 33",
        output:     "10 20 30 33 40 50 60 70 90\n"
      }
    ],

    [
      {
        file_name:  "air08.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air08.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air08.rb",
        input:      "10 20 30 fusion 15 25 35",
        output:     "10 15 20 25 30 35\n"
      }
    ],

    [
      {
        file_name:  "air09.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air09.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air09.rb",
        input:      '"Michel" "Albert" "Thérèse" "Benoit"',
        output:     "Albert, Thérèse, Benoit, Michel\n"
      }
    ],

    [
      {
        file_name:  "air10.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air10.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air10.rb",
        input:      "file.txt",
        output:     "Je danse le mia\n"
      }
    ],

    [
      {
        file_name:  "air11.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air11.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air11.rb",
        input:      "o 5",
        output:     "    o\n   ooo\n  ooooo\n ooooooo\nooooooooo\n"
      }
    ],

    [
      {
        file_name:  "air12.rb",
        input:      "arg1",
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air12.rb",
        input:      '"arg1" "arg2"',
        output:     "Usage:|Error:"
      },

      {
        file_name:  "air12.rb",
        input:      "6 5 4 3 2 1",
        output:     "1 2 3 4 5 6\n"
      }
    ]
  ]

  return tests
end


#UTILITY FUNCTIONS
def test_output(tests_hash)

  file_name = tests_hash[:file_name]
  input = tests_hash[:input]
  output = tests_hash[:output]

  p "input: ruby #{file_name} #{input}"
  test_output = %x(ruby "#{file_name}" #{input})

  if test_output =~ /#{output}/
    puts test_output.green
    puts
    return true

  else
    p "ouput: #{output} ; test_output: #{test_output}"
    puts test_output.red
    p test_output
    p output
    puts
    return false
  end
end


def run_all_tests(tests)

  test_number = 1
  success_counter = 0

  for each_file_array in tests

    total_tests = each_file_array.length

    for each_test in each_file_array

      if test_output(each_test)
        each_test[:test_result] = "success".green
        success_counter += 1
      else
        each_test[:test_result] = "failure".red
      end

      each_test[:test_number] = test_number
      each_test[:total_tests] = total_tests
      test_number += 1
    end

    test_number = 1
  end

  return success_counter
end


#RESOLUTION & DISPLAY FUNCTION
def main ()

  tests = load_tests()
  success_counter = run_all_tests(tests)
  total_tests_number = tests.flatten.length

  for each_test in tests.flatten
    puts "#{each_test[:file_name][0...-3]} (#{each_test[:test_number]}/#{each_test[:total_tests]}): #{each_test[:test_result]}"
  end

  puts
  puts "Total success: (#{success_counter}/#{total_tests_number})"
end

main()
