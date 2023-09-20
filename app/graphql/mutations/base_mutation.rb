module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    def current_user
      @current_user ||= context[:current_user]
    end

    def execution_error(message)
      GraphQL::ExecutionError.new(message)
    end
  end
end
