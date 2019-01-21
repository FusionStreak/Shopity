# frozen_string_literal: true

require 'search_object/plugin/graphql'

class Resolvers::ProductsSearch
  include SearchObject.module(:graphql)

  scope {Product.all}

  type !types[]
end
