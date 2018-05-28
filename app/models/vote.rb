class Vote < ApplicationRecord
  belongs_to :link, optional: true # or validate: true if error. 
  belongs_to :user, optional: true
end
