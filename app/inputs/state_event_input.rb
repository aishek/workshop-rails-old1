class StateEventInput < SimpleForm::Inputs::CollectionInput
  def input(wrapper_options = nil)
    object = @builder.object.is_a?(Reform::Form) ? @builder.object.model : @builder.object
    collection = object.state_events
    @builder.select attribute_name, collection, input_options
  end
end
