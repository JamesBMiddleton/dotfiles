#!/bin/bash
# Runs every 30 mins with crontab:
# */30 * * * * ~/Documents/scripts/rclone_sync_script.sh >/dev/null 2>&1

rclone sync ~/Documents gdrive:xps_kubuntu/Documents

