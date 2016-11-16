class RobotMovement
	def count_paths matrix, row, colomn, width, heigth
		return 0 if matrix[row][colomn]
		return 1 if row == width - 1 and colomn == heigth - 1
		count = 0
		matrix[row][colomn] = true 
		count += count_paths matrix, row - 1, colomn, width, heigth if row > 0
		count += count_paths matrix, row + 1, colomn, width, heigth if row < width - 1
		count += count_paths matrix, row, colomn - 1, width, heigth if colomn > 0
		count += count_paths matrix, row, colomn + 1, width, heigth if colomn < heigth - 1
		matrix[row][colomn] = false
		count
	end
end
robot_movement = RobotMovement.new
ARGV.each { |line|
	begin
		array = line.split(',').map(&:to_i)
		width = array[0]
		height = array[1]
		matrix = (1..width).map { Array.new height, false }
		puts robot_movement.count_paths matrix, 0, 0, width, height
	rescue
		puts "invalid input"
		next
	end
}
