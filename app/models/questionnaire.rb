class Questionnaire
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :desc, type: String
  field :owner_id, type: BSON::ObjectId
  field :questions, type: Array

  embedded_in :owner, :inverse_of => :questionnaires
end
