require 'oystercard'
describe Oystercard do
  it 'oystercard to interact with balance' do
    card = Oystercard.new
    expect(card).to respond_to(:balance)
  end

  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  describe "#top_up" do
    it "top up the balance" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

    it "top up the card with 10$" do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end

    it 'throws an error if it tries to go over maximum limit' do
      subject.top_up(Oystercard::TOPUP_LIMIT)
      expect { subject.top_up(1) }.to raise_error "£90 limit reached"
    end

  end

end
