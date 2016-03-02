class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    begin
      @contact_form = ContactForm.new(params[:contact_form])
      @contact_form.request = request

      if @contact_form.deliver
        flash[:success] = "Thanks for your message! We'll get back to you as soon as we can!"
        redirect_to :controller => 'pages', :action => 'index'
      else
        redirect_to :controller => 'pages', :action => 'index'
      end
    rescue ScriptError
      flash[:error] = 'Sorry, this message appears to be spam and was not delivered.'
    end
  end
end
