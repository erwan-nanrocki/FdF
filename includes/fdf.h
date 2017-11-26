/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   fdf.h                                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: enanrock <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2017/11/10 22:42:14 by enanrock          #+#    #+#             */
/*   Updated: 2017/11/23 18:43:53 by enanrock         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FDF_H
# define FDF_H

# include <stdlib.h>
# include "libft.h"
# include "mlx.h"

# define ABS(x) ((x < 0) ? -x : x)

# define TRUE  1
# define FALSE 0

# define KEY_Q 12
# define KEY_W 13
# define KEY_E 14
# define KEY_R 15
# define KEY_T 17
# define KEY_Y 16
# define KEY_U 32
# define KEY_I 34
# define KEY_O 31
# define KEY_P 35

# define KEY_LEFT  123
# define KEY_RIGHT 124
# define KEY_DOWN  125
# define KEY_UP    126
# define KEY_ECHAP 53

# define RED    0x00ff0000
# define GREEN  0x0000ff00
# define BLUE   0x000000ff
# define YELLOW 0x00ffff00
# define PURPLE 0x00ff00ff
# define CYAN   0x0000ffff
# define GREY   0x00979797

typedef	struct	s_mem
{
	void		*mlx;
	void		*win;
	int			point[2][2];
}				t_mem;

void			bresenham_line_algo(t_mem *mem, int pixel[2][2], int color);

#endif
