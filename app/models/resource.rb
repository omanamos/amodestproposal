class Resource < ActiveRecord::Base
	def self.save(upload)
		name =  upload['resource'].original_filename
		directory = "public/data"
		# create the file path
		path = File.join(directory, name)
		# write the file
		File.open(path, "wb") { |f| f.write(upload['resource'].read) }
  end
end
