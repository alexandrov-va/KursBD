# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Client.create(lastname: 'Alexandrov', firstname: 'Vladimir', patronymic: 'Alexeevich', passport: 6666, address: 'Gagarin', phonenumber: '88005553535')
Client.create(lastname: 'Rodnin', firstname: 'Yaroslav', patronymic: 'Vladimirovich', passport: 3333, address: 'Samara', phonenumber: '89998887766')
Client.create(lastname: 'Grinch', firstname: 'Fox', patronymic: 'Igorevich', passport: 2222, address: 'Mytischi', phonenumber: '81112223344')
Client.create(lastname: 'Tea', firstname: 'Soldier', patronymic: 'Tea', passport: 1111, address: 'Moscow', phonenumber: '81234567890')
Client.create(lastname: 'Queenston', firstname: 'Renard', patronymic: 'Renard', passport: 4444, address: 'Canada', phonenumber: '7527528587')
Client.create(lastname: 'Shark', firstname: 'Mayhem', patronymic: 'Mayhem', passport: 5555, address: 'USA', phonenumber: '520955523890')

Employee.create(lastname: "Sidorov", firstname: "Ivan", patronymic: "Petrovich")
Employee.create(lastname: "Schukin", firstname: "Sergey", patronymic: "Vladimirovich")
Employee.create(lastname: "Pavlova", firstname: "Kristina", patronymic: "Viktorovna")

Route.create(country: "France", duration: 3, cost: 25000)
Route.create(country: "Great Britain", duration: 7, cost: 35000)
Route.create(country: "Germany", duration: 5, cost: 32000)

Group.create(travel_date: DateTime.new(2015, 12, 20), employee_id: 1, route_id: 1)
Group.create(travel_date: DateTime.new(2015, 11, 30), employee_id: 2, route_id: 2)
Group.create(travel_date: DateTime.new(2015, 12, 1), employee_id: 3, route_id: 3)
