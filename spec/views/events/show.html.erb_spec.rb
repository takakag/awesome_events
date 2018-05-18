require 'rails_helper'

RSpec.describe "events/show", type: :view do
  context '未ログインユーザーがアクセスしたとき' do
    before do
      def view.logged_in?
      end

      def view.current_user
      end

      allow(view).to receive(:logged_in?) { false }
      allow(view).to receive(:current_user) { nil }
    end

    context 'かつ　@event.ownerがnilのとき' do
      before do
        assign(:event, FactoryBot.build_stubbed(:event, owner: nil))
        assign(:tickets, [])
      end
  
      it '"退会したユーザーです"と表示されていること' do
        render
        expect(rendered).to match /退会したユーザーです。/
      end
      
    end
  end
end
