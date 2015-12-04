require 'tilt'
require 'sprockets'
require 'tempfile'

module ES6Tilt
  class ES6Transformer< Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def evaluate(scope, locals, &block)

      location = File.dirname(file)
      compacted = Tempfile.new('compacted', location)

      `#{Rails.root.join('node_modules','.bin')}/rollup -f iife --no-indent -c #{Rails.root}/rollup.config.js -n #{File.basename(file).camelize} -- #{file} > #{compacted.path}`

      output = compacted.read

      compacted.close
      compacted.unlink
      output
    end

  end
end
Sprockets.register_engine('.es6', ES6Tilt::ES6Transformer)
Sprockets.register_engine('.jsx', ES6Tilt::ES6Transformer)
