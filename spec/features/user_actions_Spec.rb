require 'rails_helper'

#RSpec.
feature "UserActions", :type => :feature do

  context "ログインボタンを押した時" do
#    before do
     before(:each){
	user = create(:user)
	login_as(user, :scope => :user)
	}	
=begin
	vist new_user_session_path
	fill_in "Eメール", with: "takashi0718k@gmail.com"
	fill_in "パスワード", with: '031526'
	click_on "ログイン"
=end
#    end
  scenario "ログインボタンを押すとroot_pathに遷移する" do
	expect(page).to eq root_path
  end

  scenario '"ログインしました"と表示されること' do
	expect(page).to have_content 'ログインしました'
  end
  end
end
