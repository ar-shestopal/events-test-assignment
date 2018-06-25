require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:start) }
    it { should validate_presence_of(:end) }

    context '#datetime' do
      it 'should not be valid with invalid datetime fields' do
        expect(build(:event, start: 'Blah')).not_to be_valid
      end

      it 'should not be valid with invalid end' do
        expect(build(:event, end: 'Blah')).not_to be_valid
      end
    end
  end
end
