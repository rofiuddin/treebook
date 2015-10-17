class Status < ActiveRecord::Base
  #attr_accessible :content, :user_id
  belongs_to :user

  validates :content, presence: true, #part of activeRecord validation
                      length: {minimum: 2}
  validates :user_id, presence: true #part of activeRecord validation
end
