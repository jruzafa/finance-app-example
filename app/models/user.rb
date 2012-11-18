require 'digest/sha1'

class User < ActiveRecord::Base

  attr_accessor :password

  validates :email, :uniqueness => true,
            :length => { :within => 5..50 },
            :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

  validates :password, :confirmation => true,
            :length => { :within => 4..20 },
            :presence => true,
            :if => :password_required?

  has_many :categories, :dependent => :destroy
  has_many :entries, :dependent => :destroy
  has_many :expenses, :dependent => :destroy
  # has_many :types

  # before save user encrypt password in SHA1
  before_save :encrypt_new_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end


  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected

    def encrypt_new_password
      # if password from form is blank return nill
      return if password.blank?

      # if password is set encrypted and keep in hashed_password
      self.hashed_password = encrypt(password)
    end

    def password_required?
      hashed_password.blank? || password.present?
    end

    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
end
