# encoding: utf-8

u = User.new({ :email => "pablo.lluch@gmail.com", :first_name => 'Pablo', :last_name => 'Lluch', :api_token => '7fe946eb6edcea2a3efbda312c4a983702b15fea',
	:created_at => Time.now, :updated_at => Time.now })
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.admin = true
u.id = 40648
u.save

u = User.new({ :email => "pochsenius@gmail.com", :first_name => 'Paula', :last_name => 'Ochsenius', :api_token => 'e7cb1565c1eeae44cf7ca3edcaaa9ae0d4909696',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.id = 40654
u.admin = false
u.save

u = User.new({ :email => "joaquin.zavala@gmail.com", :first_name => 'Joaquin', :last_name => 'Zavala', :api_token => 'a55e4d297c69948232b42c4bb5f019e3e1a2a5c7',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.admin = false
u.id = 40655
u.save

u = User.new({ :email => "benjafellc@gmail.com", :first_name => 'Benjamín', :last_name => 'Fell', :api_token => '171a0b7382438566407b65157417815606b3ec58',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.admin = false
u.id = 40650
u.save

u = User.new({ :email => "jpgiordanolorca@gmail.com", :first_name => 'Juan Pablo', :last_name => 'Giordano', :api_token => 'fcb2d2e3efbaaf732060d0aca06498d492ddc5f6',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.id = 40652
u.admin = false
u.save

u = User.new({ :email => "vicentebascunan@gmail.com", :first_name => 'Vicente', :last_name => 'Bascunan', :api_token => 'feb316f1eeaff84bea8df673c1c214bf68474a7c',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.admin = false
u.id = 40649
u.save

u = User.new({ :email => "arturonatho@gmail.com", :first_name => 'Arturo', :last_name => 'Natho', :api_token => '3d12b5c78ea1feaaa7c5f18d1a952765ee299b1e',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.admin = false
u.id = 40653
u.save

u = User.new({ :email => "mjotaiza@gmail.com", :first_name => 'Jose', :last_name => 'Otaiza', :api_token => 'c7c1200efcebcc4e903b38923700d3437714774d',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.id = 39957
u.admin = false
u.save

u = User.new({ :email => "ygoldfrid@gmail.com", :first_name => 'Yaniv', :last_name => 'Goldfrid', :api_token => '88e831e3f9fdbec6a1991ffaf8d5f7c890437fc8',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.id = 40633
u.admin = false
u.save

u = User.new({ :email => "icfuenza@gmail.com", :first_name => 'Ignacio', :last_name => 'Fuenzalida', :api_token => 'd987ba11b51937fa5bd6b0284e4e79cb0dd63827',
	:created_at => Time.now, :updated_at => Time.now})
u.password_digest = "$2a$10$4H4E5tdoLdQFUR6BHWgQVuZIjq/GbFWhQVFw4z8fnEkHkXk0XEyDG"
u.password = "grupo5"
u.password_confirmation="grupo5"
u.id = 40651
u.admin = false
u.save

p = Project.new({ :name => "Grupo5", :type => "Project", :url => "https://iic215420132.kanbanery.com/projects/39793",
	:created_at => Time.now, :updated_at => Time.now})
p.id = 39793
p.save