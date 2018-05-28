class Resolvers::CreateLink < GraphQL::Function
  # arguments passed as "args"
  argument :description, !types.String
  argument :url, !types.String

  # return type from the mutation
  type Types::LinkType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context
  def call(_obj, args, ctx) # Be sure to remove the _ctx since the variable is now in use:
    Link.create!(
      description: args[:description],
      url: args[:url],
      user: ctx[:current_user]
    )
  end
end
