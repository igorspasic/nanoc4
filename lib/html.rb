require 'erb'

# Output a HTML meta-tag for use in your site header. The key you supply is looked
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
# @config[:site][:keywords].

def meta_tag(key)
  value = @item[key] || @config[:site][key]
  '<meta name="%s" content="%s">' % [h(key.to_s), h(value.to_s)] if value
end

# Renders either items key or configuration key.
#
#  <%= val :title %>
#
def val(key)
  value = @item[key] || @config[:site][key]
  '%s' % h(value.to_s) if value
end