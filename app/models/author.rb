class Author < ActiveRecord::Base

  has_and_belongs_to_many :items

  public
  def comics
    self.items.where(type:'Comic')
  end

end
