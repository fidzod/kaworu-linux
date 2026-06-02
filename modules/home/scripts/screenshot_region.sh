mkdir -p ~/pictures/screenshots
grim -g "$(slurp)" ~/pictures/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png
