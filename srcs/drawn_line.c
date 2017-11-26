/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   drawn_line.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: enanrock <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/21 14:48:25 by enanrock          #+#    #+#             */
/*   Updated: 2017/11/23 18:44:00 by enanrock         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "fdf.h"

static void		horizontal_vesion_up(t_mem *mem, int pixel[2][2], int color)
{
	int		a;
	int		b;
	int		p;
	int		to_draw[2];

	a = 2 * ABS((pixel[0][1] - pixel[1][1]));
	b = a - 2 * ABS((pixel[0][0] - pixel[1][0]));
	p = a - ABS((pixel[0][0] - pixel[1][0]));
	to_draw[0] = pixel[0][0];
	to_draw[1] = pixel[0][1];
	while ((to_draw[0] < pixel[1][0]) || (to_draw[1] < pixel[1][1]))
	{
		if (p < 0)
			p += a;
		else if (p >= 0)
		{
			to_draw[1]++;
			p += b;
		}
		to_draw[0]++;
		mlx_pixel_put(mem->mlx, mem->win, to_draw[0], to_draw[1], color);
	}
	mlx_pixel_put(mem->mlx, mem->win, pixel[0][0], pixel[0][1], 0x00ffffff);
	mlx_pixel_put(mem->mlx, mem->win, pixel[1][0], pixel[1][1], 0x00ffffff);
}

static void		horizontal_vesion_down(t_mem *mem, int pixel[2][2], int color)
{
	int		a;
	int		b;
	int		p;
	int		to_draw[2];

	a = 2 * ABS((pixel[0][1] - pixel[1][1]));
	b = a - 2 * ABS((pixel[0][0] - pixel[1][0]));
	p = a - ABS((pixel[0][0] - pixel[1][0]));
	to_draw[0] = pixel[0][0];
	to_draw[1] = pixel[0][1];
	while ((to_draw[0] < pixel[1][0]) || (to_draw[1] > pixel[1][1]))
	{
		if (p < 0)
			p += a;
		else if (p >= 0)
		{
			to_draw[1]--;
			p += b;
		}
		to_draw[0]++;
		mlx_pixel_put(mem->mlx, mem->win, to_draw[0], to_draw[1], color);
	}
	mlx_pixel_put(mem->mlx, mem->win, pixel[0][0], pixel[0][1], 0x00ffffff);
	mlx_pixel_put(mem->mlx, mem->win, pixel[1][0], pixel[1][1], 0x00ffffff);
}

static void		vertical_vesion_up(t_mem *mem, int pixel[2][2], int color)
{
	int		a;
	int		b;
	int		p;
	int		to_draw[2];

	a = 2 * ABS((pixel[0][0] - pixel[1][0]));
	b = a - 2 * ABS((pixel[0][1] - pixel[1][1]));
	p = a - ABS((pixel[0][1] - pixel[1][1]));
	to_draw[0] = pixel[0][0];
	to_draw[1] = pixel[0][1];
	while ((to_draw[0] < pixel[1][0]) || (to_draw[1] < pixel[1][1]))
	{
		if (p < 0)
			p += a;
		else if (p >= 0)
		{
			to_draw[0]++;
			p += b;
		}
		to_draw[1]++;
		mlx_pixel_put(mem->mlx, mem->win, to_draw[0], to_draw[1], color);
	}
	mlx_pixel_put(mem->mlx, mem->win, pixel[0][0], pixel[0][1], 0x00ffffff);
	mlx_pixel_put(mem->mlx, mem->win, pixel[1][0], pixel[1][1], 0x00ffffff);
}

static void		vertical_vesion_down(t_mem *mem, int pixel[2][2], int color)
{
	int		a;
	int		b;
	int		p;
	int		to_draw[2];

	a = 2 * ABS((pixel[0][0] - pixel[1][0]));
	b = a - 2 * ABS((pixel[0][1] - pixel[1][1]));
	p = a - ABS((pixel[0][1] - pixel[1][1]));
	to_draw[0] = pixel[0][0];
	to_draw[1] = pixel[0][1];
	while ((to_draw[0] < pixel[1][0]) || (to_draw[1] > pixel[1][1]))
	{
		if (p < 0)
			p += a;
		else if (p >= 0)
		{
			to_draw[0]++;
			p += b;
		}
		to_draw[1]--;
		mlx_pixel_put(mem->mlx, mem->win, to_draw[0], to_draw[1], color);
	}
	mlx_pixel_put(mem->mlx, mem->win, pixel[0][0], pixel[0][1], 0x00ffffff);
	mlx_pixel_put(mem->mlx, mem->win, pixel[1][0], pixel[1][1], 0x00ffffff);
}

void			bresenham_line_algo(t_mem *mem, int pixel[2][2], int color)
{
	int		swap_done;

	swap_done = FALSE;
	if (pixel[1][0] < pixel[0][0])
	{
		swap_done = TRUE;
		ft_memswap((void *)(&(pixel[0])), (void *)(&(pixel[1])));
	}
	if (ABS((pixel[0][1] - pixel[1][1])) >= ABS((pixel[0][0] - pixel[1][0])))
	{
		if (pixel[0][1] <= pixel[1][1])
			vertical_vesion_up(mem, pixel, color);
		else
			vertical_vesion_down(mem, pixel, color);
	}
	else
	{
		if (pixel[0][1] <= pixel[1][1])
			horizontal_vesion_up(mem, pixel, color);
		else
			horizontal_vesion_down(mem, pixel, color);
	}
	if (swap_done == TRUE)
		ft_memswap((void *)(&(pixel[0])), (void *)(&(pixel[1])));
}
