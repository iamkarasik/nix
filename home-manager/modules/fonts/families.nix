# Family names exactly as fontconfig reports them for nerd-fonts.jetbrains-mono
# (`fc-scan --format '%{family}'`). Note there is no space in "JetBrainsMono" —
# "JetBrains Mono Nerd Font" matches nothing and silently falls back.
{
  # Proportional-metrics Nerd Font build; the general-purpose choice.
  mono = "JetBrainsMono Nerd Font";

  # Fixed-advance build, for consumers that need strict cell alignment.
  monoFixed = "JetBrainsMono Nerd Font Mono";

  # Proportional humanist sans, patched with Nerd Font glyphs so icon
  # modules keep rendering. macOS-menu-bar analogue.
  sans = "Inter Nerd Font";
}
