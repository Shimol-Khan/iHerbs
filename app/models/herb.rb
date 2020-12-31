class Herb < ApplicationRecord
  belongs_to :user

  validates_presence_of :name, :description, :usage, :image_link
end
