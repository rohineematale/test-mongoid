class Questionnaire
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :desc, type: String
  field :owner_id, type: BSON::ObjectId
  field :questions, type: Array
  field :display, type: Boolean, default: true

  belongs_to :owner, :inverse_of => :questionnaires

  validates_presence_of :name
end
