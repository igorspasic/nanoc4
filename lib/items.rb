require 'erb'
require 'date'
require 'pathname'

$items_collections = Hash.new

### --- preprocessing phase ---

def preprocess_item(item)

	# dates

	if item.key?(:date)
		item[:date] = attribute_to_time(item[:date])
    else
		item[:date] = Time.now
    end
    if item.key?(:updated)
		item[:updated] = attribute_to_time(item[:updated])
    end

    # kinds

	kind = item[:kind]

	if kind == nil
		path = item.identifier
		path = Pathname(path).dirname.to_s
		kind = path[1..-1]
		item[:kind] = kind
	end

	# save

	kinds = $items_collections[kind]

	if kinds == nil
		kinds = Array.new
		$items_collections[kind] = kinds
	end

	kinds.push(item.identifier)

end