/bin/cp device/samsung/i8552/post_process_props_hook.py build/tools/
chmod  0775 build/tools/post_process_props_hook.py

add_lunch_combo cm_i8552-eng
add_lunch_combo cm_i8552-userdebug
add_lunch_combo cm_i8552-user dist

sh device/samsung/i8552/patches/apply.sh
croot

rm -rf out/target/product/i8552/obj/PACKAGING/target_files_intermediates
rm -f out/target/product/i8552/system/build.prop
rm -f out/target/product/i8552/root/default.prop 
