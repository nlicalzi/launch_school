# source: https://launchschool.com/exercises/c618c0e4

class TextAnalyzer
  def process
   file = File.open('sample_text.txt')
   yield(file.read)
   file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |txt| puts "#{txt.scan(/\n\n/).count} paragraph(s)" } # "__ paragraphs"
analyzer.process { |txt| puts "#{txt.scan(/\n/).count} line(s)" } # "__ lines"
analyzer.process { |txt| puts "#{txt.split(' ').count} word(s)" } # "__ words"