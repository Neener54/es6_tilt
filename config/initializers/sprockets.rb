require_relative '../../lib/es6_tilt'
Rails.application.assets.register_mime_type 'application/javascript', '.js'
Rails.application.assets.register_engine '.js', ES6Tilt
Rails.application.assets.register_mime_type 'application/javascript', '.jsx'
Rails.application.assets.register_engine '.jsx', ES6Tilt
Rails.application.assets.register_mime_type 'application/javascript', '.es6'
Rails.application.assets.register_engine '.es6', ES6Tilt