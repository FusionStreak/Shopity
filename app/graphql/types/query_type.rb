# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    Types::QueryType = GraphQL::ObjectType.define do
      name 'Query'

      # queries are just represented as fields
      field :allProducts, !types[Types::ProductType] do
        # resolve would be called in order to fetch data for that field
        resolve ->(_obj, _args, _ctx) { Product.all }
      end
    end
  end
end
