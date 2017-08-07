class Product < ApplicationRecord
    belongs_to :category
    belongs_to :brand

    has_many :assets

    def list
        Product.list(max:20)
    end
end
