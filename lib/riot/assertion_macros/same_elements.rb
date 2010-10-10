module Riot
  # Asserts that two arrays contain the same elements, the same number of times.
  #   asserts("test") { ["foo", "bar"] }.same_elements(["bar", "foo"])
  #   should("test") { ["foo", "bar"] }.same_elements(["bar", "foo"])
  class SameElementsMacro < AssertionMacro
    register :same_elements
    require 'set'
    
    def evaluate(actual, expected)
      same = (Set.new(expected) == Set.new(actual))
      same ? pass : fail(expected_message.elements(expected).to_match(actual))
    end

    def devaluate(actual, expected)
      same = (Set.new(expected) == Set.new(actual))
      same ? fail(expected_message.elements(expected).not_to_match(actual)) : pass
    end

  end
end
