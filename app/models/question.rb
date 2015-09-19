class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :qText, type: String
  field :lang, type: String, default: 'US'
  field :qType, type: String
  field :owner_id, type: BSON::ObjectId
  field :qAns, type: String # Array
  QTypeDropdown = [['Radio', 'radio'], ['Checkbox', 'checkbox'], ['Grid', 'grid']]

  belongs_to :owner, :inverse_of => :questions

  validates_presence_of :qText, :qType, :qAns
  
end
