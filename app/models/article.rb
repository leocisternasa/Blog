class Article < ApplicationRecord
   has_rich_text :content 
   belongs_to :user
   has_many :has_categories
   has_many :categories, through: :has_categories
   attr_accessor :category_elements

   def save_categories
    #category_elements 1,2,3
   
    #iterar ese arreglo
    category_elements.each do |category_id|
    #crear HasCategory quien relaciona article_id: 1, con category_id: 2 por ejempli
  
       HasCategory.find_or_create_by(article: self,category_id: category_id )
  
   end
  end
end
