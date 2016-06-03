#!/bin/bash
printf "=================================\n"
printf "            Preparing\n"
printf "=================================\n"

# Building will fail of no valid locale is set.
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

printf "...cleaning project and kernel...\n"
rm -rf out/target
cd kernel/samsung/msm7x27a
make clean
cd ../../../
printf "              ready\n"

termdir="vendor/cm/proprietary"

termf="$termdir/Term.apk"
libarmt="$termdir/lib/armeabi/libjackpal-androidterm*.so"
libarme="$termdir/lib/armeabi/libjackpal-termexec*.so"
libmipst="$termdir/lib/mips/libjackpal-androidterm*.so"
libmipse="$termdir/lib/mips/libjackpal-termexec*.so"
libx86t="$termdir/lib/x86/libjackpal-androidterm*.so"
libx86e="$termdir/lib/x86/libjackpal-termexec*.so"

printf "    ...checking term files...\n"
if ! ( [ -f "$termf" ] && [ -e $libarmt ] && [ -e $libarme ] &&
       [ -e $libmipst ] && [ -e $libmipse ] && [ -e $libx86t ] && [ -e $libx86e ] )
then
	printf "           downloading\n"
	./vendor/cm/get-prebuilts > /dev/null 2>&1
        if ! [ $? -eq 0 ]; then
    		printf "        Failure! Exiting!\n"
    		exit
	fi
fi
printf "              ready\n"

printf "    ...setting environment...\n"
. ./build/envsetup.sh > /dev/null 2>&1
if ! [ $? -eq 0 ]; then
    printf "        Failure! Exiting!\n"
    exit
fi
printf "              ready\n"
printf "=================================\n\n"

PS3='
Select device: '
options=("user" "userdebug" "eng")
devices=("S6310" "S6312" "S6310N")
select opt in "${devices[@]}"
do
	    printf "\n"
PS3='
Select build: '

	    case $opt in
		"S6310")
		    select opt in "${options[@]}"
		    do
	  		    case $opt in
				"user")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
				    time brunch cm_royss-user || (printf "        Failure! Exiting!\n"; exit)
				    break 2;;
				"userdebug")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
				    time brunch cm_royss-userdebug || (printf "        Failure! Exiting!\n"; exit)
			    	    break 2;;
			    	"eng")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
			    	    time brunch cm_royss-eng || (printf "        Failure! Exiting!\n"; exit)
			    	    break 2;;
			    	*) echo "Invalid build type..";;
			    esac
		    done
		    ;;
		"S6312")
		    select opt in "${options[@]}"
		    do
	  		    case $opt in
				"user")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
				    time brunch cm_roy-user || (printf "        Failure! Exiting!\n"; exit)
				    break 2;;
				"userdebug")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
				    time brunch cm_roy-userdebug || (printf "        Failure! Exiting!\n"; exit)
			    	    break 2;;
			    	"eng")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
			    	    time brunch cm_roy-eng || (printf "        Failure! Exiting!\n"; exit)
			    	    break 2;;
			    	*) echo "Invalid build type..";;
			    esac
		    done
		    ;;
		"S6310N")
		    select opt in "${options[@]}"
		    do
	  		    case $opt in
				"user")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
				    time brunch cm_royssnfc-user || (printf "        Failure! Exiting!\n"; exit)
				    break 2;;
				"userdebug")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
				    time brunch cm_royssnfc-userdebug || (printf "        Failure! Exiting!\n"; exit)
			    	    break 2;;
			    	"eng")
				    printf "\n=================================\n"
				    printf "   ...starting device build...\n"
				    printf "=================================\n\n"
			    	    time brunch cm_royssnfc-eng || (printf "        Failure! Exiting!\n"; exit)
			    	    break 2;;
			    	*) echo "Invalid build type..";;
			    esac
		    done
		    ;;
		*) echo "Invalid device..";;
	    esac
done

printf "\n=================================\n"
printf "      Device Build Finished\n"
printf "=================================\n\n"

exit
