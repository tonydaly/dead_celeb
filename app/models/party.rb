class Party < ActiveRecord::Base
  belongs_to :celebrity
  belongs_to :owner, class_name: 'User'
end
