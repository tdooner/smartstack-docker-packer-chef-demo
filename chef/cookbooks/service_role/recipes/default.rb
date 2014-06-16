include_recipe 'app_role::environment'
include_recipe 'smartstack::nerve'

cookbook_file 'app.rb' do
  path '/home/tom/app.rb'
  user 'tom'
  group 'tom'
end
