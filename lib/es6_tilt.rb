require 'tilt'
require 'babel/transpiler'
require 'sprockets'

module ES6Tilt 
  class ES6Transformer< Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
      output = Babel::Transpiler.transform(data, {"modules" => "system"})
      output["code"]
    end

  end
end
Tilt.register(ES6Tilt::ES6Transformer, "es6")
