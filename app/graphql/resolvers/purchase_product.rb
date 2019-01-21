# frozen_string_literal: true


class Resolvers::PurchaseProduct < GraphQL::Function


  argument :title, !types.String
  #argument :inventory_count, !types.Int

  type Types::ProductType

  def call(_obj, args, _ctx)
    Product.update!(
      title: args[:title],
      inventory_count: -1
    )
  end
end
