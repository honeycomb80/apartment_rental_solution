require 'pry'
require_relative 'building'
require_relative 'apartment'
require_relative 'tenant'
 
@building = nil
 
unless @building
    print "Build (b)uilding or (q)uit: "
else
    print "Build (p)erson or (a)partment or (b)uilding or (q)uit: "
end

response = gets.chomp.downcase
while response != 'q'
  if response == 'p'
    print "Name: "
    name = gets.chomp
    print "Age: "
    age = gets.to_i
    print "Gender: "
    gender = gets.chomp
    print "Which apartment does #{name} live in?\n"
    @building.apartments.each_key do |name|
      puts name
    end
    apt = gets.chomp
    @building.apartments[apt].renters << Tenant.new(name, age, gender)
  elsif response == 'a'
    print "Name: "
    name = gets.chomp
    print "SqFt: "
    sqft = gets.to_i
    @building.apartments[name] = Apartment.new(name, sqft, 0, 0)
  elsif response == 'b'
    @building = Building.new('10E21ST', 'GA', false, false, 10)
    print "Your building is #{@building.address} \n"
  end
  
  unless @building
    print "Build (b)uilding or (q)uit: "
  else
    print "Build (p)erson or (a)partment or (b)uilding or (q)uit: "
  end

  response = gets.chomp.downcase
end
 
