require 'active_model_serializers'

require "api_monkey/engine"

module ApiMonkey
  mattr_accessor :parent_controller
  @@parent_controller = 'ApplicationController'

  def self.configure
    yield self
  end
end
