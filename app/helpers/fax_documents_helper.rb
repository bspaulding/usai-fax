module FaxDocumentsHelper
  def actions_for_fax(fax)
    return unless current_user.is_admin?

    html = ''
    locked_icon   = image_tag 'locked.png',   :width => "15px", :height => "15px"
    unlocked_icon = image_tag 'unlocked.png', :width => "15px", :height => "15px"

    if fax.private
      html += link_to locked_icon,   fax_document_make_public_path(fax),  :title => 'Make Public'
    else
      html += link_to unlocked_icon, fax_document_make_private_path(fax), :title => 'Make Private'
    end

    html += link_to image_tag('icon_delete.gif', :title => "Delete"), fax_document_path(fax), :confirm => "Are you sure you want to permanently delete this document?", :method => :delete if current_user.is_admin?

    html.html_safe
  end
end