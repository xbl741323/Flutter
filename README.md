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

#### 运行一个Flutter项目：1.冷启动（从零启动 1m-5m）- 2.热重载（最主要是执行build方法）- 3.热重启（重新运行整个项目）


