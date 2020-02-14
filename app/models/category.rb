class Category < ApplicationRecord
   has_many :sub_categories, :class_name => "Category", :foreign_key => "parent_category_id"

   belongs_to :category, :class_name => "Category", optional: true
end
