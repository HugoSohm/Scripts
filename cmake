#!/bin/sh

make_n() {
    echo "CC	= gcc" >> Makefile

    echo "" >> Makefile

    echo "RM	= rm -f" >> Makefile

    echo "" >> Makefile

    echo 'Flags de vérif ? (oui / non ou o / n)'

    read fvr

    if [[ "$fvr" == "oui" ]] || [[ "$fvr" == "o" ]]
    then

	echo 'CFLAGS  += -Wextra -Wall -Werror' >> Makefile
	echo 'CFLAGS  += -I.' >> Makefile
	echo "" >> Makefile

    fi

    echo "Source :"

    fdc
    echo

    fdc >> Makefile

    echo "" >> Makefile

    echo 'OBJ	= $(SRC:.c=.o)' >> Makefile

    echo "" >> Makefile

    echo "Nom du binaire"

    read namb

    echo "NAME	= $namb" >> Makefile

    echo "" >> Makefile

    echo 'all: $(NAME)' >> Makefile

    echo "" >> Makefile

    echo '$(NAME): $(OBJ)' >> Makefile

    if [[ "$fvr" == "o" ]] || [[ "$fvr" == "oui" ]]
    then
	echo	'	$(CC) $(OBJ) -o $(NAME) $(CFLAGS)' >> Makefile
    else
	echo	'	$(CC) $(OBJ) -o $(NAME)' >> Makefile

    fi

    echo "" >> Makefile

    echo 'clean:' >> Makefile

    echo '	$(RM) $(OBJ)' >> Makefile

    echo "" >> Makefile

    echo 'fclean: clean' >> Makefile

    echo '	$(RM) $(NAME)' >> Makefile


    echo "" >> Makefile

    echo 're: fclean all' >> Makefile

    echo "" >> Makefile

    echo '.PHONY: all clean fclean re' >> Makefile

}

# cp -r ~/lib/ ./

# make -C ./lib re

# cp ./lib/libmy.a ./

cmol ()
{
    echo "CC	= gcc" >> Makefile

    echo "" >> Makefile

    echo "RM	= rm -f" >> Makefile

    echo "" >> Makefile

    echo 'Flags de vérif ? (oui / non ou o / n)'

    read fvr

    if [[ "$fvr" == "oui" ]] || [[ "$fvr" == "o" ]]
    then

	echo 'CFLAGS  += -Wextra -Wall -Werror' >> Makefile
	echo 'CFLAGS  += -I.' >> Makefile
	echo "" >> Makefile

    fi

    echo 'Dossier de la lib'

    read dlib

    echo "LFLAGS  += -L$dlib -lmy" >> Makefile

    echo "" >> Makefile

    echo "Source :"

    fdc
    echo

    fdc >> Makefile

    echo "" >> Makefile

    echo 'OBJ	= $(SRC:.c=.o)' >> Makefile

    echo "" >> Makefile

    echo "Nom du binaire"

    read namb

    echo "NAME	= $namb" >> Makefile

    echo "" >> Makefile

    echo 'all: $(NAME)' >> Makefile

    echo "" >> Makefile

    echo '$(NAME): $(OBJ)' >> Makefile
    echo "	make -C $dlib" >> Makefile

    if [[ "$fvr" == "o" ]] || [[ "$fvr" == "oui" ]]
    then
	echo	'	$(CC) $(OBJ) -o $(NAME) $(CFLAGS) $(LFLAGS)' >> Makefile
    else
	echo	'	$(CC) $(OBJ) -o $(NAME) $(LFLAGS)' >> Makefile

    fi

    echo "" >> Makefile

    echo 'clean:' >> Makefile

    echo '	$(RM) $(OBJ)' >> Makefile
    echo "	make -C $dlib clean" >> Makefile

    echo "" >> Makefile

    echo 'fclean: clean' >> Makefile

    echo '	$(RM) $(NAME)' >> Makefile
    echo "	make -C $dlib fclean" >> Makefile

    echo "" >> Makefile

    echo 're: fclean all' >> Makefile
    echo "	make -C $dlib re" >> Makefile

    echo "" >> Makefile

    echo '.PHONY: all clean fclean re' >> Makefile
    echo "	make -C $dlib .PHONY" >> Makefile
}

echo "## Makefile by cmake (Thedusk)" >> Makefile

echo "" >> Makefile

echo 'Makefile avec lib : o / n ou oui / non'

read lib

if [[ "$lib" == "o" ]] || [[ "$lib" == "oui" ]]; then
    cmol
elif [[ "$lib" == "n" ]] || [[ "$lib" == "non" ]]; then
    make_n
fi
