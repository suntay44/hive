class Info < ApplicationRecord
  has_many :comments
  
   self.table_name = "infos"
    
   
   scope :is_active, -> {
     
    where(is_active: true)
  }
  
  scope :is_inactive, -> {
    
   where(is_active: false)
 }
  scope :is_admin, -> {
    
   where(is_admin: true)
 }
 def self.import(file)

   CSV.foreach(file.path, headers: true) do |row|
     Info.create! row.to_hash 
     flash[:notice] = "Successfully Imported a CSV file."
     
   end
   
   
 end
 
 
  def self.searchh(search)
  
    where(["title LIKE ? or description LIKE ? or solution LIKE ?  or responsible LIKE ? or note LIKE ?","%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%"])
    
   
  end
 
 
  def self.advancesearchz(atitle,adescription, aresponsible,asolution,anote)
    if atitle.present?
      where(["title LIKE ?", "%#{atitle}%"])
 
    elsif adescription.present?
      where(["description LIKE ?", "%#{adescription}%"])
   
      elsif aresponsible.present?
      where(["responsible LIKE ?", "%#{aresponsible}%"])
    
      elsif asolution.present?
      where(["solution LIKE ?", "%#{asolution}%"])
   
      elsif anote.present?
      where(["note LIKE ?", "%#{anote}%"])
      
      
    else
      
      all
  end
end
 
end
