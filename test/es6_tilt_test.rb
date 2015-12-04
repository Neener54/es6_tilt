require 'test_helper'

class Es6TiltTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Es6Tilt
  end

  test "transpile" do
    template = ES6Tilt::ES6Transformer.new('./test/dummy/app/assets/javascripts/test.es6')
    output = template.render
    expectation = "var Test.es6 = (function () { 'use strict';

foo = {
	bar: \"Bar\"
};

class Person {
    constructor(args = \"default\") {
        this.eat = \"happy Meal\";
    }
}

return Person;

})();"
    assert_equal output, expectation
  end
end
