require 'test_helper'

class FaxDocumentTest < ActiveSupport::TestCase
  test "update_fax_documents should make faxes private by default" do
    filepath = File.join(FAX_BASE_DIRECTORY, 'test.txt')
    begin
      File.open( filepath, 'w+') {|file| file.write "Hello, FaxDocumentTest!" }
      assert_difference 'FaxDocument.count', 1 do
        FaxDocument.update_fax_documents
      end

      assert FaxDocument.last.private
    ensure
      File.delete(filepath) if File.exists?(filepath)
    end
  end
end
