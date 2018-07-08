class ContactsController < ApplicationController
  def index
    if params[:group_id] && !params[:group_id].empty?
      @contacts = Contact.where(group_id: params[:group_id]).order(created_at: :desc).page(params[:page])
    else
      @contacts = Contact.order(created_at: :desc).page(params[:page])
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      flash[:success] = "Contact was successfully created"
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contacts_params)
      flash[:success] = "Contact updated successfully"
      redirect_to contacts_path
    else
      render "edit"
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    flash[:success] = "Contact deleted successfully"
    redirect_to contacts_path
  end

  private

  def contacts_params
    params.require(:contact).permit(:name, :email, :company, :address, :phone, :group_id, :avatar)
  end

end
