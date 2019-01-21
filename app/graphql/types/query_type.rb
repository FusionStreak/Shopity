# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  # queries are just represented as fields
  field :allProducts, !types[Types::ProductType] do
    # resolve would be called in order to fetch data for that field
    resolve ->(_obj, _args, _ctx) { Product.all }
  end
end
