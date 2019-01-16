require_relative '../lib/ttt.rb'
describe Turn do
  let(:a) { Turn.new }
  arr = ['X', 2, 'O', 4, 'X', 6, 'O', 8, 'X']
  describe '#add_sign' do
    it 'adds the sign from player' do
      expect(a.add_sign(2, 'X', [1, 2, 3, 4, 5, 6, 7, 8, 9])).to eq('X')
    end
  end
  describe '#check_winner' do
    it 'checks winner' do
      expect(a.check_winner(['X', 'X', 'X', 4, 5, 6, 7, 8, 9], 'X')).to eq(true)
      expect(a.check_winner([1, 2, 3, 4, 5, 6, 'O', 'O', 'O'], 'O')).to eq(true)
      expect(a.check_winner([1, 2, 3, 'O', 'O', 'O', 7, 8, 9], 'O')).to eq(true)
      expect(a.check_winner([1, 2, 'X', 4, 5, 'X', 7, 8, 'X'], 'X')).to eq(true)
      expect(a.check_winner(['X', 2, 3, 'X', 5, 6, 'X', 8, 9], 'X')).to eq(true)
      expect(a.check_winner(['X', 2, 3, 4, 'X', 6, 7, 8, 'X'], 'X')).to eq(true)
      expect(a.check_winner([1, 2, 'X', 4, 'X', 6, 'X', 8, 9], 'X')).to eq(true)
      expect(a.check_winner([1, 'X', 3, 4, 'X', 6, 7, 'X', 9], 'X')).to eq(true)
      expect(a.check_winner([1, 'X', 3, 4, 'X', 6, 7, 8, 'X'], 'X')).not_to eq(true)
      expect(a.check_winner([1, 'X', 3, 4, 'X', 6, 7, 8, 'X'], 'X')).not_to eq(true)
    end
  end
  describe '#check_draw' do
    it 'check draw' do
      raise unless a.check_draw(8) == false
    end
  end
  describe '#game_over' do
    it 'checks game over' do
      raise unless a.game_over(true, true) == true
    end
    it 'also checks winner' do
      expect(a.check_winner(['X', 'X', 'X', 4, 5, 6, 7, 8, 9], 'X')).to eq(true)
    end
  end
  describe '#check' do
    arr = ['X', 2, 'O', 4, 'X', 6, 'O', 8, 'X']
    it 'checks if move is allowed' do
      expect(a.check(7, arr)).not_to eq(true)
      expect(a.check(1, arr)).to eq(false)
    end
  end
  describe '#check_space' do
    it 'checks if space is occupied' do
      expect(a.check_space(1, arr)).to eq(false)
      expect(a.check_space(7, arr)).not_to eq(true)
      expect(a.check_space(9, arr)).to eq(false)
      expect(a.check_space(2, arr)).to eq(true)
    end
  end
  describe '#check_position' do
    it 'checks if choice is within range' do
      expect(a.check_position(10)).to eq(false)
      expect(a.check_position(7)).to eq(true)
      expect(a.check_position(0)).not_to eq(true)
      expect(a.check_position(-1)).not_to eq(true)
    end
  end
end
