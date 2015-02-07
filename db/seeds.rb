# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Preference.create(:name=>"WhatsApp",:enable=>"1",:order=>0)
Preference.create(:name=>"Text Messages",:enable=>"1",:order=>0)
Preference.create(:name=>"Phone Calls",:enable=>"1",:order=>0)
Preference.create(:name=>"Emails",:enable=>"1",:order=>0)
