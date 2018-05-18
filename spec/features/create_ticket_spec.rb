require 'rails_helper'

describe 'ユーザーがイベント参加表明をする', js: true do
  let(:event) { FactoryBot.create(:event) }
    context 'ログインユーザーが、イベント詳細ページで"参加する"をクリックしたとき' do
      before do
	visit new_user_session_path
	fill_in "Eメール", with: 'takashi0718k@gmail.com'
	fill_in "パスワード", with: '031526'
	click_on 'ログイン'
	visit event_path(event)
	click_on '参加する'
      end

      it 'コメント入力用のモーダルウインドウが表示されていること' do
	expect(page.find('#createTicket')).to be_visible
      end

    context 'かつ、コメントを入力し、"送信"ボタンを押したとき' do
      before do
	fill_in 'ticket_comment', with: '参加します'
	click_button '送信'
      end

      it '"このイベントに参加表明しました"と表示されていること' do
	expect(page).to have_content('このイベントに参加表明しました')
      end

      it '参加表明したユーザー名が表示されていること' do
	expect(page).to have_content('@netwillnet')
      end
    end
  end
end
