
# Returns a hash of all the tags associated with the given set of items in
# which each key is a tag and the corresponding value denotes the number of
# items tagged with that tag.
def all_tags(item_set)
	tags = {}
	item_set.each do |i|
		i.fetch(:tags, []).each { |t| tags[t] = tags.fetch(t, 0) + 1 }
	end
	tags
end