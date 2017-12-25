#网页浏览光标样式
document.body.style.cursor ="auto"

#全局变量
headingColor="#343F4F";
headingColorDark="#2B3441";
backgroundColorBase = "#F2F3F8"
primaryColor = "rgba(24,165,217,100)"
primaryColor01 = "#C5E1ED"
textColor = "#4A515C"
# Set Screen background
Screen.backgroundColor = backgroundColorBase


# Springs缓动预定义
iOSAppLaunch = "spring(320,40,0)"
iOSKeyboard = "spring(280,33,10)"
iOSSlideView = "spring(220,28,0)"
iOSRetreat = "spring(220,28,0)"
iOSActionSheet = "spring(280,33,10)"

materialAppLaunch = "spring(260,32,16)"
materialKeyboard = "spring(220,35,25)"
materialSlideView = "spring(220,35,25)"
materialRetreat = "spring(160,30,10)"
materialActionSheet = "spring(250,37,20)"

floaty = "spring(160,40,10)"
hello = "spring(400,22,20)"
retreat = "spring(160,30,10)"
pop = "spring(280,13,10)"
bigPop = "spring(370,8,0)"
dramatic = "spring(120,140,0)"
slow = "spring(100,50,0)"
quick = "spring(400,23,6)"
loose = "spring(240,18,28)"

#创建存储分类标题的数组
arrtitles = []


#json数据
#侧边栏菜单
dataMenu = [{cgy:"概览",name:"概览",iconpic:"images/01_nor.svg",iconpicSel:"images/01_sel.svg";},{cgy:"用户分析",name:"新增用户",iconpic:"images/02_nor.svg",iconpicSel:"images/02_sel.svg";},{cgy:"用户分析",name:"活跃用户",iconpic:"images/03_nor.svg",iconpicSel:"images/03_sel.svg";},{cgy:"用户分析",name:"版本统计",iconpic:"images/04_nor.svg",iconpicSel:"images/04_sel.svg";},{cgy:"转化分析",name:"UV访购率",iconpic:"images/05_nor.svg",iconpicSel:"images/05_sel.svg";},{cgy:"转化分析",name:"注册UV转化率",iconpic:"images/06_nor.svg",iconpicSel:"images/06_sel.svg";},{cgy:"功能",name:"页面流量",iconpic:"images/07_nor.svg",iconpicSel:"images/07_sel.svg";},{cgy:"功能",name:"功能点击",iconpic:"images/08_nor.svg",iconpicSel:"images/08_sel.svg";}]

#dataMenu = [{cgy:"概览",name:"概览",iconpic:"images/01_nor.svg",iconpicSel:"images/01_sel.svg";},{cgy:"转化分析",name:"注册UV转化率",iconpic:"images/06_nor.svg",iconpicSel:"images/06_sel.svg";},{cgy:"功能",name:"页面流量",iconpic:"images/07_nor.svg",iconpicSel:"images/07_sel.svg";},{cgy:"功能",name:"功能点击",iconpic:"images/08_nor.svg",iconpicSel:"images/08_sel.svg";}]

#平台下拉选项数据

clientdata = [{cgy:"APP",name:"appitem01"},{cgy:"APP",name:"appitem02"},{cgy:"APP",name:"appitem03"},{cgy:"WEB",name:"webitem01"},{cgy:"WEB",name:"webitem02"},{cgy:"APP",name:"appitem04"}]

# sideBar.destroy()

#为数组添加一个方法属性用来去重
Array.prototype.unique = ->
	#新建一个数组存放结果
	res = [];
	#新建一个空对象
	json = {};
	#遍历当前数组并从原数组中取出一个元素与对象进行对比
	for i in [0..this.length-1]
	#如果这个元素不重复，则把它存放到结果数组中，同时把这个元素的内容作为对象的一个属性，并赋值为1
		if!json[this[i]] then res.push(this[i]) and json[this[i]]=1;
	res;	


#存放归类后的菜单json数据
category = []
#新建一个数组用来存储按类别筛选的数据
cgyArry = [];
#菜单选项列表
listArry = [];	

#菜单当前图标数组
iconpicArry = []
iconpicSelArry = []

#创建一个函数把类别字段丢进category数组
category.pushCgy = ->
	for i in [0..dataMenu.length-1]
		category.push(dataMenu[i].cgy)
category.pushCgy()
		
for i in [0..dataMenu.length-1]
	iconpicArry.push(dataMenu[i].iconpic)
	iconpicSelArry.push(dataMenu[i].iconpicSel)
# print iconpicArry

# Array.prototype.classify = ->
# 	res1 = [];
# 	for i in [0..this.length-1]
# 	#挑出数组字段
# 		res1.push(Array[i].cgy)
# 		return res1
# 	res2 = []
# 	for j in [0..res.unique().length-1]
# 		res2[j] = []
# 		for k in [0..this.length-1]
# 			if this[k].cgy == res1.unique()[j] then res2[j].push(this[k])
# 	return res2;	
for j in [0..category.unique().length-1]
	#按类别数量新建空数组
	cgyArry[j] = []
	#遍历数据源
	for a in [0..dataMenu.length-1]
	#如果数据源中找到该类别则依次丢到新建的数组
		if dataMenu[a].cgy == category.unique()[j] then cgyArry[j].push(dataMenu[a])
		
#顶部导航
topBar = new Layer
	x: 0
	y: 0
	backgroundColor: "transparent"
	width: Screen.width
	height: 56

top_bar_bg = new Layer
	parent: topBar
	x: 0
	y: 0
	width: Screen.width
	height: 56
	backgroundColor: "rgba(255,255,255,1)"
	borderColor: "rgba(233,233,233,1)"
	borderWidth: 1

txt = new Layer
	parent: topBar
	x: Align.right(-24)
	y: 18
	backgroundColor: "transparent"
	width: 142
	height: 21

account = new Layer
	parent: txt
	x: 0
	y: 0
	backgroundColor: "transparent"
	width: 92
	height: 21

admin_24 = new TextLayer
	parent: account
	x: 0
	y: 5.329070518200753e-15
	width: 64
	text: "snow_sheng"
	fontSize: 12
	fontFamily: "PingFang SC"
	fontWeight: 400
	lineHeight: 1.5
	textAlign: "left"
	color: "rgba(102,102,102,1)"

avatar = new Layer
	parent: account
	x: 72
	y: 0
	backgroundColor: "#ccc";
	width: 20
	height: 20
	borderRadius: 10
	image: "images/avatar.png"

line = new Layer
	parent: txt
	x: 100.5
	y: 0.5
	width: 2
	height: 20.5

layer = new TextLayer
	parent: txt
	x: 114
	y: 0
	text: "登出"
	fontSize: 12
	fontFamily: "PingFang SC"
	fontWeight: 400
	lineHeight: 1.5
	textAlign: "left"
	color: "rgba(102,102,102,1)"

#侧边栏(logo,平台筛选)
#按类别重新排序
clientdataCgy = []
#存放平台数据类别数组
clientCgyArry = []

#存放平台数据名称数组
clientNameArry = []

#存放次级导航菜单的数组
secondaryItemArry = [] 
selectSound= new Audio("sounds/Tab1.m4a")
selectEndSound = new Audio("sounds/Tab1.m4a")


for i in [0..clientdata.length-1]
	#挑出数组字段
	clientCgyArry.push(clientdata[i].cgy)
	clientNameArry.push(clientdata[i].name)
# 	return clientCgyArry;
for a in [0..clientCgyArry.unique().length-1]
	clientdataCgy[a] = []
	for i in [0..clientdata.length-1]
		if clientdata[i].cgy == clientCgyArry.unique()[a] then clientdataCgy[a].push(clientdata[i])
		
# 	return clientdataCgy	
	

#侧边栏(logo,平台筛选)
sideBar = new Layer
	height: Screen.height
	width: 224
	backgroundColor: headingColor
		
logoBg = new Layer
	parent: sideBar
	height: 56
	width: 224
	backgroundColor: headingColorDark
	
logo = new Layer
	parent: logoBg
	x: 24
	y: 16
	width: 1600
	originX: 0
	originY: 0
	scale: 0.1
	height: 250
	parent: logoBg
	image: "images/logo.svg"
	
client = new Layer
	parent: sideBar
	x: 0
	y: logo.y+44
	backgroundColor: "transparent"
	width: 224
	height: 88

list_bg = new Layer
	parent: client
	x: 0
	y: 0
	width: 224
	height: 88
	backgroundColor: "transparent"

client_text = new TextLayer
	parent: client
	x: 60
	y: Align.center
	width: 128
	text: clientNameArry[0]
	fontSize: 13
	fontFamily: "PingFang SC"
	fontWeight: 300
	lineHeight: 1.3846153846153846
	textAlign: "left"
	color: "rgba(255,255,255,1)"

client_icon = new Layer
	parent: client
	x: 24
	y: Align.center
	width: 20
	height: 20
	backgroundColor: "transparent"
	image: "images/client.svg"

arrow_down = new Layer
	parent: client
	rotation: 0
	scale: 1
	x: 192
	y: Align.center
	width: 8
	height: 5
	image: "images/arrow_down.svg"


for c in [0..clientCgyArry.unique().length-1]
	
	client_item = new Layer
		parent: list_bg
		x: Align.right(44)
		y: 96+32*c
		backgroundColor: "rgba(255,255,255,0.9)"
		backgroundBlur: 60
		width: 158
		height: 32
		z: 99
		name: "client_item"+(c+1)
		visible: false
    
	client_item_txt = new TextLayer
		parent: client_item
		x: 16
		y: 8
		text: clientCgyArry.unique()[c]
		fontSize: 12
		fontFamily: "PingFang SC"
		width: 158
		height: 32
		fontWeight: 400
		lineHeight: 1.5
		textAlign: "left"
		color: textColor
		
		for d in [0..clientdataCgy[c].length-1]
			secondary_client_item = new Layer
				parent: client_item
				id: clientdataCgy[c]+d
				name: "secondary_client_item"+d
				x: client_item.width
				y: 32*d
				backgroundColor: "rgba(255,255,255,0.9)"
				backgroundBlur: 60
				width: 158
				height: 32
				visible: false
		
			secondary_client_item_txt = new TextLayer
				parent: secondary_client_item
				x: 16
				y: 8
				text: clientdataCgy[c][d].name
				fontSize: 12
				fontFamily: "PingFang SC"
				fontWeight: 400
				lineHeight: 1.5
				textAlign: "left"
				color: textColor
			
			
			secondaryItemArry.push(secondary_client_item)
				
			secondary_client_item.states =
				mouseOver:
					backgroundColor:primaryColor01
				mouseOut:
					backgroundColor:"rgba(255,255,255,0.9)"	
				hidden:
					visible:false
				show:
					visible:true	
			
			secondary_client_item.turnOn = -> @visible = true
			secondary_client_item.turnOff = -> @visible = false		
			secondary_client_item.onMouseOver (event, layer) ->
				@stateSwitch("mouseOver")
			secondary_client_item.onMouseOut (event, layer) ->
				@stateSwitch("mouseOut")					

	client_item.states =
		mouseOver:
			backgroundColor:primaryColor01
		mouseOut:
			backgroundColor:"rgba(255,255,255,0.9)"		
	
	
	
	client_item.onMouseOver (event, layer) ->
		@stateSwitch("mouseOver")
		for i in [0..@children.length-1-1]
			@children[i].visible = true
	client_item.onMouseOut (event, layer) ->
		@stateSwitch("mouseOut")
		for i in [0..@children.length-1-1]
			@children[i].visible = false	

# print secondaryItemArry
# print clientCgyArry
# print clientdataCgy

arrow_down.states = 
	mouseOver:
		scale:1.2
		animationOptions:
			curve: Bezier.ease
			time:0.25
	mouseOut:
		scale:1
		animationOptions:
			curve: Bezier.ease
			time:0.25		
	onClick:
		rotation:180
		animationOptions:
			curve: Bezier.ease
			time:0.25
	onClickBack:		
		rotation:0
		animationOptions:
			curve: Bezier.ease
			time:0.25
client.states =
	mouseOver:
		backgroundColor: headingColorDark
	mouseOut:
		backgroundColor:"transparent"

client.isOn = false

#平台切换交互
client.onMouseOver (event, layer) ->
	@stateSwitch("mouseOver")
	arrow_down.stateSwitch("mouseOver")
client.onMouseOut (event, layer) ->
	if @isOn is true then @stateSwitch("mouseOver")	
	else @stateSwitch("mouseOut")	
	arrow_down.stateSwitch("mouseOut")
# print client.childrenWithName("client_item")


# print clientdataCgy
# 	print @isOn
#点击展示子项目
	if @isOn is false
		for i in [0..list_bg.children.length-1]
			list_bg.children[i].visible = true
		arrow_down.stateSwitch("onClick") and @isOn = true
		selectSound.play()
	else
		for i in [0..list_bg.children.length-1]
			list_bg.children[i].visible = false
		arrow_down.stateSwitch("onClickBack") and @isOn = false
		selectEndSound.play()

#点击子项目替换平台名称
for i in [0..secondaryItemArry.length-1]
	secondaryItemArry[i].index = i
	secondaryItemArry[i].onClick (event, layer) ->
		client_text.text = 	@children[0].text

#侧边栏(菜单导航)布局
# print category.unique()
for j in [0..category.unique().length-1]
	title = new Layer
		parent: sideBar
		x: 0
		y: client.y+client.height*(j+1)
		backgroundColor: "transparent"
		width: 224
		height: 44
		shadowY: -1
		shadowColor: "rgba(255,255,255,0.1)"

	
	rectangle = new Layer
		parent: title
		x: 0
		y: 0
		width: 224
		height: 44
		backgroundColor: "transparent"
	
	layer = new TextLayer
		parent: title
		x: 24
		y: 23
		text: category.unique()[j]
		fontSize: 9
		fontFamily: "PingFang SC"
		fontWeight: 500
		lineHeight: 1
		textAlign: "left"
		color: "rgba(42,197,255,1)"
		opacity: 0.6699999570846558
	arrtitles.push(title)

#新建一个数组用来存储按类别筛选的数据
cgyArry = [];
listArry = [];	
for j in [0..category.unique().length-1]
	#按类别数量新建空数组
	cgyArry[j] = []
	#遍历数据源
	for a in [0..dataMenu.length-1]
	#如果数据源中找到该类别则依次丢到新建的数组
		if dataMenu[a].cgy == category.unique()[j] then cgyArry[j].push(dataMenu[a])


	for k in [0..cgyArry[j].length-1]
		list = new Layer
			parent: arrtitles[j]
			x: 0
			y: title.height*(k+1)
			backgroundColor: "transparent"
			width: 224
			height: 44
	
		rectangle = new Layer
			parent: list
			x: 0
			y: 0
			width: 224
			height: 44
			backgroundColor: "transparent"
		
		list_txt = new TextLayer
			parent: list
			x: 60
			y: Align.center
			width: 128
			text: cgyArry[j][k].name
			fontSize: 12
			fontFamily: "PingFang SC"
			fontWeight: 400
			lineHeight: 1.2857142857142858
			textAlign: "left"
			color: "rgba(255,255,255,0.6)"
			
		list_icon = new Layer
			parent: list
			x: 24
			y: 12
			width: 20
			height: 20
			image: cgyArry[j][k].iconpic		
		
		#抽出单个list图层，丢进前面新建的listArry数组
		listArry.push(list)	

#重置title和其子元素的位置
for j in [1..category.unique().length-1]
	arrtitles[j].y = arrtitles[j-1].y+list.height*cgyArry[j-1].length+arrtitles[j].height

#为最后一个list元素添加下划线样式，i为json数据的长度
for i in [0..dataMenu.length-1]
	category.push(dataMenu[i].cgy)
	
listArry[i-1].shadowY = 1
listArry[i-1].shadowColor= "rgba(255,255,255,0.1)"


for c in [0..clientCgyArry.unique().length-1]
	list_bg.children[1].children[c].onClick (event, layer) ->
		print @.name

#侧边栏导航菜单交互

menuClickSound = new Audio("sounds/Tab2.m4a")

for b in [0..listArry.length-1]
	listArry[b].index = b;	
	listArry[b].isOn = false
	listArry[b].turnOn = -> @isOn = true
	listArry[b].turnOff = -> @isOn = false
	
	#添加交互状态
	listArry[b].states =
		mouseOver:
			backgroundColor:headingColorDark
		mouseOut:
			backgroundColor:"transparent"	
		onClick:
			backgroundColor:primaryColor		
	
	#初始化
	listArry[0].stateSwitch("onClick")
	listArry[0].turnOn()
	
	
	#菜单事件
	listArry[b].onMouseOver (event, layer) ->
# 		print @isOn
		#如果开关为关那么切换mouseOver状态
		if @isOn is false then @stateSwitch("mouseOver")
		#如果开关为开那么切换onClick状态
		if @isOn is true then @stateSwitch("onClick")
		
	listArry[b].onMouseOut (event, layer) ->
		#如果开关为关那么切换mouseOut状态
		if @isOn is false then @stateSwitch("mouseOut")
		#如果开关为关那么切换onCLick
		if @isOn is true then @stateSwitch("onClick")
	
	listArry[b].onClick (event, layer) ->
# 		print @index
		menuClickSound.play()
		listArry[0].turnOff()
		#先把所有list样式重置为default 并且关闭开关
		for b in [0..listArry.length-1]
			listArry[b].stateSwitch("default")
			listArry[b].turnOff()
			listArry[b].children[2].image = iconpicArry[b]
		#打开开关
		@turnOn()
		#如果开关为打开则切换onClick状态
		if @isOn is true then @stateSwitch("onClick") and @children[2].image = iconpicSelArry[@index]
		#如果开关为打关则切换default状态
		if @isOn is false then @stateSwitch("default") and @children[2].image = iconpicArry[@index]
		
# 		print @children[2].image
# 	print listArry[b].children[2].image


#创建内容模块
contentArry = []

for b in [0..listArry.length-1]
	listArry[b].index = b;	
	content = new Layer
		width: Screen.width-sideBar.width
		height: Screen.height
		x: sideBar.width
		backgroundColor: backgroundColorBase
		visible: false
		
# 	content.states = 
# 		show:
# 			visible = true
# 		hidden:
# 			visible = false		
		
	content.placeBehind(topBar)	
	
	pageName = new TextLayer
		parent: content
		x: 24
		y: 72
		width: 250
		text: listArry[b].children[1].text
		fontSize: 32
		fontFamily: "PingFang SC"
		fontWeight: 500
		textAlign: "left"
		color: "rgba(74,81,92,1)"
		
	contentArry.push(content)	
	contentArry[0].visible = true
		
	listArry[b].onClick (event, layer) ->
# 		print @index
		listArry[0].turnOff()
		#先把所有list样式重置为default 并且关闭开关
		for b in [0..listArry.length-1]
			contentArry[b].visible = false
			listArry[b].turnOff()
		#打开开关
		@turnOn()
		#如果开关为打开则切换onClick状态
		if @isOn is true then contentArry[this.index].visible = true
		#如果开关为打关则切换default状态
		if @isOn is false then contentArry[this.index].visible = false


#概览页

OverviewData = clientdata = [{cgy:"用户分析",name:"活跃用户(访问用户)",yesData:"9237",cp_yesRate:"↑0.32%",chart:"images/chart01.svg";},{cgy:"用户分析",name:"新增用户(登录用户)",yesData:"4937",cp_yesRate:"↓0.21%",chart:"images/chart02.svg";},{cgy:"转化分析",name:"UV访问率(访问用户)",yesData:"43.1%",cp_yesRate:"↑0.42%",chart:"images/chart03.svg";},{cgy:"转化分析",name:"注册UV总转化率",yesData:"36.1%",cp_yesRate:"0.32%↑",chart:"images/chart04.svg";}]


#制作一个2列的视图矩阵

row = 0
col = 0

for i  in [0..OverviewData.length-1]
	if i%2 == 0
		row=0
		col++
	uV = new Layer
		parent: contentArry[0]
		x: 24+(content.width*0.49)*row
		y: 156+(content.height*0.4+16)*(col-1)
		backgroundColor: "#FFF"
		width: (content.width-48)*0.49
		height: content.height*0.4
	row++	

#填充内容
	viewBg = new Layer
		parent: uV
		x: 0
		y: 0
		width: (content.width-48)*0.49
		height: content.height*0.4
		backgroundColor: "rgba(255,255,255,1)"
		
	viewChart = new Layer
		parent: uV
		x: 16
		y: Align.bottom(-16)	
		width: uV.width-32
		height: uV.height*0.65
		backgroundColor: "transparent"
		image: OverviewData[i].chart
	
	totalDataGroup = new Layer
		parent: uV
		x: 16
		y: 69
		backgroundColor: "transparent"
		width: 222
		height: 37
	
	ydy = new TextLayer
		parent: totalDataGroup
		x: 0
		y: 5
		width: 29.02638522427441
		text: "昨 日"
		fontSize: 12
		fontFamily: "PingFang SC"
		fontWeight: 500
		textAlign: "right"
		color: "rgba(74,81,92,1)"
	
	totalValue = new TextLayer
		parent: totalDataGroup
		x: 41
		y: 0
		text: OverviewData[i].yesData
		fontSize: 32
		fontFamily: "ADZongYi-A001"
		textAlign: "right"
		color: "rgba(74,81,92,1)"
	
	weekCp = new TextLayer
		parent: totalDataGroup
		x: ydy.width+totalValue.width+32
		y: 23
		width: 40
		text: "周同比"
		fontSize: 9
		fontFamily: "PingFang SC"
		fontWeight: 400
		textAlign: "left"
		color: "rgba(74,81,92,1)"
		opacity: 0.8
	
	yesData = new TextLayer
		parent: totalDataGroup
		x: ydy.width+totalValue.width+32
		y: 3
		width: 90
		text: OverviewData[i].cp_yesRate
		fontSize: 12
		fontFamily: "Lucida Grande"
		textAlign: "left"
		color: "rgba(42,210,195,1)"
	
	title = new Layer
		parent: uV
		x: 0
		y: 16
		backgroundColor: "transparent"
		width: (content.width-48)*0.49
		height: 20
	
	detail = new TextLayer
		parent: title
		x: Align.right(-16)
		y: 0
		text: "更多详情"
		fontSize: 12
		fontFamily: "PingFang SC"
		fontWeight: 400
		textAlign: "right"
		color: "rgba(0,154,232,1)"
	
	view_title = new Layer
		parent: title
		x: 16
		y: 0
		backgroundColor: "transparent"
		width: 199
		height: 20
	
	viewName = new TextLayer
		parent: view_title
		x: 0
		y: 0
		text: OverviewData[i].name
		fontSize: 14
		fontFamily: "PingFang SC"
		fontWeight: 500
		textAlign: "right"
		color: "rgba(74,81,92,1)"
	
	info_icon = new Layer
		parent: view_title
		x: viewName.width+12
		y: 0
		width: 16
		height: 16
		backgroundColor: "transparent"
		image: "images/info_icon.svg"
		
	copySQL = new TextLayer
		parent: view_title
		x: info_icon.width+viewName.width+22
		y: 0
		text: "复制SQL"
		fontSize: 12
		fontFamily: "PingFang SC"
		fontWeight: 400
		textAlign: "left"
		color: "rgba(0,154,232,1)"
		width: 120
		height: 16	



		
		



	
