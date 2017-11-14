/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: enanrock <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/10 22:40:45 by enanrock          #+#    #+#             */
/*   Updated: 2017/11/14 02:37:57 by enanrock         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fdf.h"

int		main(void)
{
	void	*mlx;
	void	*mlx_window;

	ft_putendl("\n~todo mlx_init()~");
	mlx = mlx_init();
	ft_putendl("~done mlx_init()~");
	ft_putendl("\n~todo mlx_new_window(- - -)~");
	mlx_window = mlx_new_window(mlx, 1000, 80, "mlx test");
	ft_putendl("~done mlx_new_window()~");
	ft_putendl("\n~todo mlx_loop(- - -)~");
	mlx_loop(mlx);
	ft_putendl("~done mlx_loop(- - -)~");
	return (0);
}
