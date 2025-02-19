#!/bin/bash

# Define an array of theme filenames
THEMES=(
  "alabaster_dark.toml"
  "alacritty_0_12.toml"
  "argonaut.toml"
  "ayu_dark.toml"
  "base16_default_dark.toml"
  "blood_moon.toml"
  "breeze.toml"
  "carbonfox.toml"
  "catppuccin_macchiato.toml"
  "catppuccin_mocha.toml"
  "catppuccin.toml"
  "challenger_deep.toml"
  "citylights.toml"
  "coolnight.toml"
  "doom_one.toml"
  "dracula_plus.toml"
  "github_dark_colorblind.toml"
  "github_dark_default.toml"
  "github_dark_high_contrast.toml"
  "github_dark.toml"
  "github_dark_tritanopia.toml"
  "gruvbox_material_hard_dark.toml"
  "hardhacker.toml"
  "horizon-dark.toml"
  "hyper.toml"
  "iterm.toml"
  "material_theme_mod.toml"
  "material_theme.toml"
  "midnight-haze.toml"
  "monokai_charcoal.toml"
  "monokai_pro.toml"
  "nightfly.toml"
  "night_owl.toml"
  "taerminal.toml"
  "tender.toml"
  "thelovelace.toml"
  "tokyo-night.toml"
  "tomorrow_night_bright.toml"
  "wombat.toml"
)

# Path to the index file that stores the current theme index
INDEX_FILE="$HOME/.config/alacritty/themes/.alacritty_theme_index"

# Check if the index file exists, if not, initialize it with the default index (0)
if [ ! -f "$INDEX_FILE" ]; then
  echo "0" > "$INDEX_FILE"
fi

# Read the current theme index from the index file
current_index=$(cat "$INDEX_FILE")

# Get the theme file based on the current index
theme_file="${THEMES[$current_index]}"

# Update the theme file path in the alacritty.toml configuration file (10th line)
# sed -i "10s|.*|  \"~/.config/alacritty/themes/themes/${theme_file}\"|" "$HOME/.config/alacritty/alacritty.toml"

#After Updating theme from this script Softlink is loosing, soo to fix it
sed -i "10s|.*|  \"~/.config/alacritty/themes/themes/${theme_file}\"|" ~/GIT/dotfiles/alacritty/alacritty.toml

# Print the updated theme name
echo "Theme updated to: $theme_file"

# Calculate the next index (loop back to 0 if at the end)
next_index=$(( (current_index + 1) % ${#THEMES[@]} ))

# Update the index file with the next theme index
echo $next_index > "$INDEX_FILE"

# Print the new index (debugging purpose)
echo "Next theme index: $next_index"
