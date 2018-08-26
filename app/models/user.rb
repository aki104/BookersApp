class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 # attr_accessor :login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable



has_many :books
attachment :profile_image

validates :name, presence: true
validates :name, length: { in: 2..20 }
# validates :introdaction, presence: true
validates :introdaction, length: { in: 1..50 }#, on: :update　　#on: :updateはページ指定


#  #usernameを必須・一意とする
#   validates_uniqueness_of :name
#   validates_presence_of :name

# #usernameを利用してログインするようにオーバーライド
#   def self.find_first_by_auth_conditions(warden_conditions)
#     conditions = warden_conditions.dup
#     if login = conditions.delete(:login)
#       #認証の条件式を変更する
#       where(conditions).where(["name = :value", { :value => name }]).first
#     else
#       where(conditions).first
#     end
#   end


end