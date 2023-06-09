class ContactInfosController < ApplicationController
  before_action :set_contact_info, only: %i[ show edit update destroy ]

  # GET /contact_infos or /contact_infos.json
  def index
    if user_signed_in?
      @contact = Contact.find(params[:contact_id])
      @contact_infos = @contact.contact_infos
    else
      redirect_to new_user_session_path
    end
  end

  # GET /contact_infos/1 or /contact_infos/1.json
  def show
  end

  # GET /contact_infos/new
  def new
    if user_signed_in?
      @contact = Contact.find(params[:contact_id])
      @contact_info = @contact.contact_infos.build
    else
      redirect_to new_user_session_path, notice: "Sign In Or Sign Up"
    end
  end

  # GET /contact_infos/1/edit
  def edit
  end

  # POST /contact_infos or /contact_infos.json
  def create
    @contact = Contact.find(params[:contact_id])
    @contact_info = @contact.contact_infos.build(contact_info_params)
    respond_to do |format|
      if @contact_info.save
        format.html { redirect_to contact_info_url(@contact_info), notice: "Contact info was successfully created." }
        format.json { render :show, status: :created, location: @contact_info }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_infos/1 or /contact_infos/1.json
  def update
    respond_to do |format|
      if @contact_info.update(contact_info_params)
        format.html { redirect_to contact_info_url(@contact_info), notice: "Contact info was successfully updated." }
        format.json { render :show, status: :ok, location: @contact_info }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_infos/1 or /contact_infos/1.json
  def destroy
    @contact_info.destroy

    respond_to do |format|
      format.html { redirect_to contact_infos_url, notice: "Contact info was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact_info
    @contact_info = ContactInfo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_info_params
    params.require(:contact_info).permit(:contact_id, :info_type, :number)
  end
end
