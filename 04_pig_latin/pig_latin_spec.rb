# # Topics
#
# * modules
# * strings
#
# # Pig Latin
#
# Pig Latin is a made-up children's language that's intended to be confusing. It obeys a few simple rules (below) but when it's spoken quickly it's really difficult for non-children (and non-native speakers) to understand.
#
# Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of the word.
#
# Rule 2: If a word begins with a consonant sound, move it to the end of the word, and then add an "ay" sound to the end of the word.
#
# (There are a few more rules for edge cases, and there are regional variants too, but that should be enough to understand the tests.)
#
# See <http://en.wikipedia.org/wiki/Pig_latin> for more details.
#
#

# Note from ToTenMilan:
# I have changed the method name from `translate` to `translat` because of issues described here
# http://stackoverflow.com/questions/41590976/why-word-translate-is-messing-irb?noredirect=1#comment70387735_41590976
#
# When in irb I ran the code with method name `translate` it started to messing things up.

# > def translate
# >   "foo"
# >   end
# ArgumentError: wrong number of arguments (given 1, expected 0)
#         from (irb):1:in `translate'
#         from /usr/local/rvm/rubies/ruby-2.3.3/bin/irb:11:in `<main>'
# > def bar
# >   "hello"
# >   end
# ArgumentError: wrong number of arguments (given 1, expected 0)
#         from (irb):1:in `translate'
#         from /usr/local/rvm/rubies/ruby-2.3.3/bin/irb:11:in `<main>'

require "pig_latin"

describe "#pig_latin" do

  it "translates a word beginning with a vowel" do
    s = pig_latin("apple")
    expect(s).to eq("appleay")
  end

  it "translates a word beginning with a consonant" do
    s = pig_latin("banana")
    expect(s).to eq("ananabay")
  end

  it "translates a word beginning with two consonants" do
    s = pig_latin("cherry")
    expect(s).to eq("errychay")
  end

  it "translates two words" do
    s = pig_latin("eat pie")
    expect(s).to eq("eatay iepay")
  end

  it "translates a word beginning with three consonants" do
    expect(pig_latin("three")).to eq("eethray")
  end

  it "counts 'sch' as a single phoneme" do
    s = pig_latin("school")
    expect(s).to eq("oolschay")
  end

  it "counts 'qu' as a single phoneme" do
    s = pig_latin("quiet")
    expect(s).to eq("ietquay")
  end

  it "counts 'qu' as a consonant even when it's preceded by a consonant" do
    s = pig_latin("square")
    expect(s).to eq("aresquay")
  end

  it "translates many words" do
    s = pig_latin("the quick brown fox")
    expect(s).to eq("ethay ickquay ownbray oxfay")
  end

  # Test-driving bonus:
  # * write a test asserting that capitalized words are still capitalized (but with a different initial capital letter, of course)
  # * retain the punctuation from the original phrase
  it "doesn't downcase capitalize letters" do
    s = pig_latin("The Holy Cow with Crown")
    expect(s).to eq("Ethay Olyhay Owcay ithway Owncray")
  end

end
