require 'rails_helper'

describe 'ログインする' do
  context 'トップページに遷移し、ログインしたとき' do
    context 'かつログインに成功したとき' do
      before do
        visit root_path
	#OmniAuth.config.test_mode = true
	click_link 'twitterからログイン'
=begin
	OmniAuth.config.mock_auth[:twitter] = {
		"uid" => "nil",
		"provider" => "twitter",
		"info" => {
			"nickname" => "LlkRy38",
			"image_url" => "http://pbs.twimg.com/profile_images/952288848783933441/8JNiNtCc_normal.jpg/image1.jpg"
		}
	}
	visit user_twitter_omniauth_authorize_path
=end
	
#	session = Capybara::sesssion.new(@user)
       fill_in 'user_email', with:'takashi0718k@gmail.com'
       fill_in 'user_password', with:'031526'
       click_on 'ログイン'
#	visit user_twitter_omniauth_authorize_path
#
#	visit root_path
	visit user_session_path
#=end
     end

      it 'トップページに遷移していること' do
	expect(page).to eq root_path
      end

      it '"ログインしました"と表示される' do
	expect(page).to have_content 'ログインしました'
      end
    end
  end
end

