module FaxDocumentsHelper
  def access_controls_for_fax(fax)
    return unless current_user.is_admin?

    locked_icon   = image_tag 'locked.png',   :width => "15px", :height => "15px"
    unlocked_icon = image_tag 'unlocked.png', :width => "15px", :height => "15px"

    if fax.private
      link_to_remote(locked_icon, :url => {:action => "make_public", :id => fax.id})
    else
      link_to_remote(unlocked_icon, :url => {:action => "make_private", :id => fax.id})
    end
  end

  def actions_for_fax(fax)
    html = link_to "Download", url_for(:action => "show", :id => fax.id)
    html += link_to "Delete", url_for(:action => "destroy", :id => fax.id), :confirm => "Are you sure you want to permanently delete this document?", :method => :delete if current_user.is_admin?

    html
  end
end
