---
title: <% tp.file.title%>
created: <% tp.date.now("YYYY-MM-DD HH:mm:ss")%>
updated: <% tp.date.now("YYYY-MM-DD HH:mm:ss")%>
tags: [diary/year{{DATE:YYYY}}, diary/month{{DATE:MM}}]

banner_x: 0.5
banner_y: 0.5
banner: <% tp.user.getrandomImage("_assets/_banner/05.backdrop")%>

metatable: true
obsidianUIMode: preview
cssclass: img-grid, centerAlign
---

<< [[<% tp.date.now("YYYY-MM-DD", -1, tp.file.title, "YYYY-MM-DD") %>|回忆昨天]] | [[<% tp.date.now("YYYY-MM-DD", 1, tp.file.title, "YYYY-MM-DD") %>|展望明天]]>>　　　　Weather::<% tp.user.getweather("柳林") %>
## ✏随笔感悟
