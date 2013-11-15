require 'active_record'

db_namespace = namespace :db do

  desc "setup test db"
  task :testdb => [:environment, :load_config] do
    db_namespace['drop'].invoke
    db_namespace['migrate'].invoke
    db_namespace['fixtures:load'].invoke
      
    puts 'test DB setup !'
  end
end
