#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


items_list = [
    [ "тестова річ 23", 'аіваіа', 12, 'http://placehold.it/500x500&text=Logo' ],
    [ "тестова річ 21", 'івавіа', 23, 'http://placehold.it/500x500&text=Logo' ],
    [ "тестова річ 20", 'іаіав', 23.45, 'http://placehold.it/500x500&text=Logo' ],
    [ "тестова річ 24", 'іаіаів', 45.30, 'http://placehold.it/500x500&text=Logo' ],
    [ "тестова річ 27", 'іваі', 13, 'http://placehold.it/500x500&text=Logo' ],
    [ "тестова річ 34", 'іваіаіа', 34.56, 'http://placehold.it/500x500&text=Logo' ],
    [ "тестова річ 12", '5435', 26.67, 'http://placehold.it/500x500&text=Logo' ],
    [ "тестова річ 13", '345345', 56.21, 'http://placehold.it/500x500&text=Logo' ]
]

items_list.each do |item|
  Item.create(title: item[0], description: item[1], price: item[2], image_url: item[3])
end
