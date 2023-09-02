#!/usr/bin/env sh

sudo pacman -S - < base.list

yay -S - < foreign.list

sed -i 's/env = LIBVA_DRIVER_NAME,/env = LIBVA_DRIVER_NAME,radeonsi/' .config/hypr/hyprland.conf
sed -i 's/env = VDPAU_DRIVER,/env = VDPAU_DRIVER,radeonsi/' .config/hypr/hyprland.conf
sed -i 's/env = __GLX_VENDOR_LIBRARY_NAME,mesa/env = __GLX_VENDOR_LIBRARY_NAME,amd/' .config/hypr/hyprland.conf
sed -i 's/^# env = DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1,1/env = DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1,1/' .config/hypr/hyprland.conf
sed -i 's/^# env = VK_ICD_FILENAMES,\/usr\/share\/vulkan\/icd.d\/amd_pro_icd64.json/env = VK_ICD_FILENAMES,\/usr\/share\/vulkan\/icd.d\/amd_pro_icd64.json/' .config/hypr/hyprland.conf

cp -rf .config/ .local/ .gtkrc-2.0 "$HOME"/