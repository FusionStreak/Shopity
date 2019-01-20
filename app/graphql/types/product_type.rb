# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    name 'Product'
    field :id, !types.ID
    field :title, !types.String
    field :price, !types.Float
    field :inventory_count, !types.Int
  end
end
