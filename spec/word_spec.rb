require('rspec')
require('word')

describe(Word) do

  describe('#get_word')
  it("returns the word given the language") do
    test_word = Word.new("english","coffee")
    expect(test_word.get_word()).to(eq("coffee"))
  end





end
