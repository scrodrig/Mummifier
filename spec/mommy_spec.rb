require 'mommy'
require 'faker'

RSpec.describe Mommy, '#Mommy' do
  it 'should not mummified an empty string' do
    word_to_be_mummified = ''
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to be_empty
  end

  it 'should not mummified a non-vowel letter' do
    word_to_be_mummified = Faker::HowIMetYourMother.catch_phrase.tr('aeiouAEIOU', '')
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(word_to_be_mummified)
  end

  it 'Should mummified a single vowel letter' do
    expected_word_mummified = 'mommy'
    word_to_be_mummified = Faker::Base.regexify(/[aeiouAEIOU]/)
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(expected_word_mummified)
  end

  it 'should mummified a single time when have two vowels together' do
    expected_word_mummified = 'mommy'
    word_to_be_mummified = Faker::Base.regexify(/[aeiouAEIOU][aeiouAEIOU]/)
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(expected_word_mummified)
  end

  it 'should mummified a single time when have more than two vowels together' do
    expected_word_mummified = 'mommy'
    word_to_be_mummified = Faker::Base.regexify(/[aeiouAEIOU][aeiouAEIOU]/)
    mummified_word = Mommy.new.mummified(word_to_be_mummified)
    expect(mummified_word).to eq(expected_word_mummified)
  end

end
