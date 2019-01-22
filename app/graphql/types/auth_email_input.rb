# frozen_string_literal: true

Types::AuthEmailInput = GraphQL::InputObjectType.define do
  name 'AUTH_EMAIL'

  argument :email, !types.String
  argument :password, !types.String
end
