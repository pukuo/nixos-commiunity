  xdg.configFile."fcitx5/rime/default.custom.yaml".text = ''
patch:
  __include: rime_ice_suggestion:/
  schema_list:
    - schema: rime_ice
  ascii_composer:
    good_old_caps_lock: true
    switch_key:
      Caps_Lock: commit_code
      Shift_L: inline_ascii
      Shift_R: inline_ascii
  '';


  xdg.configFile."${rimeConfDir}/default.custom.yaml".text = ''
patch:
  __include: rime_ice_suggestion:/
  schema_list:
    - schema: rime_ice
  '';