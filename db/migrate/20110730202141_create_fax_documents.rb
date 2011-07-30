class CreateFaxDocuments < ActiveRecord::Migration
  def self.up
    create_table :fax_documents do |t|
      t.string :filename
      t.boolean :private
      t.binary :file_data
      t.string :pathname

      t.timestamps
    end
  end

  def self.down
    drop_table :fax_documents
  end
end
