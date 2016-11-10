
add_lunch_combo cm_delos3geur-eng
add_lunch_combo cm_delos3geur-userdebug
add_lunch_combo cm_delos3geur-user dist

sh device/samsung/delos3geur/patches/apply.sh

function delos3geur
{
lunch cm_delos3geur-userdebug
make -j4 bacon
}
function delos3geur_select
{
lunch cm_delos3geur-userdebug
make -j4 bacon
}
