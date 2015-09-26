require 'spec_helper'

describe :user do
  include_context 'shared config'
  
  subject(:create_user) {
    VCR.use_cassette('user/create') do
    end
  }
end