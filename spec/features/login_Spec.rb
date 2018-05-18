require 'rails_helper'

#describe 'ユーザーがイベントの参加や登録を行うために、ログインする' do
#  context 'トップページに遷移し、eメールとパスワードを入力し、"ログイン"をクリックしたとき' do
#    context 'かつログインに成功したとき' do
#      before do
#        visit user_session_path
#        fill_in 'Eメール', with: 'takashi0718k@gmail.com'
#        fill_in 'パスワード', with: '031526'
#	first("div.field > input[type='email']").set('takashi0718k@gmail.com')
#	first("div.field > input[type='password']").set('031526')
#        fill_in 'Eメール', with: 'takashi0718k@gmail.com'
#       page.fill_in 'パスワード（確認用）', with: '031526'
#        click_on 'ログイン'
#      end
#RSpec.feature '...', type: :feature do
describe '...',type: :feature do
	context 'ログイン後' do
		include_examples :sign_in
		
		before do
#			session=Capybara::Session.new(:culerity)
#		  expect(page).to be root_path
			visit root_path
		end
		  
		scenario '...' do
			expect(page).to eq root_path
		end

#		scenario 'トップページに遷移していること' do
#			expect(page).to eq root_path
#		end

		scenario '"ログインしました"と表示されること' do
			expect(page).to have_content 'ログインしました'
		end
	end
end
=begin
RSpec.describe OmniauthCallbacksController, :type => :controller do
	describe "ユーザーがイベントの参加や登録を行うために、ログインする" do
	before do
#		login_user user
		@request.env['devise.mapping'] = Devise.mappings[:user]
	        visit "users/sign_in"
       	 	fill_in 'Eメール', with: 'takashi0718k@gmail.com'
        	fill_in 'パスワード', with: '031526'
		click_on 'ログイン'
#		@user = FactoryBot.create(:user, password: '031526', email: 'takashi0718k@gmail.com' )

	end

      it 'トップページに遷移していること' do
#	expect(page).to have_field 'パスワード', '031526'
#        expect(current_path).to eq root_path
#	post :create, user: { password: '031526', email: 'takashi0718k@gmail.com' }

	expect(controller.user_signed_in?).to be true
	expect(controller.current_user.email).to eq "takashi0718k@gmail.com"
      end

      it '"ログインしました"と表示されること' do
        expect(controller.user_signed_in?).to have_content 'ログインしました' 
      end
   	end
end
=end
