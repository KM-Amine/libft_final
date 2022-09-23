NAME = libft.a
#MAIN = main

CC = gcc
CFLAGS = -Wall -Wextra -Werror -I .
DEPFLAGS = -MP -MD
AR = ar rcs
RM = rm -rf

SRC = $(filter-out ft_ls%.c, $(wildcard *.c))
BSRC =$(filter ft_ls%.c ,$(wildcard *.c))

OBJS = $(SRC:.c=.o)
BOBJS = $(BSRC:.c=.o)

HEADER = $(wildcard *.h)
DEPFILES = $(SRC:.c=.d)
BDEPFILES = $(BSRC:.c=.d)

all : $(NAME)

bonus : all $(BOBJS)
	@$(AR) $(NAME) $(BOBJS)
	@echo "------\033[91m\033[107mbonus made \033[0m--------"

$(NAME) : $(OBJS)
	@$(AR) $@ $^
	@echo all made
#$(NAME): $(OBJS) $(HEADER)

#$(MAIN) : $(OBJS)
#	@$(CC) $(FLAGS) $^ -o $@
#	@echo compiling


%.o : %.c
	@$(CC) $(FLAGS) $(DEPFLAGS) -c $< -o $@
#%.o : %.c $(HEADER)
#	@$(CC) $(FLAGS) -c $< -o $@
#dependencies :$(SRC)
#	@$(CC) -MM $^ > $@

clean :
	@$(RM) $(OBJS) $(BOBJS) $(DEPFILES) $(BDEPFILES)
	@echo "clean completed";
fclean : clean
	@$(RM) $(NAME)
	@echo "full clean completed"
re : fclean all

.PHONY : all bonus clean fclean re

#-include dependencies
-include $(DEPFILES) $(BDEPFILES)
