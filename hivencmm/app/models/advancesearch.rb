class Advancesearch < ApplicationRecord
  
  def advancesearch_hive_informations
    
    hive_informations = HiveInformation.all
    
    hive_informations = hive_informations.where(["title LIKE?","%#{title}%"])
    hive_informations = hive_informations.where(["description LIKE?","%#{description}%"])
   
    hive_informations = hive_informations.where(["responsible LIKE?","%#{responsible}%"])
   
    hive_informations = hive_informations.where(["note LIKE?","%#{note}%"])
   
    hive_informations = hive_informations.where(["solution LIKE?","%#{solution}%"])
    hive_informations = hive_informations.where(["category_id LIKE?","%#{category_id}%"])

  
   
    return hive_informations
  end
end
