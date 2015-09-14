module ApplicationHelper
  ActionView::Base.default_form_builder = CustomFormBuilder

  def t_column(model_name, column_name)
    I18n.t column_name, scope: [:activerecord, :attributes, model_name]
  end
end
