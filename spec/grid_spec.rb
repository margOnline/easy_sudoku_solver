require 'grid'

describe Grid do 

  let(:puzzle) {'015003002000100906270068430490002017501040380003905000900081040860070025037204600'}
  let(:grid) {Grid.new(puzzle)}
  let(:cells) {(1..81).to_a}


  context 'initialization' do

    it 'has 81 cells' do
      expect(grid.cells.size).to eq 81
    end

    it 'has an unsolved first cell' do
      expect(grid.cells[0].value).to eq 0
    end

    it 'has a solved second cell with value 1' do
      expect(grid.cells[1].value).to eq 1
    end
    
    it 'knows if it is not solved' do
      expect(grid.solved?).to be_false
    end
  end

  context 'knows if it is' do
    let(:puzzle) {'615493872348127956279568431496832517521746389783915264952681743864379125137254698'}
    let(:grid) {Grid.new(puzzle)}
    it 'solved' do
      expect(grid.solved?).to be_true
    end
  end

  context 'has 8 neighbours in' do
    it 'row' do
      row_neighbours = grid.get_row_neighbours_for(grid.cells[56])
      expect(row_neighbours.size).to eql 8
    end

    it 'column' do
      col_neighbours = grid.get_column_neighbours_for(grid.cells[75])
      expect(col_neighbours.size).to eql 8
    end

    it 'box' do
      expect(grid.get_box_neighbours(grid.cells[45])).to eq 6
    end

  end

  xit 'can solve the puzzle' do
    expect(grid.solved?).to be_false
    grid.solved?
    expect(grid.solved?).to be_true
    expect(grid.to_s).to eq ('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
  end

 
end