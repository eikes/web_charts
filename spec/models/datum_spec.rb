require 'rails_helper'

RSpec.describe Datum, type: :model do
  let!(:datum) { Fabricate(:datum, value: 1, label: 'fire', color: 'red') }

  describe 'validations' do
    it 'creates a new instance of a user given valid attributes' do
      expect(datum).to be_valid
    end

    it 'is invalid without data' do
      datum.value = nil
      expect(datum).not_to be_valid
    end
  end
end
