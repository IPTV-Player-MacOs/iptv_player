import Cocoa
import FlutterMacOS
import Foundation

import desktop_multi_window
import isar_flutter_libs
import macos_ui
import media_kit_libs_macos_video
import media_kit_video
import path_provider_foundation
import screen_retriever
import wakelock_macos
import window_manager


class BlurryContainerViewController: NSViewController {
  let flutterViewController = FlutterViewController()

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError()
  }

  override func loadView() {
    let blurView = NSVisualEffectView()
    blurView.autoresizingMask = [.width, .height]
    blurView.blendingMode = .behindWindow
    blurView.state = .active
    if #available(macOS 10.14, *) {
        blurView.material = .sidebar
    }
    self.view = blurView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    self.addChild(flutterViewController)

    flutterViewController.view.frame = self.view.bounds
    flutterViewController.backgroundColor = .clear
    flutterViewController.view.autoresizingMask = [.width, .height]
    self.view.addSubview(flutterViewController.view)
  }
}

class MainFlutterWindow: NSWindow, NSWindowDelegate {
  override func awakeFromNib() {
    delegate = self
    let blurryContainerViewController = BlurryContainerViewController()
    let windowFrame = self.frame
    self.contentViewController = blurryContainerViewController
    self.setFrame(NSRect(x:0, y:0, width: 1440, height: 900), display: true)
    self.center();

    if #available(macOS 10.13, *) {
      let customToolbar = NSToolbar()
      customToolbar.showsBaselineSeparator = false
      self.toolbar = customToolbar
    }

    self.titleVisibility = .hidden
    self.titlebarAppearsTransparent = true
    if #available(macOS 11.0, *) {
      // Use .expanded if the app will have a title bar, else use .unified
      self.toolbarStyle = .unified
    }

    self.isMovableByWindowBackground = true
    self.styleMask.insert(NSWindow.StyleMask.fullSizeContentView)

    self.isOpaque = false
    self.backgroundColor = .clear

    RegisterGeneratedPlugins(registry: blurryContainerViewController.flutterViewController)

    FlutterMultiWindowPlugin.setOnWindowCreatedCallback { controller in
      FlutterMultiWindowPlugin.register(with: controller.registrar(forPlugin: "FlutterMultiWindowPlugin"))
      IsarFlutterLibsPlugin.register(with: controller.registrar(forPlugin: "IsarFlutterLibsPlugin"))
      MacOSUiPlugin.register(with: controller.registrar(forPlugin: "MacOSUiPlugin"))
      MediaKitLibsMacosVideoPlugin.register(with: controller.registrar(forPlugin: "MediaKitLibsMacosVideoPlugin"))
      MediaKitVideoPlugin.register(with: controller.registrar(forPlugin: "MediaKitVideoPlugin"))
      PathProviderPlugin.register(with: controller.registrar(forPlugin: "PathProviderPlugin"))
      ScreenRetrieverPlugin.register(with: controller.registrar(forPlugin: "ScreenRetrieverPlugin"))
      WakelockMacosPlugin.register(with: controller.registrar(forPlugin: "WakelockMacosPlugin"))
      WindowManagerPlugin.register(with: controller.registrar(forPlugin: "WindowManagerPlugin"))
    }

    super.awakeFromNib()
  }

  func window(_ window: NSWindow, willUseFullScreenPresentationOptions proposedOptions: NSApplication.PresentationOptions = []) -> NSApplication.PresentationOptions {
    // Hides the toolbar when in fullscreen mode
    return [.autoHideToolbar, .autoHideMenuBar, .fullScreen]
  }

  func windowWillEnterFullScreen(_ notification: Notification) {
      self.toolbar?.isVisible = false
  }

  func windowDidExitFullScreen(_ notification: Notification) {
      self.toolbar?.isVisible = true
  }
}

