# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([ 
	{ :name => 'Paula', :last_name => 'Ochsenius', :api_token => 'e7cb1565c1eeae44cf7ca3edcaaa9ae0d4909696'},
	{ :name => 'Joaquin', :last_name => 'Zavala', :api_token => 'a55e4d297c69948232b42c4bb5f019e3e1a2a5c7' },
	{ :name => 'Benjamin', :last_name => 'Fell', :api_token => '171a0b7382438566407b65157417815606b3ec58' },
	{ :name => 'Ignacio', :last_name => 'Fuenzalida', :api_token => 'd987ba11b51937fa5bd6b0284e4e79cb0dd63827'},
	{ :name => 'Pablo', :last_name => 'Lluch', :api_token => '7fe946eb6edcea2a3efbda312c4a983702b15fea' },
	{ :name => 'Juan Pablo', :last_name => 'Giordano', :api_token => 'fcb2d2e3efbaaf732060d0aca06498d492ddc5f6' },
	{ :name => 'Vicente', :last_name => 'Bascunan', :api_token => 'feb316f1eeaff84bea8df673c1c214bf68474a7c' },
	{ :name => 'Arturo', :last_name => 'Natho', :api_token => '3d12b5c78ea1feaaa7c5f18d1a952765ee299b1e' },
	{ :name => 'Jose', :last_name => 'Otaiza', :api_token => 'c7c1200efcebcc4e903b38923700d3437714774d' },
	{ :name => 'Yaniv', :last_name => 'Goldfrid', :api_token => '88e831e3f9fdbec6a1991ffaf8d5f7c890437fc8' }

])