Refinery::Admin::PagesController.class_eval do

  protected

  def valid_layout_templates
    Refinery::Themes::Theme.layouts
  end

  def valid_view_templates
    Refinery::Themes::Theme.templates
  end
end
