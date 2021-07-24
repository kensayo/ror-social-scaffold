# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def self.requested?(request_id)
    where(friend_id: request_id).exists?
  end

  def self.requested(request_id)
    where(friend_id: request_id)
  end
end
