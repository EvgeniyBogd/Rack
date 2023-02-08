class Format

  FORMATS = {year: "%Y", month: "%m", day: "%d", hour: "%H", minute: "%M", second: "%S"}

  attr_reader :formats, :unknown_formats
  
  def initialize(input)
    @input = input 
    
    check_format
  end
  
  def result
    Time.now.strftime(@formats.join('-'))
  end

  def check_format
    @formats = []
    @unknown_formats = []

    @input.split(',').each do |format|
      if FORMATS[format.to_sym]
        @formats << FORMATS[format.to_sym]
      else
        @unknown_formats << format
      end
    end
  end  
end    