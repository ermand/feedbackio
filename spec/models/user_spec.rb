require 'rails_helper'

describe User do

  describe 'validations' do
    it 'user factory should create valid user' do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end
end