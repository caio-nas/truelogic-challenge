require 'csv'
require 'bigdecimal'

class WeatherService
  RECORD_ROW_SIZE = 90

  ### REDUCE VERSION - Time complexity O(n)
  def self.smallest_temperature_spread_day(text_input)
    smallest_spread = BigDecimal::INFINITY
    extract_number = ->(str) { str.delete('^0-9.') }

    text_input.each_line.reduce(nil) do |selected_day, row|
      next selected_day if row.size != RECORD_ROW_SIZE

      cols = row.tr_s(' ', ' ').split
      valid_record = (current_day = BigDecimal(extract_number[cols[0]]).to_i rescue nil) &&
                     (maximum = BigDecimal(extract_number[cols[1]]) rescue nil) &&
                     (minimum = BigDecimal(extract_number[cols[2]]) rescue nil)


      next selected_day unless valid_record

      current_spread = maximum - minimum
      if current_spread <= smallest_spread
        smallest_spread = current_spread
        selected_day = current_day
      end
    end
  end

  ### HASH VERSION - uses sort, cleaner code but lower performance
  ### best case O(n log n), worst case O(n²)
  # def self.smallest_temperature_spread_day(text_input)
  #   ranking = Hash.new{ |hash, key| hash[key] = [] }
  #   extract_number = ->(str) { str.gsub(/\A\D*|\D*\z/, '') }

  #   text_input.each_line do |row|
  #     next if row.size != RECORD_ROW_SIZE
  #     cols = row.tr_s(' ', ' ').split

  #     valid_record = (day = BigDecimal(extract_number[cols[0]]).to_i rescue nil) &&
  #                    (maximum = BigDecimal(extract_number[cols[1]]) rescue nil) &&
  #                    (minimum = BigDecimal(extract_number[cols[2]]) rescue nil)

  #     ranking[maximum - minimum] << day if valid_record
  #   end

  #   smallest_spread, days = ranking.sort.first

  #   days&.last
  # end

end
