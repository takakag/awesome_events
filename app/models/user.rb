class User < ApplicationRecord
  before_destroy :check_all_events_finished

has_many :created_events, class_name: 'Event', foreign_key: :owner_id, dependent: :nullify
  has_many :tickets, dependent: :nullify
  has_many :participating_events, through: :tickets, source: :event

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
	 :omniauthable, omniauth_providers: [:twitter]

  def self.from_omniauth(auth)
	find_or_create_by(provider: ["provider"], uid: ["uid"]) do |user|
	  user.provider = auth["provider"]
	  user.uid = auth["auth"]
	  user.username = auth["info"]["nickname"]
	  user.image_url = auth["info"]["image"]
	end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
	new(session["devise.user_attributes"]) do |user|
	  user.attributes = params
	end
    else
	super
    end 
  end

  private

  def check_all_events_finished
    now = Time.zone.now
    if created_events.where(':now < end_time', now: now).exists?
	errors[:base] << '公開中の未終了イベントが存在します。'
    end

   if participating_events.where(':now < end_time', now: now).exists?
	errors[:base] << '未終了の参加イベントが存在します。'
   end
   
   errors.blank?
  end
end
