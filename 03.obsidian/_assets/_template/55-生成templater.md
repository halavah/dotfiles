<%* if (tp.file.tags.contains("#todo")) { %>
This file is a TODO file
<%* } else { %>
This file is normal file
<%* } %>

<% tp.date.now("dddd Dp MMMM YYYY", -7) %>
<% tp.date.now("dddd Dp MMMM YYYY, ddd") %>
<% tp.date.now("dddd Dp MMMM YYYY", 7) %>

<% tp.file.title %>
<% tp.file.creation_date() %>
<% tp.file.last_modified_date() %>

<%~ tp.web.daily_quote() %>
<%~ tp.web.random_picture() %>

<% tp.frontmatter.alias %>
<% tp.frontmatter.created %>
<% tp.frontmatter.updated %>

<% tp.user.weather() %>
