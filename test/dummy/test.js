var test = (function () { 'use strict';

	foo = {
		bar: "Bar"
	};

	class Person {
	    constructor(args = "default") {
	        this.eat = "happy Meal";
	    }
	}

	return Person;

})();