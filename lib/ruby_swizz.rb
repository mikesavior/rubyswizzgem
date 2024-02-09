require 'date'

class RubySwizz
  class << self
    def beats_time(time_input = nil)
      @time = time_check(time_input)
      @swatch_beats = convert_to_beats
    end

    private

    def convert_to_beats
      # Calculate the total seconds elapsed since midnight
      total_seconds = @time.hour * 3600 + @time.min * 60 + @time.sec

      # Calculate the Swatch Beats
      beetz = (total_seconds / 86.4).floor

      # Return the Swatch Beats
      beetz
    end

    def time_check(inpt)
      return DateTime.now.new_offset(1.0/24) if inpt.nil?
      if inpt.is_a? String
        begin
          DateTime.parse(inpt).new_offset(1.0/24)
        rescue
          DateTime.now.new_offset(1.0/24)
        end
      end
    end
  end
end
