require 'rails_helper'

def json
  JSON.parse(response.body) if response.body
end
