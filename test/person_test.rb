setup { Person.new }
test  { |person| assert person.respond_to?(:reset_name_to_default!) }
test  { |person| assert person.respond_to?(:name_contrived?) }
test  { |person| assert person.respond_to?(:clear_name) }
test  { |person| assert person.respond_to?(:name) }
test  { |person| assert person.respond_to?(:attributes) }
test  { |person| assert person.name.nil? }


setup { Person.new(name: 'Levi') }
test  { |person| assert person.name == 'Levi' }


setup { Person.new(name: 'Cook') }
test  { |person| assert person.name == 'Cook' }
