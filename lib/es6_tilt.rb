require 'tilt'
require 'babel/transpiler'
require 'sprockets'

module ES6Tilt
  class ES6Transformer< Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)
      output = Babel::Transpiler.transform(data)
      puts output.inspect
      output["code"]
    end

  end
end
Sprockets.register_engine('.es6', ES6Tilt::ES6Transformer)
Sprockets.register_engine('.jsx', ES6Tilt::ES6Transformer)
