alias push_oxway='cd ~/Documents/buildo/repo/oxway/web; rm -r target; broccoli build target;rsync -vrzhe ssh --progress target/ oxway@95.85.18.31:/usr/share/nginx/html/;'
