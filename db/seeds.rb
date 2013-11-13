# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


#######################
# Create User's roles #
#######################
if Role.where(name:'registered').blank?
  Role.create(name:'registered')
end

if Role.where(name:'admin').blank?
  Role.create(name:'admin')
end


################
# Create admin #
################
if User.where(email:'admin@librarian.fr').blank?
  User.create(email: 'admin@librarian.fr', password: 'password', role_id: Role.find_by_name('admin').id)
end

Comic.create()