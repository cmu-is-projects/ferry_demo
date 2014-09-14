class AddTimeZones < ActiveRecord::Migration
def up
	east =  Zone.new
    east.name = "eastern"
    east.save!

	cent =  Zone.new
    cent.name = "central"
    cent.save!

	mount =  Zone.new
    mount.name = "mountain"
    mount.save!

	az =  Zone.new
    az.name = "arizona"
    az.save!

	pac =  Zone.new
    pac.name = "pacific"
    pac.save!

    al =  Zone.new
    al.name = "alaska"
    al.save!

	aleu =  Zone.new
    aleu.name = "aleutian"
    aleu.save!

    hi =  Zone.new
    hi.name = "hawaiian"
    hi.save!

end

def down
	Zone.delete_all
end

end
