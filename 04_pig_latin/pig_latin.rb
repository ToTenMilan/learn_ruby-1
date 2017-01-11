#write your code here

# Note from ToTenMilan:
# I have changed the method name from `translate` to `translat` because of issues described here
# http://stackoverflow.com/questions/41590976/why-word-translate-is-messing-irb?noredirect=1#comment70387735_41590976

def pig_latin(string)
  words_array = string.split(" ")
  modified_words_array = ""
  words_array.map do |word|
    if word =~ /\A[aeiou]/
      word += "ay"
      modified_words_array << word + " "
    # regex to grab three consonants took from http://stackoverflow.com/questions/18406509/using-regexp-to-check-whether-a-string-starts-with-a-consonant
    elsif ( word =~ /\A(?i:(?![aeiou])[a-z]){3}/ ) || ( word =~ (/\b[^aeiou]+qu/) ) # word =~ /\A[^aeiou]+qu{3}/ )
      without_first_three = word[3..-1]
      without_first_three += word[0..2] + "ay"
      if word[0] == word[0].upcase
        without_first_three.capitalize!
      end
      modified_words_array << without_first_three + " "
    elsif ( word =~ /\A(?i:(?![aeiou])[a-z]){2}/ ) || ( word =~ /\A[qu]{2}/ )
      without_first_two = word[2..-1]
      without_first_two += word[0..1] + "ay"
      if word[0] == word[0].upcase
        without_first_two.capitalize!
      end
      modified_words_array << without_first_two + " "
    elsif word =~ /\A[^aeiou]/
      without_first = word[1..-1]
      without_first += word[0] + "ay"
      if word[0] == word[0].upcase
        without_first.capitalize!
      end
      modified_words_array << without_first + " "
    end
  end
  modified_words_array.chomp(" ")
end



# elsif !(string[0..1].include?("a", "e", "i", "o", "u"))
          #   without_first_two = string[2..-1]
          #   without_first_two + string[0..1] + "ay"
          # elsif =~ /\A(?i:(?![aeiou])[a-z]){3}/