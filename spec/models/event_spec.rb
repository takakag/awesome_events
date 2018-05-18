require 'rails_helper'

RSpec.describe Event, type: :model do
  describe '#created_by?' do
      let(:event) { FactoryBot.create(:event) }
      subject { event.created_by?(user) }
      
      context '引数がnilなとき' do
          let(:user) { nil }
          it { should be_falsey }
      end
      
      context '#owner_idと引数の#idが同じ時' do
          let(:user) { double('user', id: event.id) }
          it { should be_truthy }
      end
  end
end
