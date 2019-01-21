# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createProduct, function: Resolvers::CreateProduct.new
  #field :purchase, function: Resolvers::PurchaseProduct
end
