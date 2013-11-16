# == Schema Information
#
# Table name: loans
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  returned   :boolean
#  item_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Loan < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  # define some scopes
  scope :pending, -> {where(returned: false)}
  scope :finished, -> {where(returned: true)}
end
