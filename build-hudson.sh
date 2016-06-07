#!/bin/bash
export PATH="/opt/android-build:/opt/android-sdk/tools:/opt/android-sdk/platform-tools:~/android/system:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

termdir="vendor/cm/proprietary"

termf="$termdir/Term.apk"
libarmt="$termdir/lib/armeabi/libjackpal-androidterm*.so"
libarme="$termdir/lib/armeabi/libjackpal-termexec*.so"
libmipst="$termdir/lib/mips/libjackpal-androidterm*.so"
libmipse="$termdir/lib/mips/libjackpal-termexec*.so"
libx86t="$termdir/lib/x86/libjackpal-androidterm*.so"
libx86e="$termdir/lib/x86/libjackpal-termexec*.so"

if ! ( [ -f "$termf" ] && [ -e $libarmt ] && [ -e $libarme ] &&
       [ -e $libmipst ] && [ -e $libmipse ] && [ -e $libx86t ] && [ -e $libx86e ] )
then
	./vendor/cm/get-prebuilts > /dev/null 2>&1
        if ! [ $? -eq 0 ]; then
    		exit
	fi
fi

chmod +x build/envsetup.sh

source build/envsetup.sh > /dev/null 2>&1
if ! [ $? -eq 0 ]; then
    exit
fi

brunch cm_royss-userdebug
