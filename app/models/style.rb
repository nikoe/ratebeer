class Style < ActiveRecord::Base

  has_many :beers, dependent: :destroy

end
