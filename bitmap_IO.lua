
-- format : 1 / 2
function bitmap_out(image, filename)

	file = io.open(filename .. ".pbm", "w")

	bitmap_write_header(file, image["format"])
	bitmap_write_picture_size(file, image["size"])

	if image["format"] ~= 1 then
		bitmap_write_scale(file, image["scale_number"])
	end

	bitmap_write_pixels(file, image["size"], image["pixels"])

	io.close(file)
end

function bitmap_write_picture_size(file, size)
	io.output(file)
	io.write(size.x .. " " .. size.y .. "\n")
end
-- format : 1 (black and white) / 2 (gray scale)
function bitmap_write_header(file, format)
	io.output(file)
	io.write("P" .. format .. "\n")
end

function bitmap_write_scale(file, scale_number)
	io.output(file)
	io.write(scale_number .. "\n")
end

function bitmap_write_pixels(file, size, pixels)
	io.output(file)
	
	taille_x = size.x
	taille_y = size.y

	for index_x = 1, taille_x do
	

		for index_y=1, taille_y do
			io.write(pixels[index_x][index_y] .. " ")
		end
		io.write("\n")
	end
		
end

return {bitmap_out = bitmap_out}
