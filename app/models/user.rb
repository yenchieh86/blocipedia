class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis
  has_many :collaborators
  has_many :wiki_collaborators, through: :collaborators, source: :wiki
  enum role: [:standard, :premium, :admin]
end
