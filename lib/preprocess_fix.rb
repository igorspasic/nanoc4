
# Fixes all items
def preprocess_fix_items(items)

  # fix missing filename attribute
  items.each do |item|
    if (item[:filename] == nil) then
      item[:filename] = item[:meta_filename]
    end
  end

end