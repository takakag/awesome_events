require 'rails_helper'

RSpec.describe Devise::OmniauthCallbacksController, type: :controller do
  describe 'twitterでログインを確認する' do
    subject {'確認したい値'}

    before do
	@request.env["devise.mapping"] = Devise.mappings[:user]
	@user = FactoryBot.create(:user,password: '031526', email: 'takashi0718k@gmail.com')
    end

    it '"ログイン後処理がうまくいったこと' do
      post :create, user: { password: '031526', email: 'takashi0718k@gmail.com' }

      expect(controller.user_signed_in?).to be true
#      expect(controller.current_user.email).to eq 'takashi0718k@gmail.com'
      expec(page).to eq root_path
    end
end
end


