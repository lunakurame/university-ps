<?php
# Version     : 0.0.0.1
# Dependencies:
# - PHP 5.4
# - Apache mod: rewrite
# - the .htaccess file, make sure that your server allows overrides
#   (check /etc/apache2/apache2.conf if <Directory /var/www/> has 'AllowOverride All')

# load config
require 'etc/config.php';
define('CURRENT_PATH'  , $_GET['cmd'] == '' ? GLOBAL_ROOT : GLOBAL_ROOT . '/' . $_GET['cmd']);

# load the loader
require 'lib/loader.php';
$loader = new \PS\Loader($_GET['cmd'], DEFAULT_PAGE, DEBUG_MODE);

# load modules
# TODO
#$loader->loadModule('lib/database');
#$loader->loadModule('lib/user');

# init database
# TODO

# init user
# TODO

# load page
$loader->loadModule('page/' . $loader->getPage());

