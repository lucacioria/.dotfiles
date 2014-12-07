alias push_oxway='cd ~/Documents/buildo/repo/oxway/web; rm -r target; broccoli build target;rsync -vrzhe ssh --progress target/ oxway@95.85.18.31:/usr/share/nginx/html/;'
alias run_dendrite='cd $HOME/Documents/buildo/repo/labonline/dendrite; nvm use 0.11; node --harmony app.js;'
alias run_docs_escalapio='cd $HOME/Documents/buildo/repo/labonline/documentation/doc-parser; git pull --ff-only; node index.js -i ../documentation.sbraml -o ../documentation.html; open ../documentation.html'
alias l=l -lah
