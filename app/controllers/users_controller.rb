class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :authenticate_admin, only: [:index]
  before_filter :privileged, only: [:show, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.where.not(god_mode: true)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @client =
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end
