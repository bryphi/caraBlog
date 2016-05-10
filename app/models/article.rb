class Article < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: { minimum: 3}
    validates :description, presence: true, length: { minimum: 3} 
    validates :date, presence: true
    validates :user_id, presence: true
    
    
    def self.search(param)
        return Article.none if param.blank?
        param.strip!
        param.downcase!
        (title_matches(param) + tags_matches(param)).uniq
    end
    
    def self.title_matches(param)
        matches('title', param)
    end
    
    def self.tags_matches(param)
        matches('tags', param)
    end
    
    def self.matches(field_name, param)
        where("lower(#{field_name}) like ?", "%#{param}%")
    end
   
end 

