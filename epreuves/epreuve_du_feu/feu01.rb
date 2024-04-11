SUB_EXPRESSION_ARRAY_index = 0
EXPRESSION_ARRAY_index = 1
SUB_EXPRESSION_INDEX_index = 2
SIGN_index = -1

#ERROR HANDLING FUNCTIONS
def arguments_are_valid(arguments, arguments_number)
  if arguments.length != arguments_number
      puts "Usage: ruby program_name.rb + #{arguments_number} arguments"
      exit
  else
      return arguments
  end
end

#UTILITY FUNCTIONS
def put_expression_in_an_array(expression)
  expression_array = []
  array_index = 0
  expression.each_char do |character|
    if character =~ /\s/
      array_index += 1
    else
      if expression_array[array_index] == nil
        expression_array[array_index] = character
      else
        expression_array[array_index] << character
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
  expression_array.each do |element|
    if sub_expression_indicator == false
      if element =~ /\(/
        parentethis_found = true
        sub_expression_indicator = true
        start_array_index = array_index
        element = element[1..]
        sub_expression_array << element
        array_index += 1
      else
        rest_expression_array << element
        array_index += 1
      end
    else
      if element =~ /\)/
        sub_expression_indicator = false
        element = element[...(-1)]
        sub_expression_array << element
        array_index += 1
      else
        sub_expression_array << element
        array_index += 1
      end
    end
  end
  parentethis_expression_array = [
    sub_expression_array,
    rest_expression_array,
    start_array_index,
    parentethis_found
  ]
  return parentethis_expression_array
end

def search_for_sign(expression_array, sign)
  sign_found = false
  sub_expression_array = []
  sub_expression_index = 0
  expression_array.each do |element|
    if element =~ /#{sign}/
      sign_found = true
      sub_expression_index -= 1
      3.times do
        sub_expression_array << expression_array.delete_at(sub_expression_index)
      end
    else
      sub_expression_index += 1
    end
  end
  sign_expression_array = [
    sub_expression_array,
    expression_array,
    sub_expression_index,
    sign_found
  ]
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
  array.each_with_index do |element, i|
    i < result_index ? left_array << element : right_array << element
  end
  result_array = [left_array, result, right_array].flatten
  return result_array
end

def solve_full_expression(expression_array)
  array_index = 0
  sign_found = false
  if expression_array.length <= 1
    return expression_array
  elsif expression_array.length <= 3
    return solve_expression(expression_array)
  end
  searched_expression_array = search_for_parentethis(expression_array)
  sign_found = searched_expression_array[SIGN_index]
  if sign_found == false
    sign = "\\%"
    searched_expression_array = search_for_sign(expression_array, sign)
    sign_found = searched_expression_array[SIGN_index]
  end
  if sign_found == false
    sign = "\\/|\\*"
    searched_expression_array = search_for_sign(expression_array, sign)
    sign_found = searched_expression_array[SIGN_index]
  end
  if sign_found == false
    sign = "\\+|\\-"
    searched_expression_array = search_for_sign(expression_array, sign)
    sign_found = searched_expression_array[SIGN_index]
  end
  sub_expression_array = searched_expression_array[SUB_EXPRESSION_ARRAY_index]
  expression_array = searched_expression_array[EXPRESSION_ARRAY_index]
  sub_expression_index = searched_expression_array[SUB_EXPRESSION_INDEX_index]
  result = solve_full_expression(sub_expression_array)
  solve_full_expression(insert_result_in_array(result, expression_array, sub_expression_index))
end


#RESOLUTION & DISPLAY FUNCTION
def main()
  argument = arguments_are_valid(ARGV, 1)[0]
  expression_array = put_expression_in_an_array(argument)
  expression_result = solve_full_expression(expression_array)
  puts expression_result
end

main()
