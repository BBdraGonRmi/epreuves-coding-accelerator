def is_valid(argument, number)
    if argument.length != number
        puts "Usage: ruby terre11.rb argument"
        exit
    else
        return argument
    end
  end

def is_sentence(sentence)
    for character in sentence.chars
        if Integer(character, exception: false) == nil
            return sentence
        else
            puts "Usage: argument must be a sentence"
            exit
        end
    end
end

def to_upcase(character)
    if character =~ /[a-z]/
        character = (character.ord - 32).chr
        return character
    else
        return character
    end
end

def to_downcase(character)
    if character =~ /[A-Z]/
        character = (character.ord + 32).chr
        return character
    else
        return character
    end
end

argument = ARGV
sentence = is_sentence(is_valid(argument, 1)[0])
modified_sentence = ""
character_index = 0
current_character = sentence[character_index]
case_selector = "upcase"

while current_character != nil
    if current_character =~ /\S/
        if case_selector == "upcase"
            modified_sentence[character_index] = to_upcase(current_character)
            case_selector = "downcase"
        else
            modified_sentence[character_index] = to_downcase(current_character)
        end
    else
        modified_sentence[character_index] = current_character
        case_selector = "upcase"
    end
    character_index += 1
    current_character = sentence[character_index]
end

puts modified_sentence
