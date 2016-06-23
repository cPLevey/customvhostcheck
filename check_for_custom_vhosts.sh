#!/bin/sh
custom_templates="$(find /var/cpanel/userdata -type f -name '*.cache' -exec grep -l 'custom_vhost_template' {} \;)";

	echo "Checking for custom vhost templates in the /usr/local/apache directory...";
	echo "";

for custom_template in $(echo "$custom_templates"); do 
	custom_temp="$(grep -l 'usr/local/apache' $custom_template)"; 
	if [ ! -z "$custom_temp" ]; then 
		python -mjson.tool $custom_template |grep 'custom_vhost_template'
	fi; 
done
