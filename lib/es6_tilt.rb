require 'tilt'
require 'execjs'
require 'babel/source'
module Es6Tilt
  class ES6TiltTransformer < Tilt::Template
    include Babel::Source
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def source_path
      PATH
    end

    def script_path
      File.join(source_path, "babel.js")
    end

    def context
      @context ||= ExecJS.compile("var self = this; " + File.read(script_path))
    end

    def transform(code, options = {})
      result = context.call('babel.transform', code, options.merge('ast' => false))
      return result['code']
    end

    def self.call(template)

    end

    def evaluate(scope, locals, &block)
      @output ||= transform(data)
    end
  end
end
ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler :es6, Es6Tilt::ES6TiltTransformer
end