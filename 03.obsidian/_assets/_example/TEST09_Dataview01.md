---
alias: 测试dataview 长表格2
时间: 2022年01月25日 20:51
tags: dvtest,很长的标签示例,good
status: 2
rating: 0
cssclass: fullwidth
usage: 缩减栏宽开启下，控制页面全宽显示
---

- 测试dataview表格内容不分行紧凑显示。
- 需要在style setting 中3.6 Dataview中开启Dataview Table表格紧凑显示即可。

---
字段1:: AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBB我是很长很长的内容
字段2:: 我也不是省油的灯。。。。。。。。。。。

---


```dataview
table without id 时间, 字段1
from #dvtest
```

```dataview
table  时间, 字段1, 字段2,status, rating,tags
from #dvtest
```


