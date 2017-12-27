# Info 
Framer.Info =
	title: "dashboard"
	author: "snow_sheng"
	twitter: "奔跑の刷牙君"
	description: "analysis of user behaviors dashboard"
	
#初始化
{DynamicLoader} = require "DynamicLoader"

# GRADIENT_COLOR1_1 = '#199BE5'
# GRADIENT_COLOR1_2 = '#2DC3ED'

CHARTIST = [
	"./vendor/chartist.min.css",
	"./vendor/chartist.min.js",
	"//cdn.jsdelivr.net/jquery/2.1.4/jquery.min.js"
	"./vendor/chartist-plugin-fill-donut.js",
	"./vendor/custom.css"
]

#网页浏览光标样式
document.body.style.cursor ="auto"
# Set Screen background
Screen.backgroundColor = backgroundColorBase
headingColor="#343F4F";
headingColorDark="#2B3441";
backgroundColorBase = "#F2F3F8"
primaryColor = "rgba(24,165,217,100)"
primaryColor01 = "#C5E1ED"
textColor = "#4A515C"

#创建存储分类标题的数组
arrtitles = []
#存放归类后的菜单json数据
category = []
#新建一个数组用来存储按类别筛选的数据
cgyArry = [];
#菜单选项列表
listArry = [];	
#菜单图标数组
iconpicArry = []
iconpicSelArry = []

#按类别重新排序
clientdataCgy = []
#存放平台数据类别数组
clientCgyArry = []

#存放平台数据名称数组
clientNameArry = []

#存放次级导航菜单的数组
secondaryItemArry = [] 

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

#json数据
#侧边栏菜单
dataMenu = [{cgy:"概览",name:"概览",iconpic:"images/01_nor.svg",iconpicSel:"images/01_sel.svg";},{cgy:"用户分析",name:"新增用户",iconpic:"images/02_nor.svg",iconpicSel:"images/02_sel.svg";},{cgy:"用户分析",name:"活跃用户",iconpic:"images/03_nor.svg",iconpicSel:"images/03_sel.svg";},{cgy:"用户分析",name:"版本统计",iconpic:"images/04_nor.svg",iconpicSel:"images/04_sel.svg";},{cgy:"转化分析",name:"UV访购率",iconpic:"images/05_nor.svg",iconpicSel:"images/05_sel.svg";},{cgy:"转化分析",name:"注册UV转化率",iconpic:"images/06_nor.svg",iconpicSel:"images/06_sel.svg";},{cgy:"功能",name:"页面流量",iconpic:"images/07_nor.svg",iconpicSel:"images/07_sel.svg";},{cgy:"功能",name:"功能点击",iconpic:"images/08_nor.svg",iconpicSel:"images/08_sel.svg";}]

dataMenuH5 = [{cgy:"概览",name:"概览",iconpic:"images/01_nor.svg",iconpicSel:"images/01_sel.svg";},{cgy:"转化分析",name:"注册UV转化率",iconpic:"images/06_nor.svg",iconpicSel:"images/06_sel.svg";},{cgy:"功能",name:"页面流量",iconpic:"images/07_nor.svg",iconpicSel:"images/07_sel.svg";},{cgy:"功能",name:"功能点击",iconpic:"images/08_nor.svg",iconpicSel:"images/08_sel.svg";}]

#平台下拉选项数据
clientdata = [{cgy:"APP",name:"appitem01"},{cgy:"APP",name:"appitem02"},{cgy:"APP",name:"appitem03"},{cgy:"WEB",name:"webitem01"},{cgy:"WEB",name:"webitem02"},{cgy:"APP",name:"appitem04"},{cgy:"APP",name:"appitem05"},
{cgy:"APP",name:"appitem06"},
{cgy:"WEB",name:"webitem03"},
{cgy:"WEB",name:"webitem04"},]

#概览页
OverviewData  = [{cgy:"用户分析",name:"新增用户(登录用户)",yesData:"4937",cp_yesRate:"↓0.21%",chart:"images/chart02.svg";},{cgy:"用户分析",name:"活跃用户(访问用户)",yesData:"9237",cp_yesRate:"↑0.32%",chart:"images/chart01.svg";},{cgy:"转化分析",name:"UV访问率(访问用户)",yesData:"43.1%",cp_yesRate:"↑0.42%",chart:"images/chart03.svg";},{cgy:"转化分析",name:"注册UV总转化率",yesData:"36.1%",cp_yesRate:"0.32%↑",chart:"images/chart04.svg";}]


# dataMenu.destroy()
			
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
	y: Align.center
	width: 0.5
	height: 16

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

#WEB菜单交互

changetoWeb = ->
	dataMenu = dataMenuH5
changetoAPP = ->
	dataMenu != dataMenuH5
# changetoWeb()


#全局函数
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

#创建一个函数把类别字段丢进category数组
category.pushCgy = ->
	for i in [0..dataMenu.length-1]
		category.push(dataMenu[i].cgy)
category.pushCgy()
		
for i in [0..dataMenu.length-1]
	iconpicArry.push(dataMenu[i].iconpic)
	iconpicSelArry.push(dataMenu[i].iconpicSel)

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

# 遍历数据类别	
for j in [0..category.unique().length-1]
	#按类别数量新建空数组
	cgyArry[j] = []
	#遍历数据源
	for a in [0..dataMenu.length-1]
	#如果数据源中找到该类别则依次丢到新建的数组
		if dataMenu[a].cgy == category.unique()[j] then cgyArry[j].push(dataMenu[a])
	


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

		
# 数字滚动函数		
receiptsStart = 0
receiptsMax = receiptsStart++

start = [receiptsStart,receiptsStart]
maxium = [receiptsMax,receiptsMax]
moneyCount = (i,countLayer) ->
	if start[i] < maxium[i]
		Utils.delay receiptsStart*0.000000001, ->
			showNumber = Utils.round(start[i],0)
			countLayer.text = showNumber.toFixed(0)
			start[i] = start[i]+maxium[i]/80
			moneyCount(i,countLayer)
	else 
		maxium[i]+=2000
		



#侧边栏(平台筛选)
selectSound= new Audio("sounds/Tab1.m4a")
selectEndSound = new Audio("sounds/Tab1.m4a")
	
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
	y: logo.y+40
	backgroundColor: "transparent"
	width: 224
	height: 70

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
		x: 80
		y: 80+32*c
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


# print clientdataCgy
# 	print @isOn
#点击展示子项目
client.onClick (event, layer) ->
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
		
		
# print clientdataCgy		

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

# print cgyArry

#重置title和其子元素的位置
for j in [1..category.unique().length-1]
	arrtitles[j].y = arrtitles[j-1].y+list.height*cgyArry[j-1].length+arrtitles[j].height

#为最后一个list元素添加下划线样式，i为json数据的长度
for i in [0..dataMenu.length-1]
	category.push(dataMenu[i].cgy)
	
listArry[i-1].shadowY = 1
listArry[i-1].shadowColor= "rgba(255,255,255,0.1)"

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
		
# 		for i in [0..totalValueArry.length-1]
# 			totalValueArry[i].text = OverviewData[i].yesData
# 			print totalValueArry[i].text
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
		#如果下拉选择器为打开，则点击菜单导航收起
		for i in [0..list_bg.children.length-1]
			list_bg.children[i].visible = false
		arrow_down.stateSwitch("onClickBack") and client.isOn = false
		client.stateSwitch("mouseOut")
# 		for i in [0..totalValueArry.length-1]
# 			totalValueArry[i].text = OverviewData[i].yesData		
# 			moneyCount(i,totalValueArry[i])
# 	print listArry[b].children[2].image

#概览页
#创建内容模块
contentArry = []
uVarry = []
# print clientNameArry
totalValueArry = []
tooltipsArry = []
copySQLarry = []
tipSound = new Audio("sounds/Button2.m4a")
SuccSound = new Audio("sounds/Success3.m4a")

#toast

# print Screen.midX
toast = new Layer
	x: Screen.midX+30
	y: 32
	backgroundColor: "transparent"
	width: 236
	height: 34
	opacity: 0

toastbg = new Layer
	parent: toast
	x: 0
	y: 0
	width: 144
	height: 34
	backgroundColor: "rgba(255,255,255,1)"
	borderRadius: 6
	shadowColor: "rgba(0,0,0,0.2)"
	shadowX: 0
	shadowY: 2
	shadowBlur: 8
	shadowSpread: 0

toastTxt = new TextLayer
	parent: toast
	x: 40
	y: 8
	width: 180
	text: "SQL复制成功"
	fontSize: 12
	fontFamily: "PingFang SC"
	fontWeight: 400
	letterSpacing: 0.0
	lineHeight: 1.5
	textAlign: "left"
	color: "rgba(102,102,102,1)"
	
icon_succ = new Layer
	parent: toast
	x: 17
	y: 10
	backgroundColor: "transparent"
	width: 14
	height: 14
	image: "images/icon_succ.svg"	

toastShow= ->	
	toastMotionA = new Animation toast,
		y: 80
		opacity: 1
		options:
			time: 0.2
			curve: pop			
	
	toastMotionB = new Animation toast,
		opacity:0
		options:
			time: 0.2
			delay: 0.5
			
	toastMotionA.on Events.AnimationEnd, toastMotionB.start	
	toastMotionA.start()
	toastMotionB.on Events.AnimationEnd, ->
		toastMotionA.reset()
# 		toastMotionB.reset()



for b in [0..listArry.length-1]
	listArry[b].index = b;	
	content = new Layer
		width: Screen.width-sideBar.width
		height: Screen.height
		x: sideBar.width
		backgroundColor: backgroundColorBase
		visible: false	
		
	content.placeBehind(topBar)
	
	
	loadingImg = new Layer
		parent: content
		width: 96
		height: 96
		x: Align.center
		y: Align.center(20)
		fontSize: 12
		scale: 0.6
# 		text: "comming soon..."
# 		backgroundColor: "#CCC"
		image: "images/loading.gif"
		z: 0	
	
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
		
	# animationA.on(Events.AnimationEnd, animationB.start)		
					
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
		y: 128+(content.height*0.4+16)*(col-1)
		backgroundColor: "#FFF"
		width: (content.width-48)*0.49
		height: content.height*0.4
	row++	
	
	uVarry.push(uV)
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
		y: Align.bottom()	
		width: uV.width-32
		height: uV.height*0.8
		backgroundColor: "transparent"
		clip: true
# 		image: OverviewData[i].chart
	
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
	
	receiptsStart = OverviewData[i].yesData
		
	totalValueArry.push(totalValue)
	
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
		
	info_icon.isOn = false
	
	tooltips = new Layer
		parent: info_icon
		x: -54
		y: -40
		backgroundColor: "transparent"
		width: 124
		height: 38
		originY: 1
		scale: 0
		opacity: 0
	
	combinedShape = new Layer
		parent: tooltips
		x: -100+64
		y: 0
		width: 200
		height: 33.99999999999999
		backgroundColor: "rgba(51,56,64,0.85)"
		borderRadius: 4
		shadowColor: "rgba(0,0,0,0.2)"
		shadowX: 0
		shadowY: 1
		shadowBlur: 6
		shadowSpread: 0
	
	triangle = new Layer
		parent: tooltips
		x: Align.center
		y: 34
		width: 7
		height: 4
		backgroundColor: "transparent"
		image: "images/triangle.svg"
		rotation: 180
	
	tooltip_txt = new TextLayer
		parent: combinedShape
		x: Align.center
		y: Align.center
		width: combinedShape.width
		text: "这里展示"+OverviewData[i].name+"的说明"
		fontSize: 12
		fontFamily: "PingFang SC"
		fontWeight: 400
		lineHeight: 1.5
		textAlign: "center"
		color: "rgba(255,255,255,1)"

	tooltipsArry.push(tooltips)
	
	tooltips.states.show =
		scale:1
		opacity: 1
		animationOptions:
			curve: pop
			time: 1
			
	tooltips.states.hidden =
		scale:0
		opacity: 0
		animationOptions:
			curve: pop
			time: 1  
	
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
	
	copySQLarry.push(copySQL)	
	
	info_icon.onClick (event, layer) ->
# 		print @isOn
		tipSound.play()
		for i in [0..OverviewData.length-1]
			tooltipsArry[i].stateSwitch("hidden") and tooltipsArry[i].isOn = false
		if @isOn is false then @children[0].stateSwitch("show") and @isOn = true
		else @children[0].stateSwitch("hidden") and @isOn = false	
		
# 	moneyCount(0,totalValueArry[0])
# 	moneyCount(1,totalValueArry[1])
	for i in [0..totalValueArry.length-1]	
		moneyCount(i,totalValueArry[i])


for i in [0..copySQLarry.length-1]
	copySQLarry[i].onClick (event, layer) ->
		SuccSound.play()
		toastShow()

contentArry[0].children[0].visible = false
# for i  in [0..OverviewData.length-1]
# 	copySQL.onClick (event, layer) ->
# 		toastShow()

# for b in [0..listArry.length-1]
# 	listArry[b].index = b;	
# 	listArry[b].isOn = false
# 	listArry[b].turnOn = -> @isOn = true
# 	listArry[b].turnOff = -> @isOn = false
# 	listArry[b].onClick (event, layer) ->
# # 		print @index
# 		menuClickSound.play()
# 		listArry[0].turnOff()
# 		
# # 		for i in [0..totalValueArry.length-1]
# # 			totalValueArry[i].text = OverviewData[i].yesData
# # 			print totalValueArry[i].text
# 		#先把所有list样式重置为default 并且关闭开关
# 		for b in [0..listArry.length-1]
# 			listArry[b].stateSwitch("default")
# 			listArry[b].turnOff()
# 			listArry[b].children[2].image = iconpicArry[b]
# 		#打开开关
# 		@turnOn()
# 		#如果开关为打开则切换onClick状态
# 		if @isOn is true then @stateSwitch("onClick") and @children[2].image = iconpicSelArry[@index]
# 		#如果开关为打关则切换default状态
# 		if @isOn is false then @stateSwitch("default") and @children[2].image = iconpicArry[@index]
# 		#如果下拉选择器为打开，则点击菜单导航收起
# 		for i in [0..list_bg.children.length-1]
# 			list_bg.children[i].visible = false
# 		arrow_down.stateSwitch("onClickBack") and client.isOn = false


#点击详情切换导航
#view1_detail1
contentArry[0].children[2].children[0].onClick (event, layer) ->
	menuClickSound.play()
# 	print listArry[1]
	listArry[0].turnOff()
	for b in [0..listArry.length-1]
		listArry[b].stateSwitch("default")
		listArry[b].turnOff()
		listArry[b].children[2].image = iconpicArry[b]
	#打开开关
	listArry[1].turnOn()
	#如果开关为打开则切换onClick状态
	if listArry[1].isOn is true then listArry[1].stateSwitch("onClick") and listArry[1].children[2].image = iconpicSelArry[listArry[1].index]
	#如果开关为打关则切换default状态
	if listArry[1].isOn is false then listArry[1].stateSwitch("default") and listArry[1].children[2].image = iconpicArry[listArry[1].index]
	#如果下拉选择器为打开，则点击菜单导航收起
	for i in [0..list_bg.children.length-1]
		list_bg.children[i].visible = false
	arrow_down.stateSwitch("onClickBack") and client.isOn = false
	#如果开关为打开则切换onClick状态
	if listArry[1].isOn is true then contentArry[1].visible = true
	#如果开关为打关则切换default状态
	if listArry[1].isOn is false then contentArry[1].visible = false


#view2_detail2
contentArry[0].children[3].children[0].onClick (event, layer) ->
	menuClickSound.play()
# 	print listArry[2]
	listArry[0].turnOff()
	for b in [0..listArry.length-1]
		listArry[b].stateSwitch("default")
		listArry[b].turnOff()
		listArry[b].children[2].image = iconpicArry[b]
	#打开开关
	listArry[2].turnOn()
	#如果开关为打开则切换onClick状态
	if listArry[2].isOn is true then listArry[2].stateSwitch("onClick") and listArry[2].children[2].image = iconpicSelArry[listArry[2].index]
	#如果开关为打关则切换default状态
	if listArry[2].isOn is false then listArry[2].stateSwitch("default") and listArry[2].children[2].image = iconpicArry[listArry[2].index]
	#如果下拉选择器为打开，则点击菜单导航收起
	for i in [0..list_bg.children.length-1]
		list_bg.children[i].visible = false
	arrow_down.stateSwitch("onClickBack") and client.isOn = false
	#如果开关为打开则切换onClick状态
	if listArry[2].isOn is true then contentArry[2].visible = true
	#如果开关为打关则切换default状态
	if listArry[2].isOn is false then contentArry[2].visible = false	
	

#view3_detail3
contentArry[0].children[4].children[0].onClick (event, layer) ->
	menuClickSound.play()
# 	print listArry[4]
	listArry[0].turnOff()
	for b in [0..listArry.length-1]
		listArry[b].stateSwitch("default")
		listArry[b].turnOff()
		listArry[b].children[2].image = iconpicArry[b]
	#打开开关
	listArry[4].turnOn()
	#如果开关为打开则切换onClick状态
	if listArry[4].isOn is true then listArry[4].stateSwitch("onClick") and listArry[4].children[2].image = iconpicSelArry[listArry[4].index]
	#如果开关为打关则切换default状态
	if listArry[4].isOn is false then listArry[4].stateSwitch("default") and listArry[4].children[2].image = iconpicArry[listArry[4].index]
	#如果下拉选择器为打开，则点击菜单导航收起
	for i in [0..list_bg.children.length-1]
		list_bg.children[i].visible = false
	arrow_down.stateSwitch("onClickBack") and client.isOn = false
	#如果开关为打开则切换onClick状态
	if listArry[4].isOn is true then contentArry[4].visible = true
	#如果开关为打关则切换default状态
	if listArry[4].isOn is false then contentArry[4].visible = false	
	

#view4_detail4
contentArry[0].children[5].children[0].onClick (event, layer) ->
	menuClickSound.play()
# 	print listArry[5]
	listArry[0].turnOff()
	for b in [0..listArry.length-1]
		listArry[b].stateSwitch("default")
		listArry[b].turnOff()
		listArry[b].children[2].image = iconpicArry[b]
	#打开开关
	listArry[5].turnOn()
	#如果开关为打开则切换onClick状态
	if listArry[5].isOn is true then listArry[5].stateSwitch("onClick") and listArry[5].children[2].image = iconpicSelArry[listArry[5].index]
	#如果开关为打关则切换default状态
	if listArry[5].isOn is false then listArry[5].stateSwitch("default") and listArry[5].children[2].image = iconpicArry[listArry[5].index]
	#如果下拉选择器为打开，则点击菜单导航收起
	for i in [0..list_bg.children.length-1]
		list_bg.children[i].visible = false
	arrow_down.stateSwitch("onClickBack") and client.isOn = false
	#如果开关为打开则切换onClick状态
	if listArry[5].isOn is true then contentArry[5].visible = true
	#如果开关为打关则切换default状态
	if listArry[5].isOn is false then contentArry[5].visible = false		

##Constants

DATA_AMOUNT = 15
LINE_CHART_HEIGHT = 300
FADE_CURVE = curve: "spring(100, 0, 10)"
FILL_COLOR = 'rgb(46, 59, 71)'
GRADIENT_COLOR1_1 = '#199BE5'
GRADIENT_COLOR1_2 = '#2DC3ED'
GRADIENT_COLOR2_1 = '#4ED6EE'
GRADIENT_COLOR2_2 = '#CDC01D'
GRADIENT_COLOR3_1 = '#B455FF'
GRADIENT_COLOR3_2 = '#3B6CEE'

newDataGroups = []

days = ["12/01","12/02","12/03","12/04","12/05","12/06","12/07","12/08","12/09","12/10","12/11","12/12","12/13","12/14","12/15"] 
newData1 = ["1256","1650","1988","2445","2566","2790","2664","2812","2913","2873","3160","2905","3045","2912","3123","3212"]
newData2 = ["2156","3550","5801","4677","3216","4801","3260","5691","5901","4873","6360","8505","9675","8514","6746","9607"]
newData3 = ["42.1%","36.1%","49.1%","46.7%","38.1%","48.5%","42.6%","48.5%","49.5%","48.7%","53.6%","49.2%","54.2%","52.3%","51.2%","57.5%"]
newData4 = ["32.1%","31.5%","39.1%","26.7%","18.1%","28.5%","32.6%","38.5%","29.5%","38.7%","23.6%","29.2%","24.2%","32.3%","31.2%","27.5%"]

newDataGroups.push(newData1,newData2,newData3,newData4)
TrendChartGroup = []
# for i  in [0..OverviewData.length-1]


#line1
lineOptions1 = 
# 		parent: uVarry[i].children[1]
	height: "#{uVarry[0].children[1].height*0.9}"
	width: "#{uVarry[0].children[1].width}"
	showPoint: true
	chartPadding:
		top: 60 
		left: 0
	axisX:
		showGrid: false
	axisY:
		onlyInteger: true
		offset: 20
		scaleMinSpace: 50
		labelInterpolationFnc: (value) ->
			"#{value}"

lineOptions2 = 
# 		parent: uVarry[i].children[1]
	height: "#{uVarry[1].children[1].height*0.9}"
	width: "#{uVarry[1].children[1].width}"
	showPoint: true
	chartPadding:
		top: 60 
		left: 0
	axisX:
		showGrid: false
	axisY:
		onlyInteger: true
		offset: 20
		scaleMinSpace: 50
		labelInterpolationFnc: (value) ->
			"#{value}"

lineOptions3 = 
# 		parent: uVarry[i].children[1]
	height: "#{uVarry[2].children[1].height*0.9}"
	width: "#{uVarry[2].children[1].width}"
	showPoint: true
	chartPadding:
		top: 60 
		left: 0
	axisX:
		showGrid: false
	axisY:
		onlyInteger: true
		offset: 20
		scaleMinSpace: 50
		labelInterpolationFnc: (value) ->
			"#{value}"

lineOptions4 = 
# 		parent: uVarry[i].children[1]
	height: "#{uVarry[3].children[1].height*0.9}"
	width: "#{uVarry[3].children[1].width}"
	showPoint: true
	chartPadding:
		top: 60 
		left: 0
	axisX:
		showGrid: false
	axisY:
		onlyInteger: true
		offset: 20
		scaleMinSpace: 50
		labelInterpolationFnc: (value) ->
			"#{value}"

# 	
#趋势图标容器	
TrendChartPlaceholder1 = new Layer
	parent: uVarry[0].children[1]
	width: uVarry[0].children[1].width
	height: uVarry[0].children[1].height
	backgroundColor: "#FFF"
	y: 32
	
TrendChartPlaceholder2 = new Layer
	parent: uVarry[1].children[1]
	width: uVarry[1].children[1].width
	height: uVarry[1].children[1].height
	backgroundColor: "#FFF"
	y: 32
	
TrendChartPlaceholder3 = new Layer
	parent: uVarry[2].children[1]
	width: uVarry[2].children[1].width
	height: uVarry[2].children[1].height
	backgroundColor: "#FFF"
	y: 32
	
TrendChartPlaceholder4 = new Layer
	parent: uVarry[3].children[1]
	width: uVarry[3].children[1].width
	height: uVarry[3].children[1].height
	backgroundColor: "#FFF"
	y: 32			
# TrendChartGroup.push()
#添加标签文字loading
Utils.labelLayer(TrendChartPlaceholder1, "Loading...")
TrendChartPlaceholder1.style = "font-size": "0.4em"
TrendChartPlaceholder1.style = "line-height": "26"

Utils.labelLayer(TrendChartPlaceholder2, "Loading...")
TrendChartPlaceholder2.style = "font-size": "0.4em"
TrendChartPlaceholder2.style = "line-height": "26"

Utils.labelLayer(TrendChartPlaceholder3, "Loading...")
TrendChartPlaceholder3.style = "font-size": "0.4em"
TrendChartPlaceholder3.style = "line-height": "26"

Utils.labelLayer(TrendChartPlaceholder4, "Loading...")
TrendChartPlaceholder4.style = "font-size": "0.4em"
TrendChartPlaceholder4.style = "line-height": "26"

defGradient = (ctx, name, startColor, endColor)->
	defs = ctx.svg.elem('defs')
	defs.elem('linearGradient', { id: name, x1: 0, y1: 1, x2: 0, y2: 0})
			.elem('stop', offset: 0, 'stop-color': startColor)
			.parent().elem( 'stop', offset: 1, 'stop-color': endColor )
			

DynamicLoader.series(CHARTIST).then(->
# 	print 1
	init = true
	lastPath = undefined
	#Draw trend line chart
	TrendChartPlaceholder1.width = viewChart.width
# 		for i in [[0..OverviewData.length-1]]
	TrendChartPlaceholder1.html = '<div id="trend"></div>'
	trendChart1 = new Chartist.Line '#trend',
#x轴的坐标无法展示？
# 		{ labels: days, series: [newData] },
	{ series: [newDataGroups[0]] },
	lineOptions1
		
	trendChart1.on 'created', (ctx)->
		init = true	
		ctx.svg.querySelectorAll('.ct-series')
			.attr 'transform':"translate( #{ctx.axisX.stepLength/2} )"
		defGradient ctx, 'gradient1', GRADIENT_COLOR1_1, GRADIENT_COLOR1_2
# 		defGradient ctx, 'gradient2', GRADIENT_COLOR2_1, GRADIENT_COLOR2_2
# 		defGradient ctx, 'gradient3', GRADIENT_COLOR3_1, GRADIENT_COLOR3_2
# 			
	trendChart1.on 'draw', (data)->
		if data.type is 'label' and data.axis is 'y' or data.type is 'grid'
			data.element.animate
				opacity:
					dur: 500
					from: 0
					to: 1
					easing: Chartist.Svg.Easing.easeOut

		if data.type is 'point'
			# Dynamic color point 				
			data.element.attr 
				style: "stroke: #{Color.mix(GRADIENT_COLOR1_1, GRADIENT_COLOR1_2, Chartist.getMultiValue(data.value) / _.max(data.series))}"
			# Animate point 			
			data.element.animate
				opacity: 
					dur: 250
					begin: 800
					from: 0
					to: 1
					easing: Chartist.Svg.Easing.easeOutQuint
		 					 			
		if data.type is 'line'
			# create bounding box for gradient color
			data.element.attr
				x1: data.x1 + 0.001
			# Animate line
			data.element.animate 
				d: 
					dur: 1000
					from: if lastPath is undefined then data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify() else lastPath
					to: data.path.clone().stringify()
					easing: Chartist.Svg.Easing.easeOutQuint
			# Save previous line path  			
			if init is true
				lastPath = data.path.clone().stringify()
				init = false
				
				
	TrendChartPlaceholder1.width = viewChart.width
	TrendChartPlaceholder1.html = '<div id="trend"></div>'
	trendChart1 = new Chartist.Line '#trend',
	{ series: [newDataGroups[0]] },
	lineOptions1
		
	trendChart1.on 'created', (ctx)->
		init = true	
		ctx.svg.querySelectorAll('.ct-series')
			.attr 'transform':"translate( #{ctx.axisX.stepLength/2} )"
		defGradient ctx, 'gradient1', GRADIENT_COLOR1_1, GRADIENT_COLOR1_2 			
	trendChart1.on 'draw', (data)->
		if data.type is 'label' and data.axis is 'y' or data.type is 'grid'
			data.element.animate
				opacity:
					dur: 500
					from: 0
					to: 1
					easing: Chartist.Svg.Easing.easeOut

		if data.type is 'point'
			# Dynamic color point 				
			data.element.attr 
				style: "stroke: #{Color.mix(GRADIENT_COLOR1_1, GRADIENT_COLOR1_2, Chartist.getMultiValue(data.value) / _.max(data.series))}"
			# Animate point 			
			data.element.animate
				opacity: 
					dur: 250
					begin: 800
					from: 0
					to: 1
					easing: Chartist.Svg.Easing.easeOutQuint
		 					 			
		if data.type is 'line'
			# create bounding box for gradient color
			data.element.attr
				x1: data.x1 + 0.001
			# Animate line
			data.element.animate 
				d: 
					dur: 1000
					from: if lastPath is undefined then data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify() else lastPath
					to: data.path.clone().stringify()
					easing: Chartist.Svg.Easing.easeOutQuint
			# Save previous line path  			
			if init is true
				lastPath = data.path.clone().stringify()
				init = false			
				
				
													
)

