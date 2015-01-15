class Term
@@dictionary = []

  define_method(:initialize) do |word_object, definition_object|
    @word_objects = [word_object]
    @definition_objects = [definition_object]
  end

  define_method(:add_word_object) do |word_object|
    @word_objects.push(word_object)
  end

  define_method(:add_definition_object) do |definition_object|
    @definition_objects.push(definition_object)
  end

  define_method(:get_definition_objects) do
    @definition_objects
  end

  define_method(:get_word_objects) do
    @word_objects
  end

  define_method(:get_entry) do |language|
    word = ""
    definition = ""
    @word_objects.each() do |w_obj|
      if w_obj.get_language() == language
        word = w_obj.get_word()
      end
    end
    @definition_objects.each() do |d_obj|
      if d_obj.get_language() == language
        definition = d_obj.get_definition()
      end
    end
    [word, definition]
  end

  define_method(:includes_word?) do |search_word|
    @word_objects.each() do |w_obj|
      if w_obj.get_word() == search_word
        return true
      end
    end
    return false
  end

  define_singleton_method(:clear) do
    @@dictionary = []
  end

  define_singleton_method(:all) do
    @@dictionary
  end

  define_method(:save) do
    @@dictionary.push(self)
  end

  define_singleton_method(:search) do |search_word|
    @@dictionary.each() do |term|
      if term.includes_word?(search_word)
        return term
      end
    end
  end



end


# word1 = Word.new("english", "coffee")
# word2 = Word.new("spanish", "cafe")
# word3 = Word.new("kinyarwanda", "akawa")
# def1 = Definition.new("english","a hot caffeinated beverage")
# def2 = Definition.new("spanish", "bebida caliente")
# def3 = Definition.new("kinyarwanda", "nescafe")
# water1 = Word.new("english", "water")
# water2 = Word.new("kinyarwanda", "amazi")
# water3 = Word.new("spanish", "agua")
# waterdef1 = Definition.new("english", "the ocean stuff")
# waterdef2 = Definition.new("spanish", "para beber")
# waterdef3 = Definition.new("kinyarwanda", "h20")
# term1 = Term.new(word1, def1)
# term1.add_word_object(word2)
# term1.add_word_object(word3)
# term1.add_definition_object(def3)
# term1.add_definition_object(def2)
# term2 = Term.new(water1, waterdef1)
# term2.add_word_object(water2)
# term2.add_word_object(water3)
# term2.add_definition_object(waterdef2)
# term2.add_definition_object(waterdef3)
# term1.save()
# term2.save()
