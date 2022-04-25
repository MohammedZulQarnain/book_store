class AddCitationFieldsToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :sub_title, :text
    add_column :books, :publication_date, :date
    add_column :books, :no_of_pages, :integer
    add_column :books, :volume_no, :integer
    add_column :books, :url, :text
  end
end
