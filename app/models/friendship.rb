class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.requested?(request_id)
    where(friend_id: request_id).exists?
  end

  def self.requested(request_id)
    where(friend_id: request_id)
  end

  def self.friends(request_id)
    my_friends = []
    friends = Friendship.where(user_id: request_id).or(Friendship.where(friend_id: request_id)).where(status: 1)
    friends.each do |users|
      if users.user_id != request_id
        my_friends.push(users.user_id)
      else
        my_friends.push(users.friend_id)
      end
    end
    my_friends
  end
end
