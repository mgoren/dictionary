class Word

  define_method(:initialize) do |language, word|
    @language = language
    @word = word
  end

  define_method(:get_word) do
    @word
  end

  define_method(:get_language) do
    @language
  end

end
