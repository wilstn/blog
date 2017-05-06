require 'ffaker'

20.times do
  Blog.create(
                title: FFaker::Movie.title ,
                author: FFaker::Name.name,
                category: FFaker::Book.genre,
                post: FFaker::Book.description
              )
end
