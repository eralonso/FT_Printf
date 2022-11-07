/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: eralonso <eralonso@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/02 12:36:13 by eralonso          #+#    #+#             */
/*   Updated: 2022/11/04 21:03:04 by eralonso         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include	"ft_printf.h"

int	ft_free_error(t_stack *stack)
{
	va_end(stack->info->args);
	free(stack->info);
	return (-1);
}

void	ft_reset_flags(t_flags *flags)
{
	flags->width = 0;
	flags->dot = 0;
	flags->wdot = 0;
	flags->dash = 0;
	flags->zero = 0;
	flags->hastag = 0;
	flags->space = 0;
	flags->plus = 0;
}

t_flags	*ft_init_flags(void)
{
	t_flags	*flags;

	flags = (t_flags *)malloc(sizeof(t_flags) * 1);
	if (!flags)
		return (0);
	ft_reset_flags(flags);
	return (flags);
}

t_info	*ft_init_info(char *str)
{
	t_info	*info;

	info = (t_info *)malloc(sizeof(t_info) * 1);
	if (!info)
		return (0);
	info->err = 0;
	info->str = str;
	info->c = *str;
	info->bytes = 0;
	return (info);
}

int	ft_printf(char const *str, ...)
{
	t_stack	stack;
	int		bytes;

	stack.info = ft_init_info((char *)str);
	if (!stack.info)
		return (-1);
	va_start(stack.info->args, str);
	stack.flags = ft_init_flags();
	if (!stack.flags)
		return (ft_free_error(&stack));
	while (stack.info->bytes != -1 && stack.info->c)
	{
		ft_reset_flags(stack.flags);
		ft_formatize(&stack, stack.info->str);
		if (stack.info->err)
			stack.info->bytes = -1;
	}
	free(stack.flags);
	va_end(stack.info->args);
	bytes = stack.info->bytes;
	free(stack.info);
	return (bytes);
}
