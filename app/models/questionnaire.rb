class Questionnaire
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :desc, type: String
  field :owner_id, type: BSON::ObjectId
  field :questions, type: Array

  belongs_to :owner, :inverse_of => :questionnaires
end
