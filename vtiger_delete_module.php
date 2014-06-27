<?php
include_once('vtlib/Vtiger/Module.php');

/*
* Delete a module
*/
$module = Vtiger_Module::getInstance('MODULE_NAME_FOLDER');
if($module)
{
// Delete from system
$module->delete();
echo "Module deleted!";
} else {
echo "Module was not found and could not be deleted!";
}
?>
