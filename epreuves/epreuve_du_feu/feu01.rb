def put_expression_in_an_array(expression)
  expression_array = []
  expression_array_index = 0
  for each_character in expression.chars
    if each_character =~ /\s/
      expression_array_index += 1
    else
      if expression_array[expression_array_index] == nil
        expression_array[expression_array_index] = each_character
      else
        expression_array[expression_array_index] << each_character
      end
    end
  end
  return expression_array
end


def search_for_parentethis(expression_array)

  sub_expression_indicator = false
  sub_expression_array = []
  rest_expression_array = []
  array_index = 0
  start_array_index = 0
  end_array_index = 0

  for each_string in expression_array

    if sub_expression_indicator == false

      if each_string =~ /\(/
        sub_expression_indicator = true
        start_array_index = array_index
        each_string = each_string[1..]
        sub_expression_array << each_string
        array_index += 1

      else
        rest_expression_array << each_string
        array_index += 1
      end

    else
      if each_string =~ /\)/
        sub_expression_indicator = false
        each_string = each_string[...(-1)]
        sub_expression_array << each_string
        array_index += 1

      else
        sub_expression_array << each_string
        array_index += 1
      end
    end
  end
  parentethis_expression_array = [sub_expression_array, rest_expression_array, start_array_index]

return parentethis_expression_array
end

def split_expression(expression_array)

  single_expression_array = []

  #first_sign_indicator = false

  #first_string_sign_operator = ""

  #second_string_sign_operator = ""

  #first_string_number = ""
  #second_string_number = ""
  array_index = 0

  print "long_expression: #{expression_array}\n"

  if expression_array.length <= 1
    return expression_array
  elsif expression_array.length <= 3
    return solve_expression(expression_array)
  end

  parentethis_expression_array = search_for_parentethis(expression_array)
  sub_expression_array = parentethis_expression_array[0]
  expression_array = []
  expression_array = parentethis_expression_array[1]
  array_index = parentethis_expression_array[2]

  print "sub expression: #{sub_expression_array}\n"
  print "rest expression: #{expression_array}\n"
  print "rest expression: #{array_index}\n"

  if sub_expression_array == []
    for each_string in expression_array

      if each_string =~ /\*|\//

        puts "index: #{array_index}"
        puts "sign: #{each_string}"

        sub_expression_array.clear
        array_index -= 1
        for i in 0...3
          sub_expression_array << expression_array.delete_at(array_index)
        end

        print "*/_sub expression: #{sub_expression_array}\n"
        print "rest of expression: #{expression_array}\n"
        break

      else
        sub_expression_array << each_string
        array_index += 1
      end
    end
  end

  result = split_expression(sub_expression_array)
  sub_expression_array.clear

  expression_array = insert_result_in_array(result, expression_array, array_index)

  print "modified expression: #{expression_array}\n"

  print "sub expression: #{sub_expression_array}\n"
  print "expression: #{expression_array}\n"

  split_expression(expression_array)

end

def insert_result_in_array(result, array, array_index)

  left_array = []
  right_array = []

  for i in 0...array.length
    if i < array_index
      left_array << array[i]
    else
      right_array << array[i]
    end
  end

  array = [left_array, result, right_array].flatten
  return array
end


def solve_expression(expression_array)

  print "expression to solve: #{expression_array}\n"

  if expression_array.length <= 3

    case expression_array[1]

      when /\%/
        expression_result = Integer(expression_array[0]) % Integer(expression_array[2])

      when /\//
        expression_result = Integer(expression_array[0]) / Integer(expression_array[2])

      when /\*/
        expression_result = Integer(expression_array[0]) * Integer(expression_array[2])

      when /\+/
        expression_result = Integer(expression_array[0]) + Integer(expression_array[2])

      when /\-/
        expression_result = Integer(expression_array[0]) - Integer(expression_array[2])

    else
      puts "Problem with sub expression sign"
      exit
    end
  else
    puts "Problem with sub expression length"
    exit
  end

  p "result: #{expression_result}"
  #expression_result = [expression_result].flatten
  return expression_result
  #expression_result << solve_expression(expression_array)
end

argument = ARGV[0]
p expression_array = put_expression_in_an_array(argument)
p expression_result = split_expression(expression_array)
