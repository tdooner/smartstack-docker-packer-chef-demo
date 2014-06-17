include_recipe 'app_role::environment'
include_recipe 'smartstack::synapse'

gem_package 'unicorn'

%w[app.rb config.ru unicorn.rb].each do |file|
  cookbook_file file do
    path "/home/tom/#{file}"
    user 'tom'
    group 'tom'
  end
end
