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

if Collection.where(title:'Les Gouttes de Dieu').blank?
  Collection.create( title:'Les Gouttes de Dieu')
end

if Comic.where(isbn:'9782723463409').blank?
  Comic.create( title:'Les Gouttes de Dieu 1', author:'Tadashi AGI & Shu OKIMOTO', isbn: '9782723463409',
                registered:'2012/05/13', available: true, collection_id: Collection.find_by_title('Les Gouttes de Dieu').id)
end


if Comic.where(isbn:'9784063724356').blank?
  Comic.create( title:'Les Gouttes de Dieu 2', author:'Tadashi AGI & Shu OKIMOTO', isbn: '9784063724356',
                registered:'2012/05/13', available: true, collection_id: Collection.find_by_title('Les Gouttes de Dieu').id)
end

if Comic.where(isbn:'9782858151257').blank?
  Comic.create( title:'Soeur Marie-Thérèse des Batignoles', author:'Maëster', isbn: '9782858151257',
                registered:'2011/04/13', available: true)
end

