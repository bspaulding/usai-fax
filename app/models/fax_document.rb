class FaxDocument < ActiveRecord::Base

  scope :public, :conditions => { :private => false }
	
	# Check the FAX_BASE_DIRECTORY for new faxes and instantiate them.
	# Deletes files after instantiation.
	def self.update_fax_documents
		Dir.chdir(FAX_BASE_DIRECTORY)
		Dir.entries(Dir.getwd).reject {|fname| File.directory?(fname)}.each do |filename|
			FaxDocument.create!(
				:filename => filename,
				:pathname => File.expand_path(filename),
				:private => true,
				:file_data => File.open(filename).read
			)
			File.delete(filename)
		end
	end
end
