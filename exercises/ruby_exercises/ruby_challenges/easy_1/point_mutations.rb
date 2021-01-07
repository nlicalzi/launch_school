# source: https://launchschool.com/exercises/b94c1dcb

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    distance = 0
    max_idx = strand.size > other_strand.size ? other_strand.size : strand.size
    0.upto(max_idx - 1) do |idx|
      distance +=1 unless strand[idx] == other_strand[idx]
    end
    distance
  end

  private
  attr_accessor :strand
end