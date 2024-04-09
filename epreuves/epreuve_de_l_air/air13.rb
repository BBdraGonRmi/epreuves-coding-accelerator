class String
  def red;            "\e[31m#{self}\e[0m" end
  def green;          "\e[32m#{self}\e[0m" end
end


testss = [
  {
    test_name:  "test00",
    file_name:  "air00.rb",
    input:      "argument",
    output:     "Usage: ruby program_name.rb arguments\n"
  },

  {
    test_name:  "test01",
    file_name:  "air00.rb",
    input:      "Bonjour les gars",
    output:     "Bonjour\nles\ngars\n"
  },

  {
    test_name:  "test02",
    file_name:  "air01.rb",
    input:      "argument",
    output:     "Usage: ruby program_name.rb arguments\n"
  },
]

tests = [
  [
    {
      test_name:  "test00",
      file_name:  "air00.rb",
      input:      "argument",
      output:     "Usage: ruby program_name.rb arguments\n"
    },

    {
      test_name:  "test01",
      file_name:  "air00.rb",
      input:      "Bonjour les gars",
      output:     "Bonjour\nles\ngars\n"
    }
  ],

  [
    {
      test_name:  "test02",
      file_name: "air01.rb",
      input:      "argument",
      output:     "Usage: ruby program_name.rb arguments\n"
    },

    {
      test_name:  "test03",
      file_name: "air01.rb",
      input:      '"Crevette magique dans la mer des étoiles" "la"',
      output:     "Crevette magique dans \n mer des étoiles\n"
    }
  ]
]


def test_output(tests_hash)

  file_name = tests_hash[:file_name]
  input = tests_hash[:input]
  output = tests_hash[:output]

  p "input: ruby #{file_name} #{input}"

  print test_output = %x(ruby "#{file_name}" #{input})

  if test_output == output
    return true

  else
    return false
  end
end

def print_tests_results(tests)

  test_number = 1

  for each_file_array in tests

    total_tests = each_file_array.length

    for each_test in each_file_array

      if test_output(each_test)
        test_result = "success".green
      else
        test_result = "failure".red
      end

      puts "#{each_test[:file_name][0...-3]} (#{test_number}/#{total_tests}): #{test_result}"
      test_number += 1
    end

    test_number = 1
  end

  return success_counter
end

print_tests_results(tests)

#success_counter = print_tests_results(success_counter)

#puts "Total success: (#{success_counter}/#{test_counter})"
