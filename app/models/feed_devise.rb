class FeedDevise
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :password, type: String
  field :location, type: String
  field :questionnaires, type: Array
  field :owner_id, type: BSON::ObjectId

  belongs_to :owner, :inverse_of => :feed_devises

  validates_presence_of :name, :password

end