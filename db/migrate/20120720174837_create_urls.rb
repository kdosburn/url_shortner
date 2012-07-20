class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :long_url, :null => false, :uniqueness => true
      t.string :short_url_slug, :null => false, :uniqueness => true

      t.timestamps
    end
  end
end
