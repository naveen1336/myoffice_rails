class AppUsersController < ApplicationController
layout "fetch_layout"
  before_action :set_app_user, only: [:show, :edit, :update, :destroy]

  # GET /app_users
  # GET /app_users.json
  def index
    @app_users = AppUser.all
  end

  # GET /app_users/1
  # GET /app_users/1.json
  def show
  end

  # GET /app_users/new
  def new
    @app_user = AppUser.new
  end

  # GET /app_users/1/edit
  def edit
  end

  # POST /app_users
  # POST /app_users.json
  def create
    @app_user = AppUser.new(app_user_params)

    respond_to do |format|
      if @app_user.save
        format.html { redirect_to @app_user, notice: 'App user was successfully created.' }
        format.json { render :show, status: :created, location: @app_user }
      else
        format.html { render :new }
        format.json { render json: @app_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_users/1
  # PATCH/PUT /app_users/1.json
  def update
    respond_to do |format|
      if @app_user.update(app_user_params)
        format.html { redirect_to @app_user, notice: 'App user was successfully updated.' }
        format.json { render :show, status: :ok, location: @app_user }
      else
        format.html { render :edit }
        format.json { render json: @app_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_users/1
  # DELETE /app_users/1.json
  def destroy
    @app_user.destroy
    respond_to do |format|
      format.html { redirect_to app_users_url, notice: 'App user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_user
      @app_user = AppUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_user_params
      params.require(:app_user).permit(:email, :first_name, :last_name, :role)
    end
end
