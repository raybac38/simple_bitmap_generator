
if arg[3] == nil then
	print(arg[0] .. " <size_x> <size_y> <name>")
	return
end


IO_module = require "bitmap_IO"

image = {}


image["format"] = 1

size = {}
size.x = arg[1]
size.y = arg[2]

image["size"] = size

pixels = {}

for index_i=1, size.x do
	pixels[index_i] = {}
	for index_j=1,size.y do

		pixels[index_i][index_j] = math.floor(math.random() + 0.5)
	end
end

image["pixels"] = pixels

IO_module.bitmap_out(image, arg[3])
