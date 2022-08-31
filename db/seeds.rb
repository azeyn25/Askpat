# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"

puts "cleaning database"

User.destroy_all
Tag.destroy_all
Post.destroy_all

User.create!(
  email: "expat@askpat.com",
  password: "654321"
  )

Tag.create(name: "Visa")
Tag.create(name: "Taxes")
Tag.create(name: "Inusrance")
Tag.create(name: "Translation")

post = Post.new(
  user: User.first,
  headline: "Help with the job centre application",
  description: "I am applying for the unempolyment money and I have recieved an application from the job centre by post, can anyone who have been in this process help me out please"
)
post.save!
post_tag = PostTag.new
post_tag.post = post
post_tag.tag = Tag.find_by(name: "Visa")
post_tag.save!

post = Post.new(
  user: User.first,
  headline: "I need help with freelance visa",
  description: " I have just received a freelance contract with a software development company and I need to renew my visa to freelance one, can some share theier experiences when it comes to freelance visa?"
)
post.save!
post_tag = PostTag.new
post_tag.post = post
post_tag.tag = Tag.find_by(name: "Visa")
post_tag.save!
post.save!

file = URI.open("app/assets/images/taxes.jpg")
Post.create(
  user: User.first,
  headline: "I need some help with translation",
  description: "I have just received this document from the taxes office and I would need someone to help me tranlsate it for me"
)

post.save!
post_tag = PostTag.new
post_tag.post = post
post_tag.tag = Tag.find_by(name: "Translation")
post_tag.save!
post.photo.attach(io: file, filename: 'taxes', content_type: 'image/jpeg')
