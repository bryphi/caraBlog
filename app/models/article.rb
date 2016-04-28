class Article < ActiveRecord::Base
    validates :title, presence: true, length: { minimum: 3}
    validates :description, presence: true, length: { minimum: 3} 
    validates :date, presence: true
    
    def self.search(search)
        where('tags LIKE ?', "%#{search}%")
    end
   
end 

