require 'test_helper'

class FaxDocumentsControllerTest < ActionController::TestCase
  def setup    
    @public_fax  = FaxDocument.create!(:filename => 'public_fax.txt',  :private => false)
    @private_fax = FaxDocument.create!(:filename => 'private_fax.txt', :private => true)
  end

  test "index sets @faxes to only public is current_user is not admin" do
    sign_in users(:notadmin)

    get :index

    assert  assigns(:faxes).include?( @public_fax  )
    assert !assigns(:faxes).include?( @private_fax )
  end

  test "index sets @faxes to all is current_user is not admin" do
    sign_in users(:admin)

    get :index

    assert assigns(:faxes).include?( @public_fax  )
    assert assigns(:faxes).include?( @private_fax )
  end
end
