require_relative '../../lib/es6_tilt'
require 'sprockets'
  
Sprockets.register_engine '.jsx', Es6Tilt
Sprockets.register_engine '.es6', Es6Tilt
