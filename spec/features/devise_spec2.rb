require 'rails_helper'

RSpec.feature '...', type: :feature do
	include Devise::Test::IntegrationHelpers

	given(:current_user) { create :user}

	before do
		sign_in current_user
		visit sesstion
	end

	scenario 'ログインした後、トップページに遷移する' do
		expect(page).to eq root_path
	end
	
	scenario '"ログインしました"と表示する' do
		expect(page).to have_content 'ログインしました'
	end
end
