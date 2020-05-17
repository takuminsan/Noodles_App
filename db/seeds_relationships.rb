10.times do |n|
  users = User.all
  user  = users.find(n+1)
  following = users[0..9]
  following.shift(n+1)
  followers = users[0..9]
  followers.shift(n+1)
  following.each { |followed| user.follow(followed) }
  followers.each { |follower| follower.follow(user) }
end