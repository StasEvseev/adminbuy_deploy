docker build -t buyapi:0.9 .
docker run -p 127.0.0.1:8000:8000 --name buyapi_1 -v /home/www/adminbuy_deploy/static:/var/local/www/adminbuy/static_foreign_folder -d buyapi:0.9
docker exec buyapi_1 sh -c 'cp /var/local/www/adminbuy/static_foreign/* /var/local/www/adminbuy/static_foreign_folder/ -r'
