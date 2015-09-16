class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :qText, type: String
  field :lang, type: String
  field :qType, type: String
  field :o_id, type: BSON::ObjectId
  field :qAns, type: String # Array
  QTypeDropdown = [['Radio', 'radio'], ['Checkbox', 'checkbox'], ['Grid', 'grid']]
end
