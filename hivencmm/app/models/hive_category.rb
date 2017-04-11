class HiveCategory < ApplicationRecord

  scope :is_active, -> {
    
   where(is_active: true)
 }
 
 scope :is_inactive, -> {
   
  where(is_active: false)
}


end
