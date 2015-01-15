require('rspec')
require('definition')

describe(Definition) do

  describe("#get_definition") do
    it("will retrieve a definition from the provided language") do
      def1 = Definition.new("english", "a wooden cup")
      expect(def1.get_definition()).to(eq("a wooden cup"))
    end
  end





end
