class GameOfLife
  attr_reader :board

  def initialize(size = 10)
    @board = Array.new(size) { Array.new(size, false) }
    @size = size
  end

  def toggle_cell!(row, column)
    if @board[row][column]
      die! row, column
    else
      live! row, column
    end
    self
  end

  def next_day!
    next_day_board = Array.new(@size) { Array.new(@size) }
    next_day_board.each.with_index do |row, i|
      row.each_index do |j|
        next_day_board[i][j] = cell_status(i, j)
      end
    end
    @board = next_day_board
  end

  def to_s
    output = ''
    @board.each do |row|
      row.each { |cell| output << "#{sign(cell)} " }
      output << "\n"
    end
    output
  end

  private

  def live!(row, column)
    @board[row][column] = true
  end

  def die!(row, column)
    @board[row][column] = false
  end

  def cell_status(row, column)
    alive_neigbours = count_alive_neighbors(row, column)
    if @board[row][column]
      return true if alive_neigbours.between?(2, 3)
      false
    else
      return true if alive_neigbours == 3
      false
    end
  end

  def count_alive_neighbors(row, column)
    count = neighbors(row, column).count(true)
    return count - 1 if @board[row][column]
    count
  end

  def neighbors(row, column)
    start_row = row - 1 < 0 ? row : row - 1
    end_row = row + 1 > @size - 1 ? row : row + 1
    start_column = column - 1 < 0 ? column : column - 1
    end_column = column + 1 > @size - 1 ? column : column + 1
    neighbors_array(start_row, end_row, start_column, end_column)
  end

  def neighbors_array(start_row, end_row, start_column, end_column)
    output = []
    start_row.upto(end_row) do |i|
      start_column.upto(end_column) { |j| output << @board[i][j] }
    end
    output
  end

  def sign(cell)
    return 'O' if cell
    '.'
  end
end

puts GameOfLife.new(3).toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2).board[1][1]
