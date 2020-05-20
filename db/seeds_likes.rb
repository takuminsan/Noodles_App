11.times do |n|
  user  = User.find(n+1)
  posts = Post.order("RAND()").limit(10)
  posts.each { |post| post.like(user) }
end
