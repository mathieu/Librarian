# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  title         :string(255)
#  registered    :date
#  available     :boolean
#  created_at    :datetime
#  updated_at    :datetime
#  isbn          :string(13)
#  collection_id :integer
#  cover         :string(255)
#  author_names  :string(255)
#

class Item < ActiveRecord::Base

  belongs_to :collection
  has_many :loans
  has_and_belongs_to_many :authors

  # Mounter for cover
  mount_uploader :cover, CoverUploader
end
