---
banner_x: 0.5
banner_y: 0.5
Banner style: Solid
banner: "_assets/_banner/01.bio/astronight.gif"
cssclass: noyaml
metatable: true
obsidianUIMode: preview
---

## 数量统计

### 2022-03

```dataview
table Weather AS "天气", created AS "创建日期", updated AS "更新日期", tags AS "标签"
from "0000-index/002-diary"
where contains(file, "day") and startswith(file.name, "2022-03")
sort id 
```
