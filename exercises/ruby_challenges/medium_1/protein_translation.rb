# source: https://launchschool.com/exercises/ba813e5c


# #scan(/.../) -> list of every consecutive 3 char substring

class InvalidCodonError < StandardError; end

class Translation
  CODON_TO_AMINO = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }.freeze

  def self.of_codon(codon)
    CODON_TO_AMINO[codon]
  end

  def self.of_rna(rna)
    result = []
    rna.scan(/.../).each do |sequence|
      raise InvalidCodonError unless CODON_TO_AMINO.keys.include?(sequence)
      codon = CODON_TO_AMINO[sequence]
      break if codon == 'STOP'
      result << codon
    end
    result
  end
end