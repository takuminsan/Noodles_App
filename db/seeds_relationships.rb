users = User.all.to_a
users.permutation(2) do |user1, user2|
  user1.follow(user2)
end
