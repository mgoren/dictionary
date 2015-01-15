class Definition

  define_method(:initialize) do |language, definition|
    @language = language
    @definition = definition
  end

  define_method(:get_definition) do
    @definition
  end

  define_method(:get_language) do
    @language
  end

end
