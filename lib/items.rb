require 'erb'
require 'date'
require 'pathname'

$items_collections = Hash.new

### --- preprocessing phase ---

def preprocess_item(item)

	# dates

	if item.key?(:date)
		item[:date] = attribute_to_time(item[:date])
		item[:created_at] = item[:date]
    else
		if item.key?(:created_at)
			item[:date] = attribute_to_time(item[:created_at])
		else
			item[:date] = File.birthtime(item[:filename])
		end
    end

    item[:created_at] = item[:date]

    if item.key?(:updated_at)
		item[:updated_at] = attribute_to_time(item[:updated_at])
    end

    # kinds

	kind = item[:kind]

	if kind == nil
		path = Pathname(item.identifier).dirname.to_s
		path_array = Pathname(path).each_filename.to_a
		unless path_array.empty?
			kind = path_array[0]
			unless kind.empty?
				item[:kind] = kind
			end
		end
	end

	# save

	unless kind == nil
		kinds = $items_collections[kind]

		if kinds == nil
			kinds = Array.new
			$items_collections[kind] = kinds
		end

		kinds.push(item.identifier)
	end

end


# Sort items and add links to next/prev
def sort_items_collection()
  $alls_alt = Hash.new

  $items_collections.each { |k, v|
		result = v.sort {|left, right| (@items[left])[:date] <=> (@items[right])[:date]}
    	$alls_alt[k] = result
  }

  $items_collections = $alls_alt

  # prev/next

  $items_collections.each { |k,arr|
    arr.each_with_index { |it, ndx|
      if (ndx > 0)
        @items[it][:prev] = arr[ndx - 1]
      end
      if (ndx < arr.size - 1)
        @items[it][:next] = arr[ndx + 1]
      end
    }
  }
end

### --- rendering phase ---

# returns sorted array of items for given kind
# may return nil if kind is not available
def items_of_kind(kind)
	return $items_collections[kind]
end

def date(item)
	return item[:date].strftime("%Y-%m-%d")
end