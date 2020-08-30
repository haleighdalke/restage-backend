class AdminSerializer < ActiveModel::Serializer
  attributes :id, :authorization_code, :title
  has_one :user

  def initialize(admin_object)
    @admin = admin_object
  end
 
  def to_serialized_json
    options = {
      :include => {
        :user => {:only => [:id, :name, :username]}
      }, :except => [:user_id, :updated_at, :created_at]
    }
    @admin.to_json(options)
  end

end
