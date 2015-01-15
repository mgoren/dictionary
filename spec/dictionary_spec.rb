require('rspec')
require('dictionary')
require('word')
require('definition')

describe(Term) do

  # before() do
  #   Term.clear()
  # end

  describe('#get_definition_objects') do
    it("returns array of definition objects when provided a Term object") do
      word1 = Word.new("english", "coffee")
      word2 = Word.new("spanish", "cafe")
      word3 = Word.new("kinyarwanda", "akawa")
      word4 = Word.new("italian", "caffe")
      def1 = Definition.new("english","a hot caffeinated beverage")
      def2 = Definition.new("spanish", "bebida caliente")
      def3 = Definition.new("kinyarwanda", "nescafe")
      term1 = Term.new(word1, def1)
      term1.add_word_object(word2)
      term1.add_word_object(word3)
      term1.add_definition_object(def3)
      term1.add_definition_object(def2)
      expect(term1.get_definition_objects()).to(eq([def1, def3, def2]))
    end
  end

  describe('#get_entry') do
    it("returns word object & definition object matching language provided") do
      word1 = Word.new("english", "coffee")
      word2 = Word.new("spanish", "cafe")
      word3 = Word.new("kinyarwanda", "akawa")
      word4 = Word.new("italian", "caffe")
      def1 = Definition.new("english","a hot caffeinated beverage")
      def2 = Definition.new("spanish", "bebida caliente")
      def3 = Definition.new("kinyarwanda", "nescafe")
      term1 = Term.new(word1, def1)
      term1.add_word_object(word2)
      term1.add_word_object(word3)
      term1.add_definition_object(def3)
      term1.add_definition_object(def2)
      expect(term1.get_entry("spanish")).to(eq(["cafe", "bebida caliente"]))
    end
  end

  describe('#search') do
    it("returns term object that includes the provided word") do
      word1 = Word.new("english", "coffee")
      word2 = Word.new("spanish", "cafe")
      word3 = Word.new("kinyarwanda", "akawa")
      def1 = Definition.new("english","a hot caffeinated beverage")
      def2 = Definition.new("spanish", "bebida caliente")
      def3 = Definition.new("kinyarwanda", "nescafe")
      water1 = Word.new("english", "water")
      water2 = Word.new("kinyarwanda", "amazi")
      water3 = Word.new("spanish", "agua")
      waterdef1 = Definition.new("english", "the ocean stuff")
      waterdef2 = Definition.new("spanish", "para beber")
      waterdef3 = Definition.new("kinyarwanda", "h20")
      term1 = Term.new(word1, def1)
      term1.add_word_object(word2)
      term1.add_word_object(word3)
      term1.add_definition_object(def3)
      term1.add_definition_object(def2)
      term2 = Term.new(water1, waterdef1)
      term2.add_word_object(water2)
      term2.add_word_object(water3)
      term2.add_definition_object(waterdef2)
      term2.add_definition_object(waterdef3)
      term1.save()
      term2.save()
      expect(Term.search("amazi")).to(eq(term2))
    end
  end







end
