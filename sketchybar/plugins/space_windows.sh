#!/bin/bash

if [ "$SENDER" = "space_windows_change" ] ||
  [ "$SENDER" = "aerospace_workspace_change" ]; then

  # Loop over every workspace
  for sid in $(aerospace list-workspaces --all); do

    # Get all app names in this workspace
    APPS=$(aerospace list-windows \
      --workspace "$sid" \
      --format "%{app-name}")

    # Make them unique + sorted
    UNIQUE_APPS=$(echo "$APPS" | sort | uniq)

    icon_strip=" "

    if [ -n "$UNIQUE_APPS" ]; then
      while read -r app; do
        icon="$($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"

        # If icon_map returns empty, fallback to first letter
        if [ -z "$icon" ]; then
          icon="${app:0:1}"
        fi

        icon_strip+=" $icon"
      done <<<"$UNIQUE_APPS"
    else
      icon_strip=" —"
    fi

    sketchybar --set space.$sid label="$icon_strip"

  done
fi
