# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: enanrock <marvin42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/02 11:41:31 by enanrock          #+#    #+#              #
#    Updated: 2017/11/26 06:52:16 by enanrock         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME     = fdf
NAME_001 = $(NAME)
NAME_ALL = $(NAME_001)

LIBFT_DIR = ./libft/
SRC_DIR   = ./srcs/
OBJ_DIR   = ./objs/
HDR_DIR   = ./includes/

LIB = $(addsuffix Makefile, $(LIBFT_DIR))

.PHONY: all leaks clean fclean re norme victory tuto tuto_defpro where_is_malloc

all: $(LIB) author .gitignore
	@make $@ -C dir_of_makefile -f Makefile_$(NAME_001)

$(NAME_001): $(LIB)
	@make $(addprefix ../, $@) -C dir_of_makefile -f Makefile_$@

leaks:
	clear
	@make $@ -C dir_of_makefile -f Makefile_$(NAME_001)

clean: $(LIB)
	@make $@ -C dir_of_makefile -f Makefile_$(NAME_001)
ifneq ("$(OBJ_DIR)", "./")
	@echo "\033[1;31m""\c"
	@rm -fdv $(OBJ_DIR)
	@echo "\033[m""\c"
endif

fclean: $(LIB)
	@make $@ -C dir_of_makefile -f Makefile_$(NAME_001)
ifneq ("$(OBJ_DIR)", "./")
	@echo "\033[1;31m""\c"
	@rm -fdv $(OBJ_DIR)
	@echo "\033[m""\c"
endif

re: fclean all

where_is_malloc: $(LIB)
	@make $@ -C ./libft/

$(LIB):
	git clone https://github.com/erwan-nanrocki/libft.git $(LIBFT_DIR)

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
	@make norme -C $(LIBFT_DIR)
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
	@echo "\033[m""\c"

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

tuto_defpro:
	@echo ""
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo "	Let \033[1m(E, +, .)\033[m be a nonempty \033[1mvector space\033[m"
	@echo "	Let \033[1mV\033[m and \033[1mP\033[m be 2 nonempty set of ""\c"
	@echo "\033[1msub-vectors space""\033[m"" of \033[1mE\033[m ""\c"
	@echo "\033[msuch as \033[1mV\033[m ⊕ \033[1mP\033[m = \033[1mE\033[m"
	@echo "	Let \033[1mp\033[m be a function of \033[1mE\033[m in \033[1mP"
	@echo ""
	@echo "	p : E → P"
	@echo "	    e ↦ p(e)"
	@echo ""
	@echo "	\033[1mV\033[m ⊕ \033[1mP\033[m = \033[1mE\033[m <=> \c"
	@echo "∀e ∈ \033[1mE\033[m, ∃!(v, p) ∈ \033[1mVxP\033[m such as e = v + p"
	@echo ""
	@echo "	If   : \033[1mp\033[m(e) = v"
	@echo "	Then : \033[1mp\033[m is the unique projection on \033[1mP\033[m\c"
	@echo " parallel with \033[1mV\033[m"
	@echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	@echo ""

tuto:
	clear
	@echo "( ^v^ ) < Hi !"
	@read
	clear
	@echo "( ﾟД ﾟ) < Welcome this lesson about \033[31mMathematics\033[m"
	@read
	clear
	@echo "( ⌐◼_◼) < To be more specific, projection and \033[32mmatrix\033[m"
	@read
	clear
	@echo "(⌐◼_◼¬) < This is how you define a ""\033[1m""projection\033[m :"
	@echo ""
	@make tuto_defpro
	@read
	clear
	@echo "( '_' )>⌐◼_◼ < In this projet, E = ℝ³, V = a line and P = a plane"
	@echo "               and for the FdF, the plane is the window open"
	@make tuto_defpro
	@echo "     -----------------------"
	@echo "   /                      /"
	@echo " /           ↥ = v      / = P"
	@echo "-----------------------"
	@read
	@echo "( ^_^ ) < And the best part is we only need to do 3 actions to drawn"
	@echo "          each point in the file.fdf, that are defined in canonical"
	@echo "          basis B of ℝ³ ([1 0 0] [0 1 0] [0 0 1])"
	@echo " 1) Define a basis 𝔅 of ℝ³"
	@echo " 2) Change each point's coordinates from B to 𝔅 "
	@echo "       ⎡ 1⎤ ⎡ 0⎤ ⎡ 0⎤           ⎡ 𝓟 ₁₁⎤ ⎡ 𝓟 ₁₂⎤ ⎡ 𝓟 ₁₃⎤"
	@echo "   B = ⎢ 0⎢ ⎢ 1⎢ ⎢ 0⎢       𝔅 = ⎢ 𝓟 ₂₁⎢ ⎢ 𝓟 ₂₂⎢ ⎢ 𝓟 ₂₃⎢"
	@echo "       ⎣ 0⎦ ⎣ 0⎦ ⎣ 1⎦           ⎣ 𝓟 ₃₁⎦ ⎣ 𝓟 ₃₂⎦ ⎣ 𝓟 ₃₃⎦"
	@echo ""
	@echo " ∀e ∈ ℝ³, ∀(x y z) ∈ ℝ, e = (x y z) in B "
	@echo "          ∀(𝔁 𝔂 𝔃) ∈ ℝ, e = (𝔁 𝔂 𝔃) in 𝔅 "
	@echo "            ⎡ 𝔁⎤  ⎡ 𝓟 ₁₁ 𝓟 ₁₂ 𝓟 ₁₃⎤  ⎡ x⎤"
	@echo "            ⎢ 𝔂⎢ =⎢ 𝓟 ₂₁ 𝓟 ₂₂ 𝓟 ₂₃⎢ .⎢ y⎢"
	@echo "            ⎣ 𝔃⎦  ⎣ 𝓟 ₃₁ 𝓟 ₃₂ 𝓟 ₃₃⎦  ⎣ z⎦"
	@echo " 3) Draw a pixel in (𝔁, 𝔂) and 𝔃 is use to check how is the highest"
