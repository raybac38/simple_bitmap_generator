
if arg[4] == nil then
	print(arg[0] .. " <size_x> <size_y> <name> <profondeur>")
	print("profondeur = nombre de couleur differente en plus de noir et blanc")
	return
end


IO_module = require "bitmap_IO"

image = {}

size = {}
size.x = arg[1]
size.y = arg[2]

image["format"] = 2
image["scale_number"] = 1 + arg[4]

image["size"] = size

pixels = {}

for index_i = 1, size.x do
	pixels[index_i] = {}
	for index_j = 1, size.y do
		pixels[index_i][index_j] = math.floor(math.random(0, image.scale_number))
	end
end

image["pixels"] = pixels

IO_module.bitmap_out(image, arg[3])
