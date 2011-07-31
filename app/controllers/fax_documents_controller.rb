class FaxDocumentsController < ApplicationController
  before_filter :authorize
    
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

		redirect_to :action => :index
	end
	
	# Remote Call
	def make_public 
		@fax = FaxDocument.find(params[:fax_document_id])
		@fax.private = false
		@fax.save!
		
    redirect_to :action => :index
	end

	# Remote Call
	def make_private 
		@fax = FaxDocument.find(params[:fax_document_id])
		@fax.private = true
		@fax.save!
		
    redirect_to :action => :index
	end
	
	# Remote Call - to keep the interface responsive.
	def update_faxes
		FaxDocument.update_fax_documents

    redirect_to :action => :index
	end

  private

  def load_faxes
    current_user.is_admin? ? FaxDocument.all : FaxDocument.public
  end

  def authorize
    raise 'Not Authorized' unless (current_user.is_admin? || [:index, :show, :update_faxes].include?(params[:action].to_sym))
  end
end
