all:
	if ! grep -q "vmustone.42.fr" /etc/hosts; then \
		sudo echo "127.0.0.1 vmustone.42.fr" >> /etc/hosts; \
	fi
	if ! grep -q "www.vmustone.42.fr" /etc/hosts; then \
		sudo echo "127.0.0.1 www.vmustone.42.fr" >> /etc/hosts; \
	fi
	mkdir -p /home/ville/data/mariadb_data
	mkdir -p /home/ville/data/wordpress_data
	docker-compose -f srcs/docker-compose.yml build
	docker-compose -f srcs/docker-compose.yml up -d
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean:	clean
	sudo rm -rf /home/ville/data/mariadb_data
	sudo rm -rf /home/ville/data/wordpress_data
	docker system prune -f

re:	fclean all

up:
	docker-compose -f srcs/docker-compose.yml up -d
down:
	docker-compose -f srcs/docker-compose.yml down
.phony:  all clean fclean re up down
