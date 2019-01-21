# frozen_string_literal: true

require 'search_object/plugin/graphql'

class Resolvers::ProductsSearch
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)
  # include SearchObject for GraphQL
  scope { Product.all }
  # include SearchObject for GraphQL
  type !types[Types::ProductType]

  # inline input type definition for the advance filter
  ProductFilter = GraphQL::InputObjectType.define do
    name 'ProductFilter'

    argument :OR, -> { types[ProductFilter] }
    argument :title_contains, types.String
    argument :in_stock, types.Boolean
  end

  option :filter, type: ProductFilter, with: :apply_filter

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

  def normalize_filters(value, branches = [])
    scope = Product.all
    scope = scope.where('title LIKE ?', "%#{value['title_contains']}%") if value['title_contains']
    scope = scope.where('inventory_count > 0', value['in_stock']) if value['in_stock']

    branches << scope

    value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end
