{ ... }:
{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>w";
      action = ":w<CR>";
    }
    {
      mode = "n";
      key = "<leader>q";
      action = ":q<CR>";
    }
  ];
}
