---
title: <% tp.file.title%>
year: <% tp.file.cursor(2) %>
author: <% tp.file.cursor(5) %>
created: <% tp.date.now("YYYY-MM-DD HH:mm:ss")%>
updated: <% tp.date.now("YYYY-MM-DD HH:mm:ss")%>
tags: [book/year{{DATE:YYYY}}, book/month{{DATE:MM}}]

obsidianUIMode: source
cssclass: img-grid, centerAlign
---

<% tp.file.cursor(6) %>
