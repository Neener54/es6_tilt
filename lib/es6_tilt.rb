require 'tilt'
require 'execjs'
require 'babel/source'

class ES6Tilt < Tilt::Template
  include Babel::Source
  self.default_mime_type = 'application/javascript'

  def prepare
  end

  def source_path
    Babel::Source::PATH
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

  def evaluate(scopre, locals, &block)
    @output ||= transform(data)
  end

end

ActiveSupport.on_load(:action_view) do
  ActionView::Template.register_template_handler :es6, ES6Tilt
end