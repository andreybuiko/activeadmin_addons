class SearchSelectFilterInput < SearchSelectInput
  include ActiveAdminAddons::FilterInput

  def load_control_attributes
    super
    load_data_attr(:width, default: "resolve")
  end

  def input_method
    eq_input_name
  end

  def method_model
    options[:model] || object_class.reflect_on_association(association_name).try(:klass) ||
    association_name.classify.constantize
  end
end
