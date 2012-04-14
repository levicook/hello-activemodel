
setup { Person.new }
test { |p| assert p.respond_to? :reset_name_to_default! }
test { |p| assert p.respond_to? :name_contrived?        }
test { |p| assert p.respond_to? :clear_name             }
test { |p| assert p.respond_to? :name                   }
test { |p| assert p.respond_to? :attributes             }
test { |p| assert p.name == 'Default Name'              }
test { |p|
  p.clear_name             ; assert p.name == nil
  p.reset_name_to_default! ; assert p.name == 'Default Name'
}


setup { Person.new(name: 'Levi') }
test { |p| assert p.name == 'Levi' }
test { |p| assert p.attributes == { 'name' => 'Levi' }}


setup { Person.new(name: 'Cook') }
test { |p| assert p.name == 'Cook' }
test { |p| assert p.attributes == { 'name' => 'Cook' }}

