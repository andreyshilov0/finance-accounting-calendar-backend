module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    def current_user
      @current_user ||= context[:current_user]
    end

    def execution_error(message)
      GraphQL::ExecutionError.new(message)
    end
  end
end
