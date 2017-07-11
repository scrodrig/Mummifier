require 'mommy'
require 'faker'

RSpec.describe Mommy, '#Mommy' do
  MOMMY = 'mommy'
  vowel = /[aeiouAEIOU]/
  vowels = /[aeiouAEIOU]{2,5}/
  consonant = /[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]/
  consonants = /[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]{2,5}/

  it 'should not mummified an empty string' do
    mummified_word = Mommy.new.mummified('')
    expect(mummified_word).to be_empty
  end

  it 'should not mummified a non-vowel letter' do
    word_to_be_mummified = Faker::HowIMetYourMother.catch_phrase.tr('aeiouAEIOU', '')
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(word_to_be_mummified)
  end

  it 'should mummified a single vowel letter' do
    expected_word_mummified = MOMMY
    word_to_be_mummified = Faker::Base.regexify(vowel)
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(expected_word_mummified)
  end

  it 'should mummified a single time when have two vowels together' do
    expected_word_mummified = MOMMY
    word_to_be_mummified = Faker::Base.regexify(vowels)
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(expected_word_mummified)
  end

  it 'should not mummified when the word has less than 30 percent of vowels' do
    word_to_be_mummified = Faker::Base.regexify(consonants) + Faker::Base.regexify(vowel) + Faker::Base.regexify(consonants)
    expected_word_mummified = word_to_be_mummified
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(expected_word_mummified);
  end

  it 'should mummified when the word has more han 30 percent of vowels' do
    consonant = Faker::Base.regexify(consonant)
    vowel = Faker::Base.regexify(vowel)
    word_to_be_mummified = consonant + vowel + consonant
    expected_word_mummified = consonant + MOMMY + consonant
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(expected_word_mummified);
  end

end
