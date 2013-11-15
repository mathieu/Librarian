# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Author < ActiveRecord::Base

  has_and_belongs_to_many :items

  public
  def comics
    self.items.where(type:'Comic')
  end

end
