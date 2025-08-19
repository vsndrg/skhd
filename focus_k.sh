# Example: Check if the current space is in BSP layout
current_layout=$(yabai -m query --spaces --space | jq -r '.type')

if [[ "$current_layout" == "bsp" ]]; then
    yabai -m window --focus north
fi

if [[ "$current_layout" == "float" ]]; then
   yabai -m window --focus "$(yabai -m query --windows --space | jq -re "[sort_by(.id, .frame) | .[] | select(.role == \"AXWindow\" and .subrole == \"AXStandardWindow\") | .id] | nth(index($(yabai -m query --windows --window | jq -re ".id")) - 1)")"
fi

