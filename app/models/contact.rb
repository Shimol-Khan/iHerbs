class Contact < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :message
end
