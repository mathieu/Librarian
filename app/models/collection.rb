# == Schema Information
#
# Table name: collections
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Collection < ActiveRecord::Base

  has_many :items
end
