include Nanoc::Helpers::Rendering

# Output a meta-tag for use in your site header. The key you supply is looked
# up in the configuration under 'meta_data'. You can override it on a per-item
# basis.
#
# Usage:
#
#   <%= meta_tag :keywords %>
#
# This will output:
#
#   <meta name="keywords" value="...">
#
# Here, '...' is either the value of @item[:keywords] or that of
# @site.config[:keywords].
def meta_tag(key)
  value = @item[key] || @config[key]
  '<meta name="%s" content="%s">' % [h(key), h(value)] if value
end