#!/bin/bash

# Set desired values
ACCEL_PROFILE="0, 1"      # Disable acceleration (flat profile)
ACCEL_SPEED="0.4"        # Adjust speed as needed (e.g., -0.5 for slower, 0.5 for faster)

# Loop through all pointer devices
for device in $(xinput list | grep -i "pointer" | awk -F 'id=' '{print $2}' | awk '{print $1}'); do
    # Apply acceleration profile
    xinput --set-prop "$device" "libinput Accel Profile Enabled" $ACCEL_PROFILE
    # Set pointer speed
    xinput --set-prop "$device" "libinput Accel Speed" $ACCEL_SPEED
done
