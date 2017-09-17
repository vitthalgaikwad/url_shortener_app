class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.text :original_url
      t.string :salt
      t.integer :visit_count, default: 0

      t.timestamps null: false
    end
  end
end
