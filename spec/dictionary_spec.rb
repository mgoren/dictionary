require('rspec')
require('dictionary')

describe(Term) do

  before() do
    Term.clear()
  end

  describe('#define') do

    it("returns a definition for the word called on") do
      coffee = Term.new("coffee","a delicious beverage")
      expect(coffee.define()).to(eq(["a delicious beverage"]))
    end

    it("returns multiple definitions for the word called on") do
      coffee = Term.new("coffee","a delicious beverage")
      coffee.add_definition("caffeine!")
      expect(coffee.define()).to(eq(["a delicious beverage","caffeine!"]))
    end

  end

  describe('.all') do
    it("returns all Term instances' word variable") do
      coffee = Term.new("coffee","a delicious beverage")
      coffee.save()
      tea = Term.new("tea","a tasty beverage")
      tea.save()
      expect(Term.all()).to(eq([coffee, tea]))
    end
  end

  describe('#search') do
    it("returns corresponding definition for provided word") do
      coffee = Term.new("coffee","a delicious beverage")
      coffee.save()
      tea = Term.new("tea","a tasty beverage")
      tea.save()
      expect(Term.search("tea")).to(eq(tea))
    end
  end

  describe('#get_words') do
    it("return all words for the term provided") do
      term = Term.new("coffee", "a delicious beverage")
      term.add_word("cafe")
      term.add_word("akawa")
      term.save()
      expect(term.get_words()).to(eq(["coffee", "cafe", "akawa"]))
    end
  end




end
