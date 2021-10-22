### Flutter学习记录

#### What is Flutter?
Flutter是一个UI SDK（Software Development Kit）。
可以进行移动端（iOS、Android）,Web端（Beta）,桌面（technical preview）开发，是一种跨平台解决方案。
Flutter它是有一统大前端的野心的，并且正在侵蚀iOS、Android这些原生开发。
主流使用目前是移动端，移动端目前已经很多公司在用，Google、阿里、腾讯。

#### Flutter的特点？
1. 美观：Flutter内置美观的Material Design和Cupertino widget、丰富的mation API、平滑而自然的滑动效果和平台感知，极大地提升用户体验。
2. 快速：UI渲染性能好。在生产环境下，Flutter将代码编译成为机器码执行，并充分利用GPU的图形加速能力，因此使用Flutter开发的移动应用即使在低配手机上也能实现每秒60帧的UI渲染速度。
3. 高效：Hot Reload（热重载）。
4. 开放：Flutter是开放的，是一个完全开源的项目。


#### 运行一个Flutter项目：1.冷启动（从零启动 1m-5m）- 2.热重载（最主要是执行build方法）- 3.热重启（重新运行整个项目）

+ 在Flutter开发中，所有的Widget都不能定义状态（所有的属性都必须是final）
+ 有状态的Widget: StatefulWidget 在运行过程中有一些状态(data)需要改变
+ 无状态的Widget: StatelessWidget 内容是确定没有状态(data)的改变
+ @immutable 用于注释C类。指示C和C的所有子类型必须是不可变的。

setState方法只能定义在State类中，执行这个方法之后，能够更新State限定的StatefulWidget及其子Widget树。
Scaffold 我们可以将 Scaffold 理解为一个布局的容器。可以在这个容器中绘制我们的用户界面。


### Flutter 常用工具类、第三方库、插件如下

#### 1、屏幕适配 https://github.com/OpenFlutter/flutter_screenutil
flutter_screenutil: ^1.0.2

#### 2、网络请求库 https://github.com/flutterchina/dio
dio: ^3.0.9

#### 3、启动URL的插件，如：打开网址、发送邮件、拨打电话、发送短信、打开第三方APP
#### https://github.com/flutter/plugins/tree/master/packages/url_launcher
url_launcher: 5.4.1

#### 4、Flutter常用工具类库，Flustars依赖于Dart常用工具类库common_utils，以及对其他第三方库封装。
#### https://github.com/Sky24n/flustars
flustars: ^0.2.6+1

#### 5、Dart常用工具类库，包含日期，正则，倒计时，定时任务，时间轴 
#### https://github.com/Sky24n/common_utils
common_utils: ^1.1.3

#### 6、Flutter轮播插件， 多种布局方式，无限轮播 
#### https://github.com/best-flutter/flutter_swiper
flutter_swiper: ^1.1.6

#### 7、RxDart https://github.com/ReactiveX/rxdart
rxdart: ^0.23.1

#### 8、简单下拉刷新上拉加载 https://github.com/xuelongqy/flutter_easyrefresh
flutter_easyrefresh: ^2.1.0

#### 9、状态管理 https://github.com/rrousselGit/provider
provider: ^4.0.4

#### 10、路由框架 https://github.com/theyakka/fluro
fluro: ^1.6.1

#### 11、持久存储 https://github.com/flutter/plugins/tree/master/packages/shared_preferences
shared_preferences: ^0.5.6+3

#### 12、图片选择插件 https://github.com/flutter/plugins/tree/master/packages/image_picker
image_picker: ^0.6.6+4

#### 13、侧滑插件 https://github.com/letsar/flutter_slidable
flutter_slidable: ^0.5.4

#### 14、WebView插件 https://github.com/flutter/plugins/tree/master/packages/webview_flutter
webview_flutter: ^1.0.7

#### 15、键盘监听 https://github.com/diegoveloper/flutter_keyboard_actions/
keyboard_actions: ^3.2.0

#### 16、图片加载库 https://github.com/renefloor/flutter_cached_network_image
cached_network_image: ^2.0.0

#### 17、格式化String https://github.com/Naddiseo/dart-sprintf
sprintf: ^4.0.2

#### 18、列表悬浮头 https://github.com/fluttercommunity/flutter_sticky_headers
sticky_headers: ^0.1.8+1

#### 19、Flutter 城市列表，联系人列表，自定义Header，索引，悬停效果。
#### https://github.com/flutterchina/azlistview
azlistview: ^0.1.2

#### 20、手势识别 https://github.com/aleksanderwozniak/simple_gesture_detector
simple_gesture_detector: ^0.1.4

#### 21、汉字转拼音库 https://github.com/flutterchina/lpinyin
lpinyin: ^1.0.9

#### 22、国际化/多语言库 https://github.com/Sky24n/fluintl
fluintl: ^0.1.3

#### 23、UI组件库 https://github.com/flutterchina/flukit
flukit: ^1.0.2

#### 24、贝塞尔曲线图表库 https://github.com/aeyrium/bezier-chart
bezier_chart: ^1.0.16

#### 25、最全图表库 https://github.com/SunPointed/MPFlutterChart
mp_chart: ^0.1.8

#### 26、酷炫图表库 https://github.com/imaNNeoFighT/fl_chart
fl_chart: ^0.8.3

#### 27、获取网络连接信息插件 https://github.com/flutter/plugins/tree/master/packages/connectivity
connectivity: ^0.4.8+2

#### 28、oktoast https://pub.dev/packages/oktoast#-installing-tab-
oktoast: ^3.1.3+1

#### 29、加载Loading（指示器） https://github.com/jogboms/flutter_spinkit
flutter_spinkit: "^4.1.2"

#### 30、国际化/多语言 https://github.com/Sky24n/fluintl
fluintl: ^0.1.3

#### 31、微信SDK插件，它允许开发者调用 微信原生SDK https://github.com/OpenFlutter/fluwx
fluwx: ^2.3.0

#### 32、RatingBar星级评价 https://github.com/sarbagyastha/flutter_rating_bar
flutter_rating_bar: ^3.0.1+1

#### 33、图片预览，可单图片或多图片预览 https://github.com/fireslime/photo_view
photo_view: ^0.10.2

#### 34、创建二维码 https://github.com/lukef/qr.flutter
qr_flutter: ^3.2.0

#### 35、保存文件 https://github.com/hui-z/image_gallery_saver
image_gallery_saver: ^1.6.0

#### 36、路径获取工具 https://github.com/flutter/plugins
path_provider: ^1.6.24

#### 37、文件工具 https://github.com/mezoni/file_utils
file_utils: ^0.1.4

#### 38、事件总线 https://github.com/marcojakob/dart-event-bus
event_bus: ^1.1.1

#### 39、签名 https://github.com/4Q-s-r-o/signature
signature: ^3.2.0

# Flutter第三方插件汇总

## 图片

#### Image Picker - 图片选择器 https://pub.dev/packages/image_picker

#### Cached network image - 显示来自网络的图像并将其保存在缓存中 https://pub.dev/packages/cached_network_image

#### Image Cropper - 图片裁剪 https://pub.dev/packages/image_cropper

#### Flutter Advanced Network Image Provider - 高级图像缓存加载和缩放控制 https://pub.dev/packages/flutter_advanced_networkimage

#### photo - flutter做的ui,方便自定义修改 https://pub.dev/packages/photo

#### Multi Image Picker - 图片多选 https://pub.flutter-io.cn/packages/multi_image_picker

#### flutter photo view - 图片预览 https://pub.flutter-io.cn/packages/photo_view

#### extended image - 缓存图片,编辑图片,图片浏览,保存,瀑布流布局 https://pub.dev/packages/extended_image

## 二维码

#### QR Code Reader - QR扫描文件 https://pub.dev/packages/qrcode_reader

#### Fast QR Reader View - 快速扫描 https://pub.dev/packages/fast_qr_reader_view

#### qr flutter - 二维码生成,解码 https://pub.flutter-io.cn/packages/qr_flutter

#### QR Code Scanner - 二维码扫描 https://github.com/leyan95/qrcode_scanner

#### Barcode Scanner - 二维码扫描 https://pub.dev/packages/barcode_scan

## 聊天列表

#### Dialogflow - 聊天列表插件 https://github.com/VictorRancesCode/flutter_dialogflow

## 动画

#### Sequence Animation - 轻松实现复合交错的动画 https://github.com/Norbert515/flutter_sequence_animation

#### SpinKit - 加载动画指示器 https://github.com/jogboms/flutter_spinkit
 
#### VIllains - 页面转场动画 https://github.com/Norbert515/flutter_villains

#### SlimyCard - 一种将试图分离成两张卡片的酷炫粘液动画 https://github.com/AkashDivya/SlimyCard-Animated-Flutter-Package

#### Flutter Staggered Animations - 轻松的将交错的动画添加到您ListView，GridView，Column和Row https://pub.flutter-io.cn/packages/flutter_staggered_animations

#### Animated Text Kit - flutter文字动效组件 https://pub.flutter-io.cn/packages/animated_text_kit

#### like button - 点赞动画 https://pub.flutter-io.cn/packages/like_button

## 日历

#### Calendar - 日历 https://github.com/apptreesoftware/flutter_calendar

## 选择器

#### Flutter Picker - 选择器 https://github.com/yangyxd/flutter_picker

#### DateTimeField - 时间选择器 https://pub.flutter-io.cn/packages/datetime_picker_formfield

## 小红点

#### Badge - 小红点插件 https://pub.dev/packages/badge

## 视频

#### chewie - 基于video_palyer基础上包装了控制UI https://pub.dev/packages/chewie

#### Video Player - 视频播放器 https://pub.dev/packages/video_player

#### flutter video compress - 视频压缩,获取视频缩略图,视频信息 https://github.com/rurico/flutter_video_compress

#### Video Trimmer - 视频剪辑 https://github.com/sbis04/video_trimmer

## 音频

#### AudioPlayer - 一个播放远程或本地音频文件Flutter音频插件 https://pub.dev/packages/audioplayer

#### AudioPlayers - 支持同时播放多个音频并显示音量控制 https://pub.dev/packages/audioplayers

#### Audio recorder - 录音以及保存本地 https://pub.flutter-io.cn/packages/audio_recorder

#### Flutter Sound - 播放音频以及录音功能 https://pub.flutter-io.cn/packages/flutter_sound

#### flutter plugin record - 仿微信录音插件 https://github.com/yxwandroid/flutter_plugin_record

## 通知

#### LocalNotification - 这个库能让你在Android和iOS上创建Notifications很简单 https://pub.dev/packages/local_notifications

#### Flutter Local Notifications - 一个跨平台的显示本地notifications的插件 https://pub.dev/packages/flutter_local_notifications

#### App Badger - 桌面角标通知 https://pub.flutter-io.cn/packages/flutter_app_badger

## 存储

#### Shared preference - 键值对读写插件 https://pub.dev/packages/shared_preferences

#### secure storage - 加密存储 https://github.com/mogol/flutter_secure_storage

#### Flutter Data - 无缝管理Flutter应用程序中的持久数据的库 https://github.com/flutterdata/flutter_data

#### sqflite - sqlite插件 https://pub.dev/packages/sqflite
 
#### Localstorage - 支持多平台的存储 https://pub.dev/packages/localstorage

## 地图

#### Map View - 谷歌地图 https://pub.dev/packages/map_view

#### Location - 这个插件 处理Android和iOS上的位置。它还提供位置更改时的回调 https://pub.dev/packages/location

#### Amap - 高德地图3d flutter组件 https://pub.dev/packages/flutter_amap 

#### Amap location - 高德地图定位flutter组件 https://pub.flutter-io.cn/packages/amap_location

#### amap map fluttify - 高德地图组件 https://github.com/fluttify-project/amap_map_fluttify

图表

#### Charting - Material Design风格的图表库 https://pub.dev/packages/charts_flutter

#### Circular Chart - 一个让你使用flutter轻松创建的动画圆形图控件的库 https://pub.dev/packages/flutter_circular_chart
 
第三方登录

#### Fluwx - 微信SDK,支持支付,分享,登录,订阅,拉起小程序 https://pub.dev/packages/fluwx
 
#### QQ - qq登录,分享 https://pub.dev/packages/flutter_qq

## 支付

#### Alipay - 支付宝 https://pub.dev/packages/alipay_me

#### tobias - 支付宝 https://pub.flutter-io.cn/packages/tobias

#### flutter alipay - 支付宝支付 https://github.com/best-flutter/flutter_alipay

## 权限

#### Simple Permissions - 权限检查和请求 https://pub.flutter-io.cn/packages/simple_permissions

#### permission handler - Flutter的权限插件。此插件提供了一个跨平台（iOS，Android）API来请求和检查权限 https://pub.dev/packages/permission_handler

## 样式

#### Shimmer - 闪光效果 https://pub.flutter-io.cn/packages/shimmer

## JSON

#### json serializable - json格式化 https://pub.dev/packages/json_serializable

## HTML

#### flutter html - 展示html https://pub.flutter-io.cn/packages/flutter_html

#### flutter webview plugin - web浏览器 https://pub.flutter-io.cn/packages/flutter_webview_plugin

## 组件

#### Slidable - 侧滑组件 https://pub.flutter-io.cn/packages/flutter_slidable

#### Vercode Inputer - 验证码输入框组件 https://pub.flutter-io.cn/packages/vercoder_inputer

#### DragableGridview - 可拖拽排序组件 https://pub.flutter-io.cn/packages/dragablegridview_flutter

#### Flutter Credit Card - 快速创建填写银行卡的动态组件 https://github.com/SimformSolutionsPvtLtd/flutter_credit_card

#### Flutter Slide To Act - 滑动解锁组件 https://github.com/imtoori/flutter-slide-to-act

#### account selector -多账户切换组件 https://github.com/harpreetseera/flutter_account_selector

#### left scroll actions - 一款仿微信效果的 Flutter 左滑菜单插件。现在支持iOS的展开与弹性效果。 https://github.com/fluttercandies/left-scroll-actions
 
#### azlistview - 城市列表,联系人列表 https://github.com/flutterchina/azlistview

#### flip box bar - 3D底部导航栏 https://github.com/deven98/flip_box_bar

#### Flutter Modal Bottom Sheet - 底部弹窗组件 https://github.com/jamesblasco/modal_bottom_sheet

#### Rate my app - 评价我的app https://github.com/Skyost/RateMyApp

#### Flutter Login - 登录注册页面 https://github.com/NearHuscarl/flutter_login

#### FlutterTags - 快速创建漂亮标签 https://github.com/Dn-a/flutter_tags

#### Flutter Draw - 自有绘画库 https://github.com/theindianappguy/flutter_draw

#### Flutter Rating Bar - 星级评价组件 https://github.com/sarbagyastha/flutter_rating_bar

#### flutter beautiful popup - 美化弹窗 https://github.com/jaweii/Flutter_beautiful_popup

#### DragList - flutter拖动排序元素 https://pub.flutter-io.cn/packages/drag_list

## UI库

#### Magpie Fly - 58集体出品组件库 https://github.com/wuba/magpie_fly

#### FLUI - UI框架 https://pub.flutter-io.cn/packages/flui

#### Get Widget - 拥有1000多个预构建的窗口小部件 https://github.com/ionicfirebaseapp/getwidget

## 即时通讯

#### tencent im plugin - 腾讯云IM https://github.com/JiangJuHong/FlutterTencentImPlugin

#### RongCloud - 融云官方SDK https://github.com/rongcloud/rongcloud-im-flutter-sdk

#### 环信 - 环信官方SDK https://github.com/easemob/im_flutter_sdk

## 语音视频通话

#### AgoraRtcEngine - 声网社区版SDK https://pub.dev/packages/agora_rtc_engine

## 埋点/监控

#### FlutterPageTracker - FlutterPageTracker 是一个易用的 Flutter 应用页面事件埋点插件。它不仅支持在普通导航事件中监听页面曝光和离开，也支持弹窗的曝光和离开。 https://github.com/SBDavid/flutter_page_tracker

#### FlutterSliverTracker - 滑动曝光埋点框架，支持SliverList、SliverGrid https://github.com/SBDavid/flutter_sliver_tracker

#### FlutterBugly - 腾讯Bugly flutter应用更新插件 https://github.com/crazecoder/flutter_bugly

## 应用统计

#### TalkingData - TalkingData官方出品 https://github.com/TalkingData/AppAnalytics_SDK_Flutter

## 链接跳转APP

#### JMLink - 极光魔链,支持一键启动,场景还原,无码邀请,服务报告 https://docs.jiguang.cn/jmlink/guideline/intro/

#### openinstall - openinstall官方,支持渠道包导出,一键拉起与快速下载 https://pub.dev/packages/openinstall_flutter_plugin

#### MobLink - MobTeach开发,支持场景还原,数据统计分析,实时修改按钮样式,web多点跳转app https://www.mob.com/wiki/detailed?wiki=MobLink_for_Flutter&id=34

## 分享

#### ShareSDK - MobTeach官方,支持一键分享,第三方登录,LinkCard,短链转换,统计分析,闭环分享 https://www.mob.com/wiki/detailed?wiki=ShareSDK_for_Flutter&id=14

## 设备

#### Battery - 获取电池信息以及监控点亮变化 https://pub.dev/packages/battery

#### device info - 当前设备相关信息 https://pub.dev/packages/device_info

## 下拉刷新

#### flutter pulltorefresh - 一个提供上拉加载和下拉刷新的组件 https://github.com/peng8350/flutter_pulltorefresh

#### frefresh - 支持局部更新刷新区域和加载区域视图,阿里飞猪团队作品 https://pub.dev/packages/frefresh

## 状态管理

#### scoped model - 允许您轻松地将数据模型从父Widget传递到它的后代。此外，它还会在模型更新时重建使用该模型的所有子项。 https://github.com/brianegan/scoped_model

## 轮播图

#### Swiper - 轮播图 https://github.com/best-flutter/flutter_swiper

## 骨架屏

#### PKSkeleton - 一个类似于Facebook & Twitter的卡片闪光加载骨架库 https://github.com/iampawan/PKSkeleton

## 进度条

#### Sleek circular slider - 高度可定制的圆环滑块/进度条 https://github.com/matthewfx/sleek_circular_slider

## 广告

#### Pangolin - 集成了字节跳动旗下的广告平台——穿山甲的Android和iOS的SDK https://github.com/OpenFlutter/Pangolin

## 推送

#### MobPush - MobPush官方 https://www.mob.com/wiki/detailed?wiki=MobPushForFlutterfenlei&id=136

#### JPush - 官方极光推送 https://github.com/jpush/jpush-flutter-plugin

#### Getui - 官方个推 https://github.com/GetuiLaboratory/getui-flutter-plugin

## 富文本编辑器
 
#### Zefyr - flutter实现的富文本编辑器 https://github.com/memspace/zefyr

## 更新

#### r upgrade - Android和IOS的升级应用插件==Flutter应用升级插件 https://github.com/rhymelph/r_upgrade

#### Install - Android安装APK,并使用网址转到iOS的应用商店 https://pub.flutter-io.cn/packages/install_plugin

## 按钮

#### Flutter Speed Dial - 可展开选项的浮动按钮 https://pub.flutter-io.cn/packages/flutter_speed_dial

#### MediumClapFlutter - 浮动的按钮组 https://github.com/iampawan/MediumClapFlutter

#### UnicornDialer - 带有快速拨号的浮动动作按钮 https://github.com/tiagojencmartins/unicornspeeddial

#### FButton - 阿里飞猪团队出品,支持圆角、边框、图标、特效、Loading 模式 https://github.com/Fliggy-Mobile/fbutton

## 抽屉

#### sliding up panel - 可定制的上下滑出抽屉 https://pub.flutter-io.cn/packages/sliding_up_panel

#### FluitterInnerDrawer - 抽屉组件 https://github.com/Dn-a/flutter_inner_drawer

## Switch 开关

#### FSwitch - 阿里飞猪团队出品,一个有趣的、实用的开关组件。支持设置提示、滑块装饰、阴影以及良好的交互 https://github.com/Fliggy-Mobile/fswitch

## Radio 单选框

#### FRadio - 阿里飞猪团队出品,一个适用于几乎任意单选场景的单选组件。支持优良的交互特效，以及像吃汉堡 🍔一样简单的多交互状态视图切换构建 https://github.com/Fliggy-Mobile/fradio

## 其他

#### flutter dropdown menu - 下拉菜单 https://pub.flutter-io.cn/packages/dropdown_menu

#### url launcher - 打开特定url,如网址,右键,电话,短信 https://pub.dev/packages/url_launcher

#### Passcode Lock Screen - 仿iPhone锁屏 https://pub.flutter-io.cn/packages/passcode_screen

#### Scratcher - 刮刮卡组件 https://pub.flutter-io.cn/packages/scratcher

#### FSuper - 阿里飞猪团队出品,能够帮助开发者快速舒适的构建复杂视图。支持富文本、圆角、边框、图片、小红点、以及同时设置多达两个子组件，且控制它们的相对位置。 https://github.com/Fliggy-Mobile/fsuper

#### FFloat - FFloat ，虽简单易用，但能满足你对浮层的一切想象。生而优雅，支持精准的位置控制。圆角、边框、渐变、阴影装饰三角 https://github.com/Fliggy-Mobile/ffloat
 
