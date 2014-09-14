class AddViewer < ActiveRecord::Migration
  def up
  	viewer =  Viewer.new
    viewer.name = "neo"
    viewer.save!
  end

  def down
  	Viewer.delete_all
  end

end
