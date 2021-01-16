class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.select(:id, :first_name, :last_name, :login, :age, :gender, :email, :mobile_number, :city, :state, :address, :pincode, :country)
    render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    success, status  = true, ErrorCodeConstants::SUCCESS_CODE
    params_hash = request.request_parameters.present? ? request.request_parameters : JSON.parse(request.raw_post)
    @user = User.new(user_params(params_hash))
    if @user.save    
      details = {"message" => "User Created Successfully with id #{@user.id}"}
    else    
      success, status = false, ErrorCodeConstants::UN_PROCESSABLE_ENTITY
      details = {"message" => get_formatted_devise_error_message(@user.errors)}
    end
    render_json_hash(get_result_hash(status, success, details))
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    params_hash = JSON.parse(request.raw_post)
    if @user.update(user_params(params_hash))    
      render json: @user   
    else    
      render json: @user.errors, status: :unprocessable_entity   
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sign_in
    user = User.where("login = ? or email = ?", params[:user_name], params[:user_name]).first
    if user && user.authenticate?(params[:password])
      success, status  = true, ErrorCodeConstants::SUCCESS_CODE
      details = {"message" => "Signed In Successfully!!", "user_id" => user.id}            
    else
      success, status = false, ErrorCodeConstants::UN_PROCESSABLE_ENTITY
      details = {"message" => "Please pass valid email or login"}
    end
    render_json_hash(get_result_hash(status, success, details))
  end

  def get_result_hash(code, status, message)
    er_hash = {}
    er_hash["code"] = code 
    er_hash["success"] = status
    er_hash["body"] = message
    er_hash
  end

  def render_json_hash(resp_hash)
    render :json => hash_to_json(resp_hash), :content_type => Mime[:json], :status => 200
  end

  def hash_to_json(hash_obj)
    Oj.dump(hash_obj)
  end

  def get_formatted_devise_error_message(error_messages)
    if error_messages.messages.keys.include?(:mobile_number)
      formatted_err_msg = " #{"Mobile Nu
      render_json_hash(get_result_hash(status, success, details))mber " + error_messages.messages[:mobile_number].first.to_s}."
    else
      formatted_err_msg = (error_messages.first.first.to_s.gsub("_"," ").camelize + " #{error_messages.first.second.to_s}.")
    end
    error_messages.full_messages.first
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.where(id: params[:id]).select(:id, :first_name, :last_name, :login, :age, :gender, :email, :mobile_number, :city, :state, :address, :pincode, :country).first
    end

    # Only allow a list of trusted parameters through.
    def user_params(params_hash)
      {first_name: params_hash["first_name"], last_name: params_hash["last_name"], login: params_hash["login"], email: params_hash["email"], age: params_hash["age"], gender: params_hash["gender"], mobile_number: params_hash["mobile_number"], home_number: params_hash["home_number"], work_number: params_hash["work_number"], address: params_hash["address"], city: params_hash["city"], state: params_hash["state"], country: params_hash["country"], pincode: params_hash["pincode"], crypted_password: params_hash["crypted_password"]}
    end
end

module ErrorCodeConstants
  SUCCESS_CODE = 200
  NOT_A_VALID_REQUEST = 400
  INTERNAL_ERROR_CODE = 500
  UN_PROCESSABLE_ENTITY = 422
end