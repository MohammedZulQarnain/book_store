# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.create([
  {
    publisher: "Learn Enough",
    title: "Ruby on Rails Tutorial",
    author_last_name: "Hartl",
    author_first_name: "Michael",
    price: "2000",
    sub_title: "Awesome subtitle",
    publication_date: "2022-02-16",
    no_of_pages: 100,
    volume_no: 2,
    url: "https://awesomeurl.com"
  },
  {
    publisher:"No Starch Press",
    title:"Understanding ECMAScript 6",
    author_last_name: "Zakas",
    author_first_name: "Nicholas C.",
    price: "2345.63",
    sub_title: "Awesome subtitle 2",
    publication_date: "2022-02-03",
    no_of_pages: 200,
    volume_no: 3,
    url: "https://awesomeurl.com"
  },
  {
    publisher:"O'Reilly Media",
    title:"Speaking JavaScript",
    author_last_name: "Rauschmayer",
    author_first_name: "Axel",
    price: "1150",
    sub_title: "Awesome subtitle 3",
    publication_date: "2022-08-25",
    no_of_pages: 150,
    volume_no: 4,
    url: "https://awesomeurl.com"
    
  },
  {
    publisher: "Atlantic publishers and distributors",
    title:"Rails – Novice to Ninja",
    author_last_name:"Goodrich",
    author_first_name: "Gleen",
    price: "2495.39",
    sub_title: "Awesome subtitle 4",
    publication_date: "2022-11-16",
    no_of_pages: 100,
    volume_no: 2,
    url: "https://awesomeurl.com"
    }
  ])
