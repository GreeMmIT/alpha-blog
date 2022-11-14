class Category < ApplicationRecord
  validates :name, presence: true, length:  { minimum:3, maximum:25   }#validazioni controllo presenza valore
  validates_uniqueness_of :name #@controllo univocità 

  has_many :article_categories
  has_many :articles, through: :article_categories
  

end 
