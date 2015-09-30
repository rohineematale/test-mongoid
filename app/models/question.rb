class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  field :qText, type: String
  field :lang, type: String, default: 'US'
  field :qType, type: String
  field :owner_id, type: BSON::ObjectId
  field :qAns, type: Array
  QTypeDropdown = [['Radio', 'radio'], ['Checkbox', 'checkbox'], ['Grid', 'grid']]

  attr_accessor :qAnsText

  belongs_to :owner, :inverse_of => :questions

  validates_presence_of :qText, :qType, :qAns

  before_validation :set_qAns

  def set_qAns
    self.qAns = []
    self.qAnsText.split(",").each_with_index do |val, index|
      self.qAns << {"key" => index+1, "val" => val} if val.present?
    end
  end

  def get_qAns
    self.qAns.blank? ? [] : self.qAns.map{|hash| hash['val']}
  end
  
end
