# MSShimmer

[![CI Status](https://img.shields.io/travis/huizhou.wang/MSShimmer.svg?style=flat)](https://travis-ci.org/huizhou.wang/MSShimmer)
[![Version](https://img.shields.io/cocoapods/v/MSShimmer.svg?style=flat)](https://cocoapods.org/pods/MSShimmer)
[![License](https://img.shields.io/cocoapods/l/MSShimmer.svg?style=flat)](https://cocoapods.org/pods/MSShimmer)
[![Platform](https://img.shields.io/cocoapods/p/MSShimmer.svg?style=flat)](https://cocoapods.org/pods/MSShimmer)

## 📖 简介

MSShimmer 是一个轻量级的 iOS 骨架屏动画库，用于在内容加载时提供优雅的加载动画效果。它可以帮助提升用户体验，减少用户在等待内容加载时的焦虑感。

## ✨ 特性

- 🎨 **自定义外观** - 支持自定义圆角、动画颜色、动画时长
- 🚀 **高性能** - 基于 Core Animation 实现，性能优异
- 📱 **简单易用** - 提供简洁的 API 接口，支持UIView扩展
- 🔧 **高度可配置** - 支持全局配置和局部配置
- 🛡️ **防重复执行** - 智能状态管理，防止重复启动动画
- 📦 **CocoaPods 支持** - 易于集成到现有项目中
- 🎯 **一键开关** - 通过 `isShimmerEnabled` 属性轻松控制骨架屏效果
- 📏 **智能布局** - 骨架屏自动居中显示，支持自定义默认高度

## 📋 系统要求

- iOS 12.0+
- Swift 5.0+
- Xcode 12.0+

## 🛠 安装

### CocoaPods

在您的 `Podfile` 中添加：

```ruby
pod 'MSShimmer'
```

然后运行：

```bash
pod install
```

## 🚀 快速开始

### 基本使用

#### 方式一：使用UIView扩展（推荐）

```swift
import MSShimmer

class ViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 启用骨架屏效果
        contentView.isShimmerEnabled = true
        
        // 开始骨架屏动画
        contentView.startShimmer()
        
        // 停止骨架屏动画
        // contentView.stopShimmer()
    }
}
```

#### 方式二：传统方式

```swift
import MSShimmer

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建骨架屏容器
        let shimmerContainer = MSShimmerContainerView()
        view.addSubview(shimmerContainer)
        
        // 设置约束
        shimmerContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shimmerContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            shimmerContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shimmerContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shimmerContainer.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // 开始动画
        shimmerContainer.start()
    }
}
```

### 全局配置

```swift
// 配置全局外观
MSShimmerAppearance.instance.shimmerCornerRadius = 8
MSShimmerAppearance.instance.duration = 1.5
MSShimmerAppearance.instance.shimmerColors = [
    UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor,
    UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor,
    UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
]
```

### 控制动画

#### 使用UIView扩展（推荐）

```swift
// 启用骨架屏效果
view.isShimmerEnabled = true

// 开始动画
view.startShimmer()

// 停止动画
view.stopShimmer()

// 批量控制
view.startAllShimmers()
view.stopAllShimmers()
```

#### 传统方式

```swift
// 开始动画
shimmerContainer.start()

// 停止动画
shimmerContainer.stop()
```

## 📚 API 文档

### UIView 扩展

#### 属性

- `isShimmerEnabled` - 是否启用骨架屏效果（Bool）

#### 方法

- `startShimmer()` - 开始骨架屏动画
- `stopShimmer()` - 停止骨架屏动画
- `startAllShimmers()` - 批量开始所有子视图的骨架屏动画
- `stopAllShimmers()` - 批量停止所有子视图的骨架屏动画

### MSShimmerContainerView

主要的骨架屏容器视图类。

#### 方法

- `start()` - 开始骨架屏动画（已添加防重复执行保护）
- `stop()` - 停止骨架屏动画

#### 属性

- `gradientLayer` - 获取渐变层，用于自定义配置

### MSShimmerAppearance

全局外观配置类。

#### 属性

- `shimmerCornerRadius` - 骨架屏圆角半径（默认：6）
- `shimmerColors` - 骨架屏动画颜色数组
- `duration` - 动画持续时间（默认：1.5秒）
- `defaultShimmerHeight` - 骨架屏默认高度（默认：12）

---

## 🧩 批量管理 shimmer 容器（MSShimmerSource 协议）

有时页面上有多个骨架屏容器需要统一管理，推荐实现 `MSShimmerSource` 协议，集中批量控制 shimmer 动画。

### 协议作用
- 统一管理页面上所有 shimmer 容器，便于批量启动/停止动画和统一配置。
- 新增 shimmer 容器时，只需在数组中添加即可，结构清晰，易于维护。

### 如何实现
1. 让你的 ViewController 或自定义 view 遵循 `MSShimmerSource` 协议。
2. 实现 `shimmerContainers` 属性，返回所有需要 shimmer 效果的容器数组。

### 简单实例

```swift
import UIKit
import MSShimmer
import SnapKit

class ViewController: UIViewController, MSShimmerSource {
    // 定义多个 shimmer 容器
    let shimmer1 = MSShimmerContainerView()
    let shimmer2 = MSShimmerContainerView()
    let shimmer3 = MSShimmerContainerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(shimmer1)
        view.addSubview(shimmer2)
        view.addSubview(shimmer3)
        // 使用 SnapKit 进行约束布局
        shimmer1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        shimmer2.snp.makeConstraints { make in
            make.top.equalTo(shimmer1.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        shimmer3.snp.makeConstraints { make in
            make.top.equalTo(shimmer2.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }
        // 推荐用法：批量启动 shimmer 动画
        self.start()
    }

    // 实现协议，统一管理 shimmer 容器
    var shimmerContainers: [MSShimmerContainerView] {
        return [shimmer1, shimmer2, shimmer3]
    }
}
```

> 你也可以将自定义 view（如嵌套容器）加入 shimmerContainers，实现复杂骨架屏布局的批量管理。

> 实现 MSShimmerSource 协议后，可以直接调用 `self.start()` 和 `self.stop()`，批量启动或停止 shimmer 动画，无需手动遍历 shimmerContainers：

```swift
// 启动所有 shimmer 动画
self.start()

// 停止所有 shimmer 动画
self.stop()
```

### 适用场景
- 页面有多个 shimmer 容器需要统一控制时
- 需要批量启动/停止 shimmer 动画时
- 复杂嵌套骨架屏场景

---

## 🎨 使用示例

### 简单使用

```swift
class ViewController: UIViewController {
    
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var nameLabel: UIView!
    @IBOutlet weak var descriptionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 为多个视图启用骨架屏（会自动居中显示）
        avatarView.isShimmerEnabled = true
        nameLabel.isShimmerEnabled = true
        descriptionView.isShimmerEnabled = true
        
        // 开始所有骨架屏动画
        view.startAllShimmers()
        
        // 模拟网络请求完成后停止
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view.stopAllShimmers()
        }
    }
}
```

### 自定义颜色

```swift
MSShimmerAppearance.instance.shimmerColors = [
    UIColor.systemBlue.withAlphaComponent(0.1).cgColor,
    UIColor.systemBlue.withAlphaComponent(0.3).cgColor,
    UIColor.systemBlue.withAlphaComponent(0.1).cgColor
]
```

### 自定义动画时长

```swift
MSShimmerAppearance.instance.duration = 2.0
```

### 自定义圆角

```swift
MSShimmerAppearance.instance.shimmerCornerRadius = 12
```

### 自定义默认高度

```swift
MSShimmerAppearance.instance.defaultShimmerHeight = 20
```

## 📱 使用场景

- **网络请求加载** - 在发起网络请求时显示骨架屏
- **页面内容加载** - 在页面内容加载时提供占位符
- **列表数据加载** - 在列表数据加载时显示骨架屏
- **图片加载** - 在图片加载时显示占位符

## 🔧 示例项目

要运行示例项目，请按照以下步骤操作：

1. 克隆仓库
2. 进入 Example 目录
3. 运行 `pod install`
4. 打开 `MSShimmer.xcworkspace`
5. 运行项目

## 📄 许可证

MSShimmer 基于 MIT 许可证开源。详情请查看 [LICENSE](LICENSE) 文件。

## 👨‍💻 作者

**huizhou.wang**

- 邮箱：wanghuizhou21@163.com
- GitHub：[@huizhou.wang](https://github.com/huizhou.wang)

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📞 支持

如果您在使用过程中遇到任何问题，请通过以下方式联系我们：

- 提交 [Issue](https://gitee.com/whuizhou/msshimmer/issues)
- 发送邮件至：wanghuizhou21@163.com

---

⭐ 如果这个项目对您有帮助，请给我们一个星标！
