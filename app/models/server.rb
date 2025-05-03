class Server < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :channel, class_name: "Server::Channel", foreign_key: "server_id"
end
