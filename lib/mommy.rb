class Mommy
  REGEXP_VOWEL = /[aeiouAEIOU]/
  MOMMY = 'mommy'

  def mummified(word_to_mummify)
    before_letter = word_to_mummify.chars[0]

    if mummificable?(word_to_mummify)
      return word_to_mummify
    end

    word_to_mummify = word_to_mummify.chars.map do |letter|
      if !letter.chars.grep(REGEXP_VOWEL).empty?
        mummified_vowels(before_letter, letter)
        before_letter = MOMMY
      else
        before_letter = letter
      end
      letter
    end.join
    return word_to_mummify
  end

  def mummificable?(word_to_mummify)
    total_vowels = word_to_mummify.chars.grep(REGEXP_VOWEL).size
    return word_to_mummify.empty?  || total_vowels * 100 / word_to_mummify.chars.size < 30
  end

  def mummified_vowels(before_letter, letter)
    if before_letter != MOMMY
      letter.gsub!(REGEXP_VOWEL, MOMMY)
    else
      letter.gsub!(REGEXP_VOWEL, '')
    end
  end
end
