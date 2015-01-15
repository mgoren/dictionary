class Term
@@dictionary = []

  define_method(:initialize) do |word, definition|
    @words = [word]
    @definitions = [definition]
  end


  define_method(:add_word) do |word2|
    @words.push(word2)
  end

  define_method(:add_definition) do |definition2|
    @definitions.push(definition2)
  end

  define_method(:get_words) do
    @words
  end

  define_method(:define) do
    @definitions
  end

  define_method(:save) do
    @@dictionary.push(self)
  end



  define_singleton_method(:clear) do
    @@dictionary = []
  end

  define_singleton_method(:all) do
    @@dictionary
  end

  define_singleton_method(:search) do |search_word|
    term_to_return = nil
    @@dictionary.each() do |term|
      if term.get_words().include?(search_word)
        term_to_return = term
      end
    end
    term_to_return
  end

end



coffee = Term.new("coffee","a delicious beverage")
coffee.save()
coffee.add_word("cafe")
coffee.add_word("akawa")
coffee.add_definition("caffeine!")
tea = Term.new("tea","a tasty beverage")
tea.save()
beer = Term.new("beer","an awesome morning alternative")
beer.save()
puts(Term.search("tea").define())
