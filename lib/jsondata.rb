require "json"

$jsondata = Hash.new

# Collect all JSON files into $jsondata
# key is JSON files basename
# value is it's parsed JSON content
def process_jsons(item)

	path = Pathname(item.identifier).to_s
	if (File.extname(path) != ".json")
		return
	end

	file = File.read(item[:filename])
	data_hash = JSON.parse(file)

	key = File.basename(item[:filename], ".json")

	# additional system keys
	data_hash[":id"] = key
	data_hash[":filename"] = item[:filename]

	$jsondata[key] = data_hash
end