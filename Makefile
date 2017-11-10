# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: enanrock <marvin42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/02 11:41:31 by enanrock          #+#    #+#              #
#    Updated: 2017/11/10 23:13:47 by enanrock         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fdf
NAME_001 = $(NAME)
NAME_ALL = $(NAME_001)

LIB_DIR = ./libft/
SRC_DIR = ./srcs/
OBJ_DIR = ./objs/
HDR_DIR = ./includes/

LIB = $(addsuffix Makefile, $(LIB_DIR))

.PHONY: all leaks clean fclean re new_author norme victory tuto where_is_malloc

all: $(LIB) author .gitignore
	@make $@ -C dir_of_makefile -f Makefile_fdf

$(NAME_001): $(LIB)
	@make $(addprefix ../, $@) -C dir_of_makefile -f Makefile_fdf

leaks:
	clear
	@make $@ -C dir_of_makefile -f Makefile_fdf

clean: $(LIB)
	@make $@ -C dir_of_makefile -f Makefile_fdf
ifneq ("$(OBJ_DIR)", "./")
	@echo "\033[1;31m""\c"
	@rm -fdv $(OBJ_DIR)
	@echo "\033[m""\c"
endif

fclean: $(LIB)
	@make $@ -C dir_of_makefile -f Makefile_fdf
ifneq ("$(OBJ_DIR)", "./")
	@echo "\033[1;31m""\c"
	@rm -fdv $(OBJ_DIR)
	@echo "\033[m""\c"
endif

re: fclean all

where_is_malloc: $(LIB)
	@make $@ -C ./libft/

$(LIB):
	git clone https://github.com/erwan-nanrocki/libft.git $(LIB_DIR)

author:
	@echo "\033[1;37m""\c"
	echo "enanrock" > author
	@echo "\033[m"

.gitignore:
	@echo "\033[1;37m""\c"
	echo "$(OBJ_DIR)"   > $@
	echo "$(NAME_ALL)" >> $@
	echo "*.swp"       >> $@
	echo "*.o"         >> $@
	echo "*.a"         >> $@
	echo "*_DONE"      >> $@
	@echo "\033[m"

norme: $(LIB)
	@make norme -C $(LIB_DIR)
	@echo "\033[1;37m""norminette on $(SRC_DIR)""\033[m"
	@norminette $(SRC_DIR)                               \
		| sed ''s/Error/`echo "\033[0;31mError"`/g''     \
		| sed ''s/Warning/`echo "\033[0;33mWarning"`/g'' \
		| sed ''s/Norme/`echo "\033[0;32mNorme"`/g''
	@echo "\033[1;37m""norminette on $(HDR_DIR)""\033[m"
	@norminette $(HDR_DIR)                               \
		| sed ''s/Error/`echo "\033[0;31mError"`/g''     \
		| sed ''s/Warning/`echo "\033[0;33mWarning"`/g'' \
		| sed ''s/Norme/`echo "\033[1;34mNorme"`/g''

victory:
	@echo "\r  ( '_' )           < .                                    \c"
	@sleep 1
	@echo "\r  ( -_- )           < ..                                   \c"
	@sleep 0.2
	@echo "\r  ( '_' )           < ...                                  \c"
	@sleep 1.5
	@echo "\r  ( ^_^ )           < cool, you did it !                   \c"
	@sleep 3
	@echo "\r  /)^3^(\           < So Awesome !                         \c"
	@sleep 3
	@num=1;\
		while [[ $$num -le 50 ]];do\
		echo "\r ʕ•̫͡•ʕ*̫͡*ʕ•͓͡•ʔʕ•̫͡•ʔ*̫͡*ʔ  < The local crowd into a frenzy        \c";\
		sleep 0.1;\
		echo "\r  ʕ•̫͡•ʕ*̫͡*ʕ•͓͡•ʔʕ•̫͡•ʔ*̫͡*ʔ < The local crowd into a frenzy        \c";\
		sleep 0.1;\
		((num = num + 1));\
		done
	@echo "\r ᕦ(ˇò_ó)ᕤ           < You're the best !                    \c"
	@sleep 3
	@num=1;\
		while [[ $$num -le 20 ]];do\
		echo "\r | ( ^.^ ) |        < Dance                                \c";\
		sleep 0.1;\
		echo "\r  /(  ^.^)  /       <        to                            \c";\
		sleep 0.1;\
		echo "\r | ( ^.^ ) |        <           death                      \c";\
		sleep 0.1;\
		echo "\r\  (^.^  )\         <                 !                    \c";\
		sleep 0.1;\
		((num = num + 1));\
		done
	@echo "\r \ (O.O  )\         < oops...                              \c"
	@sleep 1.5
	@echo "\r  ( ╥﹏╥ )          < Time to work now...                  \c"

tuto:
	@echo "🚧  Under Construction 🚧 "
