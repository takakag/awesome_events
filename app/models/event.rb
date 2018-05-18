class Event < ApplicationRecord
  mount_uploader :event_image, EventImageUploader

  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: 'User'

  validates :name, length: { maximum: 50 }, presence: true
  validates :place, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true



  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

  def self.ransackable_attributes(auth_object = nil)
    %w(name start_time)
  end

  def self.ransackable_associations(auth_object = nil )
    []
  end


end
