install-packages:
	cd mk && sudo bash -f install
config:
	@if [ ! -d ./mk ]; then\
        echo -e "Directory \e[1;31mmk\e[0m not exists";\
	else\
		cd mk && bash -f config;\
    fi

