class RenameAticleIdToArticleId < ActiveRecord::Migration[5.2]
  def change
  	def self.up
    	rename_column :comments, :aticle_id, :article_id
    end
  end
end
