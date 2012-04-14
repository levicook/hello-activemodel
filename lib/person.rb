class Person
  include ActiveModel::AttributeMethods

  attribute_method_affix  :prefix => 'reset_', :suffix => '_to_default!'
  attribute_method_suffix '_contrived?'
  attribute_method_prefix 'clear_'
  define_attribute_methods ['name']

  attr_accessor :name

  def initialize(attrs=defaults)
    self.attributes= attrs
  end

  def attributes= attrs
    defaults.merge(attrs).each { |k, v| send("#{k}=", v) }
  end

  def attributes
    { name: name
    }.stringify_keys
  end

  private

  def defaults
    { name: 'Default Name'
    }.stringify_keys
  end

  def attributes= attrs
    attrs.each { |k, v| send("#{k}=", v) }
  end

  def attribute_contrived?(attr)
    true
  end

  def clear_attribute(attr)
    send("#{attr}=", nil)
  end

  def reset_attribute_to_default!(attr)
    send("#{attr}=", defaults[attr])
  end
end
