{ pkgs, ... }:

{
  services.mako = {
    enable = true;
    # 可选：自定义通知外观和行为
    settings = {
      default-timeout = 5000;       # 5秒自动消失（0为不消失）
      border-radius = 8;
      border-size = 2;
      padding = 10;
      margin = 10;
      anchor = "top-right";         # 位置：top-right, top-center, top-left等
      layer = "overlay";            # 确保在窗口之上显示
      max-visible = 5;              # 最多同时显示5条
      group-by = "app-name";        # 按应用名分组通知
      background-color = "#1e1e2eff";
      text-color = "#cdd6f4ff";
      border-color = "#cba6f7ff";
    };
  };
}
