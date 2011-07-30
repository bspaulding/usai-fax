module FaxDocumentsHelper
  def actions_for_fax(fax)
    return unless current_user.is_admin?

    html = ''
    locked_icon   = image_tag 'locked.png',   :width => "15px", :height => "15px"
    unlocked_icon = image_tag 'unlocked.png', :width => "15px", :height => "15px"

    if fax.private
      html += link_to_remote locked_icon,   :url => { :action => "make_public",  :id => fax.id }, :title => 'Make Public'
    else
      html += link_to_remote unlocked_icon, :url => { :action => "make_private", :id => fax.id }, :title => 'Make Private'
    end

    html += link_to image_tag('icon_delete.gif', :title => "Delete"), url_for(:action => "destroy", :id => fax.id), :confirm => "Are you sure you want to permanently delete this document?", :method => :delete if current_user.is_admin?

    html
  end
end
