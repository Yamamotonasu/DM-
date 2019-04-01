class Message < ApplicationRecord
  validates :content, presence: true #無記入投稿とエンター二度押しの防止
  after_create_commit {MessageBroadcastJob.perform_later self}
end
