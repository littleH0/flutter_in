##### 1.首页顶部图会经常变动吗，（直接一张图放上去呢）   有主题色调整涉及到
##### 2.padding   container  
##### 3.页面部分组件封装，交互部分数据封装？
##### 4.和后台交互部分的代码编写，不同于vue的单文件组件
##### 5.xxx的牌局页面顶部好像覆盖掉了两条数据
##### 6.

#### 代码文件说明
#### club
###### club_bindemail           "俱乐部" -> "详情" -> "绑定邮箱"   验证码不要了？
###### club_config              "俱乐部" -> "详情" -> "设置"   可编辑俱乐部简介 好像没有做
###### club_create              "俱乐部" -> "创建俱乐部"
###### club_infomation          "俱乐部" -> "详情"     nowClubInfo 好像还没有获取   创建牌局没有做   memberListInCell 是一个头像？  roomCell 牌局牌局记录没有做
###### club_join                "俱乐部" -> "加入俱乐部"
###### club_main                "俱乐部"
###### club_memberList          "俱乐部" -> "详情" -> "设置管理员" -> "成员表选择/搜索"
###### club_setAdmin            "俱乐部" -> "详情" -> "设置管理员"(群主)
###### message_info             "消息" -> 具体消息     牌局请求中的拒绝/同意 事件还没做
###### message_list             "消息"    包括 俱乐部，房间，系统 TabBar    showMyMaterialDialog 好像没用到
#### home
###### game_coll_call           还没写代码  应该是手机筹码的 "动画" 部分
###### game_main                1.房主点击新消息，游戏部分需要处理一下吗，2.
###### game_sound               音频   播放、释放
###### game_var                 游戏中的各种变量，及一些方法
###### home_create_game         "首页" -> "创建牌局"
###### home_main                "首页" "主页"
###### person_round_painter     绘制 哪里？
#### httprequest
###### getuserinfo    存储和获取用户个人信息，用户退出登录等
###### httprequest    封装的网络请求，及一个图片上传操作函数   FlutterToast可以用 util/viewconfig 中的 showToast 改装替换
###### socketUtil     和服务器的 socket 的连接   初始定义的一些值是不是用 final int 更标准些
######
###### usermodel      用户类，用户名等一系列 “我的” 页面个人信息，当前手机的主人
#### login
###### login_main             用户密码或验证码登录
###### login_prefer_info      注册后完善资料部分，资料完善完成跳转到主页后获取个人信息部分可能会有问题，（作者已经有了备注)
###### login_reg              用户注册或重置密码，重置密码部分还未完成
#### mine
###### mine_cardinfo          "我的" -> "牌谱" -> "牌谱详情"
###### mine_cardslist         "我的" -> "牌谱"
###### mine_changeavatar      "未完成 或 废弃 的代码"
###### mine_data              "我的" -> "数据"
###### mine_main              "我的"
###### mine_scoreinfo         "我的” -> "战绩" -> "牌局"    （可优化顶部第二部分：三个图标三个说明）
###### mine_scorelist         "我的" -> "战绩"
###### mine_setting           "我的" -> "设置"
#### provider          如名字一样，【但不是很懂】
###### game_cards_provider
###### game_message_provider
###### game_seat_provider
#### routes             dart 文件，类 route_handler - > 对接 routes —> 全局使用 application
###### application      全局使用的名字，名字对应路径
###### route_handler    路由处理，名字对应 dart 文件 类
###### routes           配置路由，路径对应到文件 route_handler
#### style
###### jhpickertool     封装的，底部弹出的那种，时间选择   俱乐部免审那里
#### util
###### colorutil        十六进制颜色转换为 rgba
###### event_bus        事件的 on off emit 【不是很懂，需要详解】
###### jsonconver       json 和 str 的相互转换
###### logutil          日志打印控制   接受 socket 消息中，打印发送给服务器的信息
###### pubRequest       通过 cludId 获取俱乐部信息，跳转到俱乐部详细信息页，在俱乐部页面使用
###### stringutil       扑克牌图片地址，俱乐部，房间信息，用途：
###### viewconfig       屏幕宽高,字体大小(ssSp)设置，取消文本编辑（？），相机拍照组件，动画设置座位相对视图位置
#### widgets
###### country_select   注册页面，国家地区选择弹出框，用到了 util/stringutil 中的 areanoList 内容
###### custom_divider   定制分割线
###### game_widgets     游戏页面组件
######                  左上角下拉框、保险说明组件、下注/加注向上滑动组件、牌局设置(暂停 or 解散牌局还没做)、补充记分牌组件（购物车）、游客积分带入房主确认、
######                  购买保险中-边池、分享（二维码还没做）、用户个人信息对话框（点击特效部分未做）、计分器视图（RecordView 的第一个 Position 是什么）、
######                  聊天消息界面（好像逻辑有问题）、牌谱（区分牌型-规则）、单张卡牌封装的组件、、、
###### some_widgets     title + 输入框(普通和密码类)、手机号验证码、“我的”页面一些展示信息例如战绩个人信息等、带边框文本输入框、聊天消息界面（用到 Provder,消息判断不能单靠index吧）、、
######                  部分AppBar组件、文本线条小组件、网络图片缓存(俱乐部列表图像，)、(主要是)首页房间列表、头像(战绩，游戏页面等展示的头像)、俱乐部成员
#### main



##### some
###### progress_dialog        模态对话框
###### fluttertoast           toast 提示框
###### flutter_screenutil     屏幕基础信息，可用来做适配
###### image_cropper          裁剪图片
###### RelativeRect.fromLTRB  设置座位位置，动画区域距离容器上下左右的距离
###### flutter_picker         选择器（时间）
###### cached_network_image   从网络获取图片并保存到缓存
###### WillPopScope           处理是否离开当前页面   FacePoker中有两个页面不能反悔，只能通过代码设置的页面
###### shared_preferences     轻量级存储类，键值对形式保存设置属性和数据
###### flutter_swiper         flutter 中的轮播图插件
###### Text.rich(TextSpan)    富文本，TextSpan是类型，比如一段文本中需要不同的字体样式
###### CircularProgressIndicator   进度条  圆形
###### SizedBox   组件深入学习    会强制设置它的孩子的宽度或高度为指定值
###### SingleChildScrollView
###### ListView.Builder    https://www.cnblogs.com/Im-Victor/p/12668592.html
###### ListView.Builder 的 shrinkWrap 该属性将决定列表的长度是否仅包裹其内容的长度。当ListView嵌在一个无限长的容器组件中时，shrinkWrap必须为true，否则Flutter会给出警告；
###### SingleTickerProviderStateMixin
###### Navigator.pop()  Navigator.of(context).pop()  "当前弹出框关闭"
###### PinCodeTextField       输入数字，不定个数，以单个下划线形式展示
###### 关于 dispose() 的理解
###### key GlobalKey 的使用
###### CupertinoTextField  prefix
###### audioplayers  音频播放
###### ?. 条件成员访问运算符  若调用的对象是非 null 值就会正常访问，否则返回 null,但不会产生错误
###### CustomPainter 绘图 类 canvas
###### EdgeInsets.fromLTRB 分别指定四个方向的填充(空白)
###### GridView
###### State 对象的生命周期：createState -> initState -> didChangeDependencies -> build
###### 导入的 package:star 中 star 是当前项目报名，可在 pubspec.yaml 中定义
###### 8.event.emit("eventname") 中 eventname 在哪里被发起？   emit()改变一个事件，on()监听到了后做具体改变



##### 完整代码部分问题
###### 1. util/event_bus 中的内容不是很懂   观察者模式   provider 是 订阅者模式，为什么不用订阅者模式？
###### 6.provider 文件夹下的内容不是很懂
###### 10.tab   stack
###### 12.util/viewconfig 中的 cancelTextEdit 没懂
###### 14. Function dismiss
###### 15.不是很懂 socket 的逻辑
###### 16. home/game_widgets 的聊天界面中 Timer 没看懂
###### 17. home/game_main 511-516
###### 18.关于封装