class Person
  include ActiveModel::AttributeMethods

  attribute_method_affix  :prefix => 'reset_', :suffix => '_to_default!'
  attribute_method_suffix '_contrived?'
  attribute_method_prefix 'clear_'
  define_attribute_methods ['name']

  def initialize(attrs={})
    self.attributes= attrs
  end

  attr_accessor :name

  def attributes
    { 'name' => self.name }
  end

  def attributes= attrs
    attrs.each { |k, v| send("#{k}=", v) }
  end

  private

  def attribute_contrived?(attr)
    true
  end

  def clear_attribute(attr)
    send("#{attr}=", nil)
  end

  def reset_attribute_to_default!(attr)
    send("#{attr}=", "Default Name")
  end
end
