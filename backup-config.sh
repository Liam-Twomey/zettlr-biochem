#!/bin/bash
configdir="$HOME$/.config/Zettlr"
bkpdir="$HOME/.zettlr_conf_bkp"
# any further custom templates must be manually added for now
declare -a customTemplates=("LaTeX-chem.yaml" "LuaTeX-Chem-PDF.yaml")
echo $customTemplates

backup(){
	cp $configdir/stats.json $bkpdir
	cp $configdir/config.json $bkpdir
	cp $configdir/custom.css $bkpdir
	cp $configdir/tags.json $bkpdir
	cp $configdir/targets.json $bkpdir
	cp $configdir/user.dic $bkpdir
	cp -r $configdir/snippets $bkpdir

  for i in "${customTemplates[@]}"; do
    cp $configdir/defaults/$i $bkpdir/
  done
}
restore(){
	cp $bkpdir/stats.json $configdir
	cp $bkpdir/config.json $configdir
	cp $bkpdir/custom.css $configdir
	cp $bkpdir/tags.json $configdir
	cp $bkpdir/targets.json $configdir
	cp $bkpdir/user.dic $configdir
	cp -r $bkpdir/snippets $configdir

  for j in "${customTemplates[@]}"; do
	  cp $bkpdir/$j $configdir/defaults/
  done
}
usage(){
echo -e "Usage:  -b backs up files from Zettlr to the default backup directory ($HOME/.zettlr_config_backup).
	-r restores the files from the backup directory to the Zettlr config directory.
	-d sets a custom backup directory for this run of the script.
  Example command: ./backup-config.sh -bd ~/zconfigbkp/"
}

# checking that at least one flag is supplied.
if [[ ! $@ =~ ^\-.+ ]]
then
	usage
fi

# dealing with actual flags
while getopts 'brd:' OPTION; do
	case "$OPTION" in
		d)
			bkpdir=$OPTARG
		;;
		b)
			backup	
		;;
		r)
			restore
		;;
		?)
			usage
		;;
		:)
		  echo "At least one argument is required."	
		;;
	esac
done
shift "$((OPTIND -1))"
