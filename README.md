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
 
