# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eralonso <eralonso@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/18 12:39:13 by eralonso          #+#    #+#              #
#    Updated: 2022/10/22 10:05:17 by eralonso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#----------------------------------->COLORS<-----------------------------------#
DEF_COLOR = \033[1;39m
WHITE = \033[1m
BLACK = \033[1;30m
RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
BLUE = \033[1;34m
PINK = \033[1;35m
CIAN = \033[1;36m

#------------------------------------>NAME<------------------------------------#
NAME = libft.a

#----------------------------------->HEADER<-----------------------------------#
HEADER = libft.h

#------------------------------------>BNAME<-----------------------------------#
BNAME = .bonus_name

#------------------------------------->SRC<----–-------------------------------#
SRCS = ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c \
	   ft_memchr.c	ft_memcmp.c	ft_strlen.c ft_isalpha.c \
	   ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
	   ft_toupper.c ft_tolower.c ft_strchr.c ft_strrchr.c \
	   ft_strncmp.c ft_strlcpy.c ft_strlcat.c ft_strnstr.c \
	   ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c \
	   ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c \
	   ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c \
	   ft_putendl_fd.c ft_putnbr_fd.c
BONUS_SRCS = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
			 ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstclear_bonus.c \
			 ft_lstdelone_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c

#------------------------------------>DIR<-------------------------------------#
OBJS_DIR = $(shell pwd)/objs/

#------------------------------------>OBJ<-------------------------------------#
OBJS = $(addprefix ${OBJS_DIR}, ${SRCS:.c=.o})
BONUS_OBJS = $(addprefix ${OBJS_DIR}, ${BONUS_SRCS:.c=.o})

DEP = $(addsuffix .d, $(basename ${OBJS}))
BDEP = $(addsuffix .d, $(basename ${BONUS_OBJS}))

#----------------------------------->COMANDS<----------------------------------#
CFLAGS = -Wall -Wextra -Werror
RM = rm -f
MDP = mkdir -p
AR = ar crs
INCLUDE = -I ./

#------------------------------------>RULES<-----------------------------------#
${OBJS_DIR}%.o: %.c Makefile
	@${MDP} $(dir $@)
	@printf "${PINK}Compiling: ${YELLOW}$<...${DEF_COLOR}				\r"
	@gcc -MT $@ ${CFLAGS} -MMD -MP ${INCLUDE} -c $< -o $@

all			: 
	@$(MAKE) ${NAME}

${NAME}		::	${OBJS}
	@${AR} ${NAME} ${OBJS}
	@printf "\n${GREEN}LIBRARY: libft has been created.${DEF_COLOR}\n"

${NAME}		::
	@echo "${YELLOW}Nothing to be done for 'libft'${DEF_COLOR}"

-include ${DEP}

bonus		:
	@$(MAKE) ${BNAME}

${BNAME}	:: ${OBJS} ${BONUS_OBJS} 
	@${AR} ${NAME} ${OBJS} ${BONUS_OBJS}
	@printf "\n${GREEN}LIBRARY: libft has been created.${DEF_COLOR}\n"
	@touch $@

${BNAME}	::
	@echo "${YELLOW}Nothing to be done for 'libft'${DEF_COLOR}"

-include ${BDEP}

clean:
	@${RM} -r ${OBJS_DIR} ${BONUS_OBJS_DIR}
	@echo "${RED}OBJ && DEPS of 'libft' has been removed.${DEF_COLOR}"

fclean		:
	@$(MAKE) clean
	@${RM} ${NAME} ${BNAME}
	@echo "${RED}LIBRARY: libft has been removed.${DEF_COLOR}"

re			:
	@$(MAKE) fclean
	@$(MAKE) all
	@echo "${CIAN}LIARY: libft have been remake${DEF_COLOR}"

.PHONY: all bonus clean fclean re bonus
