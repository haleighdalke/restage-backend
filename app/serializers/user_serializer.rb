class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username

  def initialize(user_object)
    @user = user_object
  end
 
  def to_serialized_json
    options = {
      :include => {}, :except => [:updated_at, :created_at, :password_digest]
    }
    @user.to_json(options)
  end

end
