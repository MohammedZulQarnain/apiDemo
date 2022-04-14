# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create([
  { 
    name: 'Pixel 6',
    brand: 'Google',
    price:'59000',
    description: 'Mobile for daily purpose'
  },
  { name: 'Mac Book pro',
    brand:'Apple',
    price: '240000',
    description: 'PC'
  }
  ])
#   Character.create(name: 'Luke', movie: movies.first)
