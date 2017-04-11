class Comment < ApplicationRecord
  belongs_to :info
  belongs_to :person
  
end
