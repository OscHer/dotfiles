# This file includes bash variables to be invoked from bash config files
# at boot.
# Main strategy is to deploy them only on your own user but they can also be 
# stored into snap-in directories.

# Set Vi* as default editor
# TODO-oscar: change this into "case". :D

# echo "Default editor is $EDITOR"
TREBS_EDITOR=$EDITOR

if  test -f $TREBS_EDITOR ;then 
  TREBS_EDITOR=$(which vim)
else
  TREBS_EDITOR=$(which vi)
fi

export EDITOR=$TREBS_EDITOR
export SYSTEMD_EDITOR=$TREBS_EDITOR
