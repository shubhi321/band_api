class Api::V1::MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]
  before_action :band

  # GET /members
  def index
    @members = @band.members.all

    # debugger
    render json: @members
#.include(:members), only: [:name]
  end

  # GET /members/1
  def show
    render json: @member
  end

  # POST /members
  def create
    @member = @band.members.new(member_params)

    if @member.save
      render json: @member, status: :created
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:name)
    end

   def band
     @band = Band.find(params[:band_id])
   end
end


