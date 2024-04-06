SUB_EXPRESSION_ARRAY_index = 0
EXPRESSION_ARRAY_index = 1
SUB_EXPRESSION_INDEX_index = 2


def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb arguments"
      exit
  else
      return arguments
  end
end


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

  parentethis_found = false
  sub_expression_indicator = false
  sub_expression_array = []
  rest_expression_array = []
  array_index = 0
  start_array_index = 0

  for each_string in expression_array

    if sub_expression_indicator == false

      if each_string =~ /\(/
        parentethis_found = true
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

  parentethis_expression_array = [sub_expression_array, rest_expression_array, start_array_index, parentethis_found]
  return parentethis_expression_array
end

def search_for_sign(expression_array, sign)

  sign_found = false
  sub_expression_array = []
  sub_expression_index = 0

  for each_element in expression_array

    if each_element =~ /#{sign}/
      sign_found = true
      sub_expression_array.clear
      sub_expression_index -= 1

      for i in 0...3
        sub_expression_array << expression_array.delete_at(sub_expression_index)
      end

      break

    else
      sub_expression_index += 1
    end
  end

  sign_expression_array = [sub_expression_array, expression_array, sub_expression_index, sign_found]
  return sign_expression_array
end


def solve_expression(expression_array)

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
    end
  end

  return expression_result
end


def insert_result_in_array(result, array, result_index)

  left_array = []
  right_array = []

  for i in 0...array.length
    if i < result_index
      left_array << array[i]
    else
      right_array << array[i]
    end
  end

  array = [left_array, result, right_array].flatten
  return array
end


def split_expression(expression_array)

  array_index = 0
  sign_found = false


  if expression_array.length <= 1
    return expression_array
  elsif expression_array.length <= 3
    return solve_expression(expression_array)
  end

  searched_expression_array = search_for_parentethis(expression_array)
  sign_found = searched_expression_array[-1]

  if sign_found == false
    sign = "\\%"
    searched_expression_array = search_for_sign(expression_array, sign)
    sign_found = searched_expression_array[-1]
  end

  if sign_found == false
    sign = "\\/|\\*"
    searched_expression_array = search_for_sign(expression_array, sign)
    sign_found = searched_expression_array[-1]
  end

  if sign_found == false
    sign = "\\+|\\-"
    searched_expression_array = search_for_sign(expression_array, sign)
    sign_found = searched_expression_array[-1]
  end

  sub_expression_array = searched_expression_array[SUB_EXPRESSION_ARRAY_index]
  expression_array = searched_expression_array[EXPRESSION_ARRAY_index]
  sub_expression_index = searched_expression_array[SUB_EXPRESSION_INDEX_index]
  result = split_expression(sub_expression_array)

  split_expression(insert_result_in_array(result, expression_array, sub_expression_index))
end

puts expression_result = split_expression(put_expression_in_an_array(arguments_are_valid(ARGV, 1)[0]))
