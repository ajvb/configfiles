##Alias Commands

# Editing .bash_aliases
alias bal='vim /home/avb/Dropbox/Linux\ Files/General/.bash_aliases'

# some more ls aliases
alias ls='ls -aF --color=auto'

## Dir shortcuts
alias home='cd ~/'
alias docs='cd ~/Documents'
alias books='cd ~/Books'
alias tools='cd ~/Tools'
alias pics='cd ~/Pictures'
alias vids='cd ~/Videos'
alias code='cd ~/Code'
alias music='cd ~/Music'
alias walls='cd ~/Pictures/walls'
alias sbhx='cd ~/Code/sbhx'

# Coding dir shortcuts
alias pyf='cd ~/Code/Python'
alias mast='cd ~/Code/proto-mastery'

# NM-Applet for awesome
alias netmgmt='nm-applet --sm-disable'

# Application Shortcuts (Internet)
alias ftp='filezilla &'
alias irc='irssi --connect=irc.freenode.net --nick=ajvb'

# Application Shortcuts (Tools)
alias wget='wget -c'
alias ping='ping -c 10'
alias pingg='ping www.google.com -c 5'
alias sgeany='gksudo geany &'
alias snano='sudo nano'
alias repo='sudo synaptic &'

# Information Shortcuts (Mine-zee)
alias srsinfo='acpi -abf && uptime && myip && date'

#Start-Up Shortcuts
alias wp='nitrogen --restore'
alias startall='nitrogen --restore && conky && nm-applet --sm-disable '
alias dropecho='echo 1000000 | sudo tee /proc/sys/fs/inotify/max_user_watches'
alias dropbox='~/.dropbox-dist/dropbox &'

## Keeping things organized
alias trash='mv -t ~/.local/share/Trash/files'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p -v'
alias reload='source /etc/bash.bashrc'
alias date='date "+%A %B %dth %Y%n%I:%M:%S %p"'
alias cal='cal'

# Connecting to My WKYHU EC2 Instance.
alias ecc='ssh -i ~/EC2info/avbwkyhu.pem ubuntu@XXXXX.compute-1.amazonaws.com'
export ecc='ubuntu@XXXXX.compute-1.amazonaws.com'

# Prototype Magik
alias protomagik='ssh ubuntu@XXXXX'

#SBHX Books
alias sbhxbooks='ssh avb@sbhx.theluckyproject.com'
export sbhxbooks='avb@sbhx.theluckyproject.com'

#Restarting Bashrc and Bash_aliases
alias restartbash='source ~/.bashrc && source ~/Dropbox/Linux\ Files/General/.bash_aliases'

#Working with Django
alias djmng='python manage.py'
alias drun='python manage.py runserver'
alias lolsync='python manage.py syncdb && python manage.py migrate'
alias syncdb='python manage.py syncdb'

#Git stuff
alias pull='git pull'
alias push='git push'

#Pelican
alias makepel='pelican -s pelican.conf.py -t media content'

#crontab alias
alias cronjob='env EDITOR=vim crontab -e'

#Virtual Env Stuff
alias mkvirtenv='mkvirtualenv --no-site-packages'
alias sbitterdev='workon sbhx-test && cd ~/Code/sbhx/sbhx-sbitter/django/sbhx_sbitter'
alias hnadev='cd ~/Code/django_projects/hnparser && workon hnparser'
alias ajvb='cd ~/Code/ajvb.me/ && workon ajvbme'
#### PTM Client's Sites
alias cazoozdev='cd ~/Code/ProtoTypeMagic/cazooz_site/ && workon cazooz'
alias xprodev='cd ~/Code/ProtoTypeMagic/xpro_site && workon xpro'
####
alias ptm='cd ~/Code/ProtoTypeMagic/ptm_site && workon prototypemagic'
alias ptmtools='cd ~/Code/ProtoTypeMagic/ptmtools_site && workon ptmtools'
alias ptmgit='cd ~/Code/PTM_github'


# ProtoType Magic
alias cazooz='ssh -X ubuntu@XXXXX'
export cazooz='ubuntu@XXXXX'

# Apache2
alias rap='sudo apachectl graceful'

alias pyc='python -c'

alias poweroff='sudo poweroff'
