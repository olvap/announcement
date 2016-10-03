class Ad < ActiveRecord::Base
  validates_uniqueness_of :tid
end

