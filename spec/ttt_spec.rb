require_relative '../lib/ttt.rb'
describe Turn do
    let(:a) {Turn.new}
    describe "#add_sign" do
        it 'adds the sign from player' do
            expect(a.add_sign(2,'X',[1,2,3,4,5,6,7,8,9])).to eq('X')
        end
    end
    describe "#check_winner" do
        it "checks winner" do
            expect(a.check_winner(['X','X','X',4,5,6,7,8,9], 'X')).to eq(true)
        end
    end
    describe "#check_draw" do
        it "check draw" do
            raise unless a.check_draw(8) == false
        end
    end
    describe "#game_over" do
        it "checks game over" do
            raise unless a.game_over(true, true) == true
        end
        it "also checks winner" do
            expect(a.check_winner(['X','X','X',4,5,6,7,8,9], 'X')).to eq(true)
        end
    end
end