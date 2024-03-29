class User < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email, :provider, :uid

  def self.find_or_create_from_auth_hash auth_hash
    if @user = self.find_by_uid(auth_hash[:uid])
      return @user
    else
      return self.create(
        :first_name => auth_hash[:info][:first_name],
        :last_name => auth_hash[:info][:last_name],
        :email => auth_hash[:info][:email],
        :provider => auth_hash[:provider],
        :uid => auth_hash[:uid]
      )
    end
  end

end
