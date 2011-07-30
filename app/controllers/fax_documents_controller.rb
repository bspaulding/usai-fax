class FaxDocumentsController < ApplicationController
  before_filter :require_user
  before_filter :authenticate_user

  def index
  	@faxes = load_faxes
  end

  def show
  	@fax = FaxDocument.find(params[:id])
  	send_data(@fax.file_data, :filename => @fax.filename)
  end
	
	def destroy
		@fax = FaxDocument.find(params[:id])
		@fax.destroy
		redirect_to :action => 'index'
	end
	
	# Remote Call
	def make_public 
		@fax = FaxDocument.find(params[:id])
		@fax.private = false
		@fax.save!
		
    faxes = load_faxes
		render :update do |page|
			page.replace_html 'faxes', :partial => 'faxes', :object => faxes
			page.visual_effect :highlight, "fax_#{@fax.id}"
		end
	end

	# Remote Call
	def make_private 
		@fax = FaxDocument.find(params[:id])
		@fax.private = true
		@fax.save!
		
    faxes = load_faxes
		render :update do |page|
			page.replace_html 'faxes', :partial => 'faxes', :object => faxes
			page.visual_effect :highlight, "fax_#{@fax.id}"
		end
	end
	
	# Remote Call - to keep the interface responsive.
	def update_faxes
		FaxDocument.update_fax_documents

    faxes = load_faxes
		render :update do |page|
			page.replace_html 'faxes', :partial => 'faxes', :object => faxes
			page.replace_html 'last_updated_time', Time.now.strftime("%I:%M:%S %p (%b %d)")
		end
	end

  private

  def load_faxes
    current_user.is_admin? ? FaxDocument.all : FaxDocument.public
  end

  def authenticate_user
    raise 'Not Authorized' unless (current_user.is_admin? || [:index, :show, :update_faxes].include?(params[:action].to_sym))
  end
end
