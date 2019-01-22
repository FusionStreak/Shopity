# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :createProduct, function: Resolvers::CreateProduct.new
  #field :purchase, function: Resolvers::PurchaseProduct
  field :createUser, function: Resolvers::CreateUser.new
  field :signinUser, function: Resolvers::SignInUser.new
end
