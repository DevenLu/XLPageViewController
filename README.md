![title](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Image/title.png)

## 目录:

* [特点](#特点)
* [结构](#结构)
* [App举例](#App举例)
* [基本属性](#基本属性)
* [特殊用法](#特殊用法)
* [使用](#使用)
* [更新](#更新)
* [其他](#其他)


## 特点:

* 采用UICollectionView+UIPageViewController方案，高性能，低功耗。
* 支持刷新，内置缓存(非复用)机制，节省内存。
* 默认配置样式丰富，可实现大部分主流App样式。
* 支持用户自定义标题样式。

## 结构:

![结构图](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Image/structure.png)

## App举例：

| App | 示例 | 
| ---- | ---- | 
|今日头条|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/1-1.gif)|
|腾讯新闻|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/1-2.gif)|
|澎湃新闻|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/1-3.gif)|
|爱奇艺|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/1-4.gif)|
|优酷|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/1-5.gif)|
|腾讯视频|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/1-6.gif)|
|网易新闻|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/1-7.gif)|
|人民日报|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/1-8.gif)|

## 基本属性：

| 功能 | 示例 | 
| ---- | ---- | 
|基本样式-标题正常显示|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-1.gif)|
|基本样式-标题显示在导航栏上|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-2.gif)|
|Segmented样式-标题正常显示|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-3.gif)|
|Segmented样式-标题显示在导航栏上|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-4.gif)|
|标题栏-居左|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-5.gif)|
|标题栏-居中|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-6.gif)|
|标题栏-居右|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-7.gif)|
|标题栏-自定义高度|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-9.gif)|
|标题-自定义宽度|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-8.gif)|
|标题-文字居上|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-10.gif)|
|标题-文字居下|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-11.gif)|
|标题-关闭标题颜色过渡|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-12.gif)|
|阴影动画-缩放|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-13.gif)|
|阴影动画-无|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-14.gif)|
|阴影末端形状-圆角|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-15.gif)|
|阴影末端形状-直角|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-16.gif)|
|阴影-居上|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-17.gif)|
|阴影-居中|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/2-18.gif)|


## 特殊用法：

| 场景 | 示例 | 
| ---- | ---- | 
|自定义标题Cell|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/3-1.gif)|
|频道定制|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/3-2.gif)|
|多级嵌套|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/3-3.gif)|
|子View滚动冲突|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/3-4.gif)|
|手动切换|![image](https://github.com/mengxianliang/XLPageViewController/blob/master/Images/Gif/3-5.gif)|

## 使用:

### 1、创建方法

#### 1.1 导入头文件

```objc
#import "XLPageViewController.h"
```

#### 1.2 遵守协议

```objc
@interface ViewController ()<XLPageViewControllerDelegate, XLPageViewControllerDataSrouce>
```


#### 1.3 创建外观配置类

*注：config负责所有的外观配置，```defaultConfig```方法设定了默认参数，使用时可按需配置。* [→Config属性列表](https://github.com/mengxianliang/XLPageViewController/blob/master/ConfigPropertyList.md)

```objc
  XLPageViewControllerConfig *config = [XLPageViewControllerConfig defaultConfig];
```

#### 1.4 创建分页控制器

*注：需要把```pageViewController```添加为当前视图控制器的子视图控制器，才能实现子视图控制器中的界面跳转。*
  
```objc
  XLPageViewController *pageViewController = [[XLPageViewController alloc] initWithConfig:config];
  pageViewController.view.frame = self.view.bounds;
  pageViewController.delegate = self;
  pageViewController.dataSource = self;
  [self.view addSubview:pageViewController.view];
  [self addChildViewController:pageViewController];
```

### 2、协议

#### 2.1 XLPageViewControllerDelegate

```objc
//回调切换位置
- (void)pageViewController:(XLPageViewController *)pageViewController didSelectedAtIndex:(NSInteger)index;
```

#### 2.2 XLPageViewControllerDataSrouce

**@required**

```objc
//根据index创建对应的视图控制器，每个试图控制器只会被创建一次。
- (UIViewController *)pageViewController:(XLPageViewController *)pageViewController viewControllerForIndex:(NSInteger)index;
```

```objc
//根据index返回对应的标题
- (NSString *)pageViewController:(XLPageViewController *)pageViewController titleForIndex:(NSInteger)index;
```

```objc
//返回分页数
- (NSInteger)pageViewControllerNumberOfPage;
```

**@optional**

```objc
//标题cell复用方法，自定义标题cell时用到
- (__kindof XLPageTitleCell *)pageViewController:(XLPageViewController *)pageViewController titleViewCellForItemAtIndex:(NSInteger)index;
```

### 3、自定义标题cell

#### 3.1 创建一个```XLPageTitleCell```的子类

```objc
#import "XLPageTitleCell.h"

@interface CustomPageTitleCell : XLPageTitleCell

@end
```

#### 3.2 注册cell、添加创建cell

```objc
//需要先注册cell
[self.pageViewController registerClass:CustomPageTitleCell.class forTitleViewCellWithReuseIdentifier:@"CustomPageTitleCell"];
```

```objc
//自定义标题cell创建方法
- (XLPageTitleCell *)pageViewController:(XLPageViewController *)pageViewController titleViewCellForItemAtIndex:(NSInteger)index {
    CustomPageTitleCell *cell = [pageViewController dequeueReusableTitleViewCellWithIdentifier:@"CustomPageTitleCell" forIndex:index];
    return cell;
}
```

#### 3.3 复写cell父类方法

```objc
//通过此父类方法配置标题cell是否被选中样式
- (void)configCellOfSelected:(BOOL)selected {

}

//通过此父类方法配置标题cell动画；type:区分是当前选中cell/将要被选中的cell；progress:动画进度0~1
- (void)showAnimationOfProgress:(CGFloat)progress type:(XLPageTitleCellAnimationType)type {
    
}

```

### 4、特殊情况处理

#### 4.1 和子view滚动冲突问题

当```pageViewController```的子视图中存在可滚动的子view，例如UISlider、UIScrollView等，如果子view和```pageViewController```发生滚动冲突时，可设置子view的```xl_letMeScrollFirst```属性为true。

```objc
  UISlider *slider = [[UISlider alloc] init];
  slider.xl_letMeScrollFirst = true;
  [childVC.view addSubview:slider];
```

### 5、注意事项

使用时需注意**标题不要重复**，**标题**是定位ViewController的唯一ID。

## 更新

```diff
! 2019/07/29 解决快速滑动导致显示错乱问题
! 2019/07/31 修正scrollEnabled属性不生效问题
! 2019/08/01 处理预设selectedIndex如果超出屏幕时，标题选中位置错乱问题
! 2019/08/03 处理当标题栏样式是Segmented时，点击标题切换慢的问题
+ 2019/08/03 添加UIViewController扩展标题属性，避免因title改变导致的异常
! 2019/08/19 解决因滑动距离过大，导致出现空白界面问题
! 2019/09/05 解决刷新方法可能造成的闪退问题
! 2019/09/23 解决使用多级嵌套时，可能出现界面错乱问题
! 2019/09/23 解决滑动切换时，标题栏可能会再一瞬间出现动画失效的问题
```

## 其他

* 频道管理工具[XLChannelControl](https://github.com/mengxianliang/XLChannelControl)

* 开发过的其他UI工具[XLUIKit](https://github.com/mengxianliang/XLUIKit)
