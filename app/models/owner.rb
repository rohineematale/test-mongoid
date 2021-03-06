class Owner
  include Mongoid::Document
  include Mongoid::Timestamps
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


  validates_presence_of :company_name, :on => :create

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  field :company_name, type: String

  has_many :questions
  has_many :questionnaires
  has_many :feed_devises

  def get_questions(questionnaire)
    if questionnaire.questions.present?
      questions = self.questions
      questions_arr = []
      questions_arr = questions.select{|que| (questionnaire.questions).include?(que.id.to_s)}
      questions_arr << questions.reject{|que| (questionnaire.questions).include?(que.id.to_s)}
      questions_arr.flatten
    else
      self.questions
    end
  end

  def get_questionnaires(feed_devise)
    if feed_devise.questionnaires.present?
      questionnaires = self.questionnaires
      questionnaires_arr = []
      questionnaires_arr = questionnaires.select{|que| (feed_devise.questionnaires).include?(que.id.to_s)}
      questionnaires_arr << questionnaires.reject{|que| (feed_devise.questionnaires).include?(que.id.to_s)}
      questionnaires_arr.flatten
    else
      self.questionnaires
    end
  end
  
end
