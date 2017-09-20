require 'spec_helper'
describe 'base_network' do

  context 'with defaults for all parameters' do
    it { should contain_class('base_network') }
  end
end
