# frozen_string_literal: true

class Resolvers::CreateUser < GraphQL::Function
  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignup'

    argument :email, Types::AuthEmailInput
  end

  argument :name, !types.String
  argument :authProvider, !AuthProviderInput

  type Types::UserType

  def call(_obj, args, _ctx)
    User.create!(
            name: args[:name],
            email: args[:authProvider][:email][:email],
            password: args[:authProvider][:email][:password]
    )
  end
end
