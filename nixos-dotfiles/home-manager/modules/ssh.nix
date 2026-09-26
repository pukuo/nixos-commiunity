{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "github.com" = {
        User = "git";
        IdentityFile = "~/.ssh/id_ed25519";
        AddKeysToAgent = "yes";
      };

      "*" = {
        AddKeysToAgent = "yes";
        # 其他你想要的全局默认，比如：
        # IdentityFile = "~/.ssh/id_ed25519";
        # ServerAliveInterval = 60;
      };
    };
  };
}
