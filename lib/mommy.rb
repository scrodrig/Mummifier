class Mommy
  REGEXP_VOWEL = /[aeiouAEIOU]/
  MOMMY = 'mommy'

  def mummified(word_to_mummify)
    before_letter = word_to_mummify.chars[0]
    word_to_mummify = word_to_mummify.chars.map do |letter|
      if !letter.chars.grep(REGEXP_VOWEL).empty?
        before_letter = mummified_vowels(before_letter, letter)
      else
        before_letter = letter
      end
      letter
    end.join
    return word_to_mummify
  end

  def mummified_vowels(before_letter, letter)
    if before_letter != MOMMY
      letter.gsub!(REGEXP_VOWEL, MOMMY)
      return MOMMY
    else
      letter.gsub!(REGEXP_VOWEL, '')
    end
  end
end
