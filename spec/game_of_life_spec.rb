require_relative '../lib/game_of_life'

RSpec.describe GameOfLife do
  describe '#toggle_cell!' do
    it 'should change the cell status' do
      subject.toggle_cell! 0, 0
      expect(subject.board[0][0]).to eq true
    end

    it 'should change the cell status twice' do
      subject.toggle_cell! 1, 1
      subject.toggle_cell! 1, 1
      expect(subject.board[1][1]).to eq false
    end
  end

  describe '#next_day!' do
    context 'one cell' do
      subject { GameOfLife.new(3) }

      context 'dead cell' do
        it 'checks for 0 neighbors' do
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 1 neighbor' do
          subject.toggle_cell!(2, 0)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 2 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 3 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          subject.next_day!
          expect(subject.board[1][1]).to eq true
        end

        it 'checks for 4 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 5 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2).toggle_cell!(1, 0)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 6 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2).toggle_cell!(1, 0).toggle_cell!(0, 2)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 7 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2).toggle_cell!(1, 0).toggle_cell!(0, 2)
          .toggle_cell!(2, 1)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 8 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2).toggle_cell!(1, 0).toggle_cell!(0, 2)
          .toggle_cell!(2, 1).toggle_cell!(0, 0)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end
      end

      context 'alive cell' do
        before { subject.toggle_cell! 1, 1 }

        it 'checks for 0 neighbors' do
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 1 neighbor' do
          subject.toggle_cell!(2, 0)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 2 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1)
          subject.next_day!
          expect(subject.board[1][1]).to eq true
        end

        it 'checks for 3 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          subject.next_day!
          expect(subject.board[1][1]).to eq true
        end

        it 'checks for 4 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 5 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2).toggle_cell!(1, 0)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 6 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2).toggle_cell!(1, 0).toggle_cell!(0, 2)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 7 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2).toggle_cell!(1, 0).toggle_cell!(0, 2)
          .toggle_cell!(2, 1)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end

        it 'checks for 8 neighbors' do
          subject.toggle_cell!(2, 0).toggle_cell!(0, 1).toggle_cell!(2, 2)
          .toggle_cell!(1, 2).toggle_cell!(1, 0).toggle_cell!(0, 2)
          .toggle_cell!(2, 1).toggle_cell!(0, 0)
          subject.next_day!
          expect(subject.board[1][1]).to eq false
        end
      end
    end

    context 'all cells' do
      subject { GameOfLife.new(4) }

      it 'should check if board is proper on the next iteration 1' do
        subject.toggle_cell! 1, 1
        subject.toggle_cell! 2, 2
        subject.next_day!
        expect(subject.board).to eq [[false, false, false, false],
        [false, false, false, false],
        [false, false, false, false],
        [false, false, false, false]]
      end

      it 'should check if board is proper on the next iteration 2' do
        subject.toggle_cell! 0, 1
        subject.toggle_cell! 1, 2
        subject.toggle_cell! 2, 0
        subject.toggle_cell! 2, 1
        subject.toggle_cell! 2, 2
        subject.next_day!
        expect(subject.board).to eq [[false, false, false, false],
        [true, false, true, false],
        [false, true, true, false],
        [false, true, false, false]]
      end

      it 'should check if board is proper two days from the start' do
        subject.toggle_cell! 0, 1
        subject.toggle_cell! 1, 2
        subject.toggle_cell! 2, 0
        subject.toggle_cell! 2, 1
        subject.toggle_cell! 2, 2
        subject.next_day!
        subject.next_day!
        expect(subject.board).to eq [[false, false, false, false],
        [false, false, true, false],
        [true, false, true, false],
        [false, true, true, false]]
      end
    end
  end
end
