# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eralonso <eralonso@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/01 14:33:49 by eralonso          #+#    #+#              #
#    Updated: 2022/11/07 14:37:20 by eralonso         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/COLORS/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-#
DEF_COLOR = \033[1;39m
WHITE_BOLD = \033[1m
BLACK = \033[1;30m
RED = \033[1;31m
GREEN = \033[1;32m
YELLOW = \033[1;33m
BLUE = \033[1;34m
PINK = \033[1;35m
CIAN = \033[1;36m

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/NAME/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/#
NAME		= libftprintf.a

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-HEADERS/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/#
HEADER		= ./inc/
B_HEADER	= ./bonus/inc

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/DIRS/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/#
LFT_DIR		= libft/
OBJS_DIR	= objs/
SRCS_DIR	= src/
MAIN_DIR	= src/main/
UTILS_DIR	= src/utils/
SRCSB_DIR	= bonus/src/
MAINB_DIR	= bonus/src/main/
UTILSB_DIR	= bonus/src/utils/

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/LIBFT/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-#
LFT		= libft
LFTA	= ${LFT_DIR}libft.a

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/FILES/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-#
MAIN		:= ft_printf
FLAGS		:= ft_checker ft_flags_checker
UTILS		:= ft_chars_utils ft_ptr_utils ft_nbrs_utils
FILES		= ${MAIN} ${FLAGS} ${UTILS}

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/BONUS-FILES/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-#
MAINB		:= $(addsuffix _bonus, ${MAIN})
FLAGSB		:= $(addsuffix _bonus, ${FLAGS})
UTILSB		:= $(addsuffix _bonus, ${UTILS})
FILESB		= ${MAINB} ${FLAGSB} ${UTILSB}

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/SRCS/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/#
UTILS_SRCS	= $(addsuffix .c, $(addprefix ${UTILS_DIR}, ${UTILS}))
SRCS		:= ${MAIN} ${FLAGS}
SRCS		:= $(addsuffix .c, $(addprefix ${MAIN_DIR}, ${SRCS}))

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/BONUS-SRCS/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/#
UTILS_SRCSB	= $(addsuffix .c, $(addprefix ${UTILSB_DIR}, ${UTILSB}))
SRCSB		:= ${MAINB} ${FLAGSB}
SRCSB		:= $(addsuffix .c, $(addprefix ${MAINB_DIR}, ${SRCSB}))

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/OBJS/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/#
OBJS		= $(addprefix ${OBJS_DIR}, $(addsuffix .o, ${FILES}))
OBJSB		= $(addprefix ${OBJS_DIR}, $(addsuffix .o, ${FILESB}))

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/DEPS/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/#
DEPS		= $(addsuffix .d, $(basename ${OBJS}))
DEPSB		= $(addsuffix .d, $(basename ${OBJSB}))

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/COMANDS/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-#
RM			= rm -f
AR			= ar crs
MK			= Makefile
MKD			= mkdir -p
CFLAGS		= -Wall -Wextra -Werror
INCLUDE		= -I${HEADER}
B_INCLUDE	= -I${B_HEADER}

#-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/RULES/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-#
${OBJS_DIR}%.o	:	${SRCS_DIR}/*/%.c ${MK}
	@${MKD} $(dir $@)
	@${CC} -MT $@ ${CFLAGS} -MMD -MP ${INCLUDE} -c $< -o $@
	@echo "${PINK}Compiling ${YELLOW}$<...${DEF_COLOR}"

${OBJS_DIR}%.o	:	${SRCSB_DIR}/*/%.c ${MK}
	@${MKD} $(dir $@)
	@${CC} -MT $@ ${CFLAGS} -MMD -MP ${B_INCLUDE} -c $< -o $@
	@echo "${PINK}Compiling ${YELLOW}$<...${DEF_COLOR}"

all				:
	@$(MAKE) make_libft
	@$(MAKE) ${NAME}

bonus			:
	@$(MAKE) BONUS=1 all

make_libft		:
	@make -C ${LFT}
	@echo ""

ifndef BONUS
${NAME}			::	${OBJS}
	@cp ${LFTA} ${NAME}
	@${AR} ${NAME} ${OBJS}
	@echo "${GREEN}LIBRARY: ft_printf has been created${DEF_COLOR}"
else
${NAME}			::	${OBJSB}
	@cp ${LFTA} ${NAME}
	@${AR} ${NAME} ${OBJSB}
	@echo "${GREEN}LIBRARY: ft_printf has been created${DEF_COLOR}"
endif

${NAME}			::
	@echo "${YELLOW}Nothing to be done for 'ft_printf'${DEF_COLOR}"

clean			:
	@make clean -C ${LFT}
	@${RM} -r ${OBJS_DIR}
	@echo "${RED}OBJS && DEPS of 'ft_printf' has been removed${DEF_COLOR}"

fclean			:	
	@$(MAKE) clean
	@${RM} ${NAME} ${LFTA}
	@echo "${RED}LIBRARY: 'libft' has been removed${DEF_COLOR}"
	@echo "${RED}LIBRARY: 'ft_printf' has been removed${DEF_COLOR}"
	@echo ""

re				:
	@echo ""
	@$(MAKE) fclean
	@$(MAKE) all
	@echo ""
	@echo "${CIAN}LIBRARY: ft_printf has been remake${DEF_COLOR}"

.PHONY: all clean fclean re make_libft bonus

-include	${DEPS}
-include	${DEPSB}
