require 'test_helper'

class Es6TiltTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Es6Tilt
  end

  test "transpile" do
    template = ES6Tilt::ES6Transformer.new('./test/dummy/app/assets/javascripts/test.es6')
    output = template.render
    expectation = "var Test = (function () { 'use strict';

var babelHelpers = {};

babelHelpers.classCallCheck = function (instance, Constructor) {
  if (!(instance instanceof Constructor)) {
    throw new TypeError(\"Cannot call a class as a function\");
  }
};

babelHelpers;
foo = {
	bar: \"Bar\"
};

var Person = function Person() {
    var args = arguments.length <= 0 || arguments[0] === undefined ? \"default\" : arguments[0];
    babelHelpers.classCallCheck(this, Person);

    this.eat = \"happy Meal\";
};

return Person;

})();"
    assert_equal output, expectation
  end
end
