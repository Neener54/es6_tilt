require_relative '../../lib/es6_tilt'
Rails.application.assets.register_engine '.jsx', Es6Tilt
Rails.application.assets.register_engine '.es6', Es6Tilt