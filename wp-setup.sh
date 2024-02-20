#! /bin/bash

#deleta plugins e temas inativos
wp post delete --allow-root $(wp post list --post_type='post' --format=ids --allow-root);wp post delete --allow-root $(wp post list --post_type='page' --format=ids --allow-root);wp theme delete --allow-root $(wp theme list --status=inactive --field=name --allow-root); wp plugin delete --allow-root $(wp plugin list --status=inactive --field=name --allow-root)

#instalar idioma pt BR
wp language core install pt_BR --allow-root
wp language core activate pt_BR --allow-root
wp option update timezone_string "America/Sao_Paulo" --allow-root

### Install plugins from official repository
wp plugin install simple-history --allow-root --activate
wp plugin install admin-site-enhancements --allow-root --activate
wp plugin install wordfence --allow-root --activate
wp plugin install all-in-one-wp-migration --allow-root --activate
wp plugin install https://opara.nyc3.cdn.digitaloceanspaces.com/public/plugins/all-in-one-wp-migration-unlimited-extension-v2.54.zip --allow-root --activate


### Fix permissions
chown www-data:www-data wp-content -R
cd -

exit 0