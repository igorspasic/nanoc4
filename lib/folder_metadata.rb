require 'yaml'

$yaml_files = Hash.new

# Collects and read all YAML files.
# They are stored per each folder, in tuples: identifier and parsed content
def collect_yaml_files(item)
	if (File.extname(item.identifier) == ".yaml")
		folder = Pathname(item[:filename]).dirname.to_s
		folder_yamls = $yaml_files[folder]
		if (folder_yamls == nil)
			folder_yamls = Array.new
			$yaml_files[folder] = folder_yamls
		end

		tuple = Array.new
		tuple << item.identifier
		tuple << YAML.load_file(item[:filename])

		folder_yamls << tuple
	end
end

# For each item that exist in the same folder as any of the yaml files
# adds item attribute with yaml file name and value of yaml file content
def bind_yaml_metadata(item)
	folder = Pathname(item[:filename]).dirname.to_s

	folder_yamls = $yaml_files[folder]
	if (folder_yamls == nil)
		return
	end

	folder_yamls.each do |yaml|
		attrName = File.basename(yaml[0], '.yaml')
		item[attrName] = yaml[1]
	end

end