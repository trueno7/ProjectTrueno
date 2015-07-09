class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      name = params[:conctact][:name]
      email = params[:conctact][:name]
      body = params[:conctact][:comments]
      
      ContactsMailer.conctact_email(name, email, body).deliver
      
      flash[:success] = 'Message Sent'
      redirect_to new_contact_path, notice: "Message sent"
    else
      flash[:danger] = 'Error Occured, message has not been sent'
      redirect_to new_contact_path, notice: "Error"
    end 
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end 
end