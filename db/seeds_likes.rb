1.upto(18) do |n|
  user = User.find(n)
  posts = Post.order("RAND()").limit(20)
  posts.each { |post| post.like(user) }
end
