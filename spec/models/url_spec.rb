describe Url do 
  let(:url) { Url.new }

  describe "#generate_unique_id" do
    it "returns a unique string" do 
      :url.generate_unique_id.should eql(1)
    end
  end

  describe '#is_duplicate?' do
    it 'returns true if '
  end




end