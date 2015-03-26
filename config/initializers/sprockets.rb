require_relative '../../lib/es6_tilt'
require 'sprockets'
  
Sprockets.register_engine '.jsx', Es6Tilt::ES6Transformer
Sprockets.register_engine '.es6', Es6Tilt::ES6Transformer
