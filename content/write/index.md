---
kind: nil
---

# All writes

List all items of kind `write`:

<% items_of_kind('write').reverse.each { |itid| it = @items[itid] %>
+ <%= it.identifier %> (<%= date(it) %>)
<% } %>


# All metadata

<%=	@item["cupid"].fetch("var") %>
<%	@item["cupid"].fetch("arr").each do |it| %>
	<%= h(it) %>
<% end %>
