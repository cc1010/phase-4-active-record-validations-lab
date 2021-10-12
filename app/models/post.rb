class Post < ApplicationRecord
   validates :title, presence: true
   validates :content, length: { minimum: 250 }
   validates :summary, length: { maximum: 250 }
   validates :category, inclusion: ['Fiction', 'Non-Fiction']
   

   validate :title_include


   def title_include
      unless title.present? && (title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top [number]") || title.include?("Guess"))
        errors.add :title, "Need a title"
      end
    end
   
end
