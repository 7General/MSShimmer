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
- 📱 **简单易用** - 提供简洁的 API 接口
- 🔧 **高度可配置** - 支持全局配置和局部配置
- 📦 **CocoaPods 支持** - 易于集成到现有项目中

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

```swift
// 开始动画
shimmerContainer.start()

// 停止动画
shimmerContainer.stop()
```

## 📚 API 文档

### MSShimmerContainerView

主要的骨架屏容器视图类。

#### 方法

- `start()` - 开始骨架屏动画
- `stop()` - 停止骨架屏动画

#### 属性

- `gradientLayer` - 获取渐变层，用于自定义配置

### MSShimmerAppearance

全局外观配置类。

#### 属性

- `shimmerCornerRadius` - 骨架屏圆角半径（默认：6）
- `shimmerColors` - 骨架屏动画颜色数组
- `duration` - 动画持续时间（默认：1.5秒）

## 🎨 自定义示例

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
