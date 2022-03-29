---
metatable: true
cssclass: code-wrap 
obsidianUIMode: preview
banner: "_assets/_banner/home.jpg"
---

%%问候、天气数据%%
````ad-flex
<div style="float:left"><%+ tp.date.now("A好，今天是YYYY年MM月Do dddd") %></div> 

<div><iframe style="float:right; margin-top:3px" width="300" scrolling="no" height="20" frameborder="0" allowtransparency="true" src="https://i.tianqi.com?color=%23%FFFFFE&c=code&id=34&bdc=%23&icon=4&site=14"></iframe></div>
````

%%便签、统计、每日海报%%
````ad-flex
<div>
<p class="stickies" style="max-width:180px" >
<strong>倒计时</strong></br>今年已过去<strong><%+* tR+= moment().diff(tp.date.now("YYYY-1-1"), "days") %></strong>天
</br>距春节还有<strong><%+* let edate = moment("2022-02-01", "yyyy-MM-DD"); let from = moment().startOf('day'); edate.diff(from, "days") >= 0 ? tR += edate.diff(from, "days") : tR += edate.add(1, "year").diff(from, "days") %></strong>天
</p>
<p class="stickies2" style="max-width:150px">
💖 Don't let joy take you down !
</p>
</div>


```dataviewjs
// 统计笔记 nofold 里面放入需要排除的文件夹
let nofold = '!"88-Template" and !"00-Tips" and !"10-Help"'
let ftMd = dv.pages("").file.sort(t => t.cday)[0]
let total = parseInt([new Date() - ftMd.ctime] / (60*60*24*1000))
let allFile = dv.pages(nofold).file
let totalMd = "📄 ==" + allFile.length+"== 篇不知所云的文档"
let totalTag = "=="+allFile.etags.distinct().length+"== 个乱七八糟的标签"
let totalTask = "=="+allFile.tasks.length+"== 个已荒废的事项"
dv.header(4, "您已经坚持学习 =="+total+"== 天")
dv.header(5, totalMd)
dv.header(5, "🔖 "+totalTag)
dv.header(5, "🕗 " + totalTask)
```


```dataviewjs
// 个性化进度条算法
let dates = moment().format('YYYY-MM-1');
let days = moment().diff(dates, "days");
let num = (days/30 * 10).toFixed(1);
dv.header(4,"⚽ 本月剩余时间"+num*10+'%<br>')
dv.span(percentageToEmotes(num))
//dv.span(percentageToEmotes(num))
function percentageToEmotes(num) {
// 小数点分割
let str = num.toString().split('.');
let anum= parseInt(str[0]);
let bnum= parseInt(str[1]);
if(!bnum)
	bnum=0;	
if(anum==10)
return "🌑".repeat(anum);
return "🌑".repeat(anum) +get_icon(bnum) + "🌕".repeat(9 - anum);

}
function get_icon(num){
switch( true ) {
    case num <=2:
		 return "🌕"
        break;
    case num <= 4:
		return "🌔"
        break;   
    case num <= 6: 
		return "🌓"
        break;
	 case num <= 8: 
		return "🌒"
        break;
		default:
		return "🌑"
        break;
}
}
```


```dataviewjs
// 每日海报
let history = Object.assign(JSON.parse(await app.vault.adapter.read(".obsidian/.diary-stats")));
let today = moment().format("YYYY-MM-DD");
if (history.hasOwnProperty(today))
{
let posters=history[today].posters;
dv.paragraph(posters);
}
```
````

%%每日一句、网易歌曲%%
````ad-flex
```dataviewjs
let history = Object.assign(JSON.parse(await app.vault.adapter.read(".obsidian/.diary-stats")));
let today = moment().format("YYYY-MM-DD");
if (history.hasOwnProperty(today))
{
let quotes=history[today].quotes;
dv.el("blockquote", quotes);
}
```


```dataviewjs
let history = Object.assign(JSON.parse(await app.vault.adapter.read(".obsidian/.diary-stats")));
let today = moment().format("YYYY-MM-DD");
if (history.hasOwnProperty(today))
{
let music=history[today].music;
dv.el("blockquote", music);
}
```
````

%%伪看板%%
```ad-kanban
- **NAV**
	- `button-openInbox`
	- `button-openDiary`
	- `button-openCard`
	- `button-openPaper`
- **MOC1**
	- [[🥑Blue Topaz Themes Tips|🥑主题TIPS]]
	- [[魔方配色设置说明|🎲魔方配色]]
	- [[分栏效果示例|💶分栏效果]]
	- [[伪看板|📊伪看板]]
	- [[四象限表格|💷四象限表]]

- **MOC2**
	- [[css基础教学|🥏CSS教学]]
	- [[MarkDown超级教程|📙Markdown超级教程]]
	- [Obsidian中文教程](https://publish.obsidian.md/chinesehelp/README)
	- [[Johnny学OB 资料汇总]]
	- [[Lillian新手入门教程]]
```

%%近期活动%%
````ad-flex
<div>

### 最近编辑
```dataview
table WITHOUT ID file.link AS "标题",file.mtime as "时间"
from !"模板" and !"kanban"
sort file.mtime desc
limit 5
```
</div>

<div>

### 三天内创建的笔记
```dataview
table file.ctime as 创建时间
from ""
where date(today) - file.ctime <=dur(3 days)
sort file.ctime desc
limit 5
```
</div>
````


