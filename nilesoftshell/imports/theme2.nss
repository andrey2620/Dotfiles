﻿theme
{
	// theme.name = auto, classic, white, black, or modern
	name = "modern"

	// view = auto, compact, small, medium, large, wide
	view = view.compact

	dark = true or false

	background
	{
		color = color value
		opacity = value from 0 to 100

		// effect value 0 = disable, 1 = transparent, 2 = blur, 3 = acrylic
		effect = auto

		// for acrylic
		effect = [3, tint color, opacity]

		gradient
		{
			enabled = boolean value

			// linear = [x1, x2, y1, y2]
			linear = [0, 100, 0, 0]

			// or radial = [cx, cy, r, fx, fy]
			radial =[ 100, 100, 150, 100, 100]

			// stop = [offset, stop-color]
			stop = [0.5, color.accent, 20]

			// or add more stop
			stop = [
				[offset, stop-color],
				[offset, stop-color],
				[offset, stop-color]
			]
		}
	}

	item
	{
		opacity = value from 0 to 100
		radius = value from 0 to 3

		// prefix value [auto, 0 = dont display,  1 = display, 2 = ignore]
		prefix = 1

		text
		{
			normal = color
			normal.disabled = color
			select = color
			select.disabled = color
		}

		back
		{
			normal = color
			normal.disabled = color
			select = color
			select.disabled = color
		}

		border
		{
			normal = color
			normal.disabled = color
			select = color
			select.disabled = color
		}

		padding
		{
			left = value
			top = value
			right = value
			bottom = value
		}

		margin
		{
			left = value
			top = value
			right = value
			bottom = value
		}
	}

	border
	{
		enabled = boolean value
		size = value from 0 to 10
		color =  = value
		opacity = value
		radius = value

		padding
		{
			left = value
			top = value
			right = value
			bottom = value
		}
	}

	shadow
	{
		enabled = boolean value
		size = value from 0 to 30
		color = value
		opacity = value from 0 to 100
		offset = value from 0 to 30
	}

	font
	{
		size = value start from 6
		name = "tahoma"
		weight = value from 1 to 9
		italic = 0
	}

	separator
	{
		size = value form 0 to 40
		color = value
		opacity = value

		margin
		{
			left = value
			top = value
			right = value
			bottom = value
		}
	}

	symbol
	{
		normal = color
		normal.disabled = color
		select = color
		select.disabled = color

		// or
		chevron
		{
			normal = color
			normal.disabled = color
			select = color
			select.disabled = color
		}

		checkmark
		{
			normal = color
			normal.disabled = color
			select = color
			select.disabled = color
		}

		bullet
		{
			normal = color
			normal.disabled = color
			select = color
			select.disabled = color
		}
	}

	image
	{
		enabled = boolean value

		color = [color1, color2, color3]
		gap = value
		glyph = "font name" // font name for default glyph
		scale = boolean value
		align = value [0 = Display only the check mark, 1 = Display only the image, 2 = Display the image and check mark together]
	}

	layout
	{
		// Right-to-left layout display for Middle Eastern languages
		rtl = boolean value

		// Align submenus
		popup = value from -20 to 20
	}
}