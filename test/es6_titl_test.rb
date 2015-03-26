require 'test_helper'

class Es6TiltTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Sprockets::ES6TiltTransformer
  end
  test "transpile" do
    template = Sprockets::ES6TiltTransformer.new('./test/dummy/app/assets/javascripts/test.es6')
    output = template.render
    expectation = '"use strict";

var _classCallCheck = function (instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } };

/**
 * Created by michaelarchibald on 3/25/15.
 */

var Person = function Person() {
    var args = arguments[0] === undefined ? "default" : arguments[0];

    _classCallCheck(this, Person);

    this.eat = "happy Meal";
};'
    assert_equal expectation, output
  end
end
