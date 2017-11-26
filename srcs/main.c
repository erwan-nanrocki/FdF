/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: enanrock <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/10 22:40:45 by enanrock          #+#    #+#             */
/*   Updated: 2017/11/23 18:44:14 by enanrock         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fdf.h"

static int		key_funct(int keycode, void *param)
{
	t_mem	*mem;

	mem = (t_mem *)param;
	if (keycode == KEY_LEFT)
		mem->point[1][0] += -100;
	if (keycode == KEY_RIGHT)
		mem->point[1][0] += 100;
	if (keycode == KEY_UP)
		mem->point[1][1] += -100;
	if (keycode == KEY_DOWN)
		mem->point[1][1] += 100;
	if (keycode == KEY_R)
	{
		mem->point[1][0] = 500;
		mem->point[1][1] = 500;
	}
	if (keycode == KEY_ECHAP)
	{
		ft_putendl("GTFO");
		exit(0);
	}
	mlx_clear_window(mem->mlx, mem->win);
	bresenham_line_algo(mem, mem->point, BLUE);
	return (0);
	ft_putunbr((unsigned int)mem);
}

int				main(void)
{
	t_mem	mem;

	ft_putendl("\n~todo mlx_init()~");
	mem.mlx = mlx_init();
	ft_putendl("~done mlx_init()~");
	ft_putendl("\n~todo mlx_new_window(- - -)~");
	mem.win = mlx_new_window(mem.mlx, 1000, 1000, "test line");
	ft_putendl("~done mlx_new_window()~");
	ft_putendl("\n~todo event~");
	mem.point[0][0] = 500;
	mem.point[0][1] = 500;
	mem.point[1][0] = 500;
	mem.point[1][1] = 500;
	mlx_key_hook(mem.win, key_funct, &mem);
	ft_putendl("~done event~");
	ft_putendl("\n~todo mlx_loop(- - -)~");
	mlx_loop(mem.mlx);
	ft_putendl("~done mlx_loop(- - -)~");
	return (0);
}
/*
**  mlx_init        in  mlx_init_loop.m
**  mlx_loop        in  mlx_init_loop.m
**  mlx_new_window  in  mlx_new_window.m
*/
