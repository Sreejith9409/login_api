json.extract! user, :id, :first_name, :last_name, :email, :age, :gender, :login, :crypted_password, :home_number, :mobile_number, :work_number, :fax_number, :other_number, :address, :city, :state, :pincode, :country, :auth_token, :created_at, :updated_at
json.url user_url(user, format: :json)
