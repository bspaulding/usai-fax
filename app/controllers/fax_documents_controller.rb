class FaxDocumentsController < ApplicationController
  before_filter :require_user
  
  def index
  	@faxes = current_user.is_admin? ? FaxDocument.all : FaxDocument.public
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
		
		render :update do |page|
			page.replace_html 'faxes', :partial => 'faxes', :object => FaxDocument.all 
			page.visual_effect :highlight, "fax_#{@fax.id}"
		end
	end

	# Remote Call
	def make_private 
		@fax = FaxDocument.find(params[:id])
		@fax.private = true
		@fax.save!
		
		render :update do |page|
			page.replace_html 'faxes', :partial => 'faxes', :object => FaxDocument.all 
			page.visual_effect :highlight, "fax_#{@fax.id}"
		end
	end
	
	# Remote Call - to keep the interface responsive.
	def update_faxes
		FaxDocument.update_fax_documents
		render :update do |page|
			page.replace_html 'faxes', :partial => 'faxes', :object => FaxDocument.all 
			page.replace_html 'last_updated_time', Time.now.strftime("%I:%M:%S %p (%b %d)")
		end
	end
end
