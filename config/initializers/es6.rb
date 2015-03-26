require_relative '../../lib/es6_tilt'
Rails.application.assets.register_mime_type 'application/javascript', '.js'
Rails.application.assets.register_engine '.js', Es6Tilt::ES6TiltTransformer
Rails.application.assets.register_mime_type 'application/javascript', '.jsx'
Rails.application.assets.register_engine '.jsx', Es6Tilt::ES6TiltTransformer
Rails.application.assets.register_mime_type 'application/javascript', '.es6'
Rails.application.assets.register_engine '.es6', Es6Tilt::ES6TiltTransformer