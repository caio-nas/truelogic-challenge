require 'csv'
require 'bigdecimal'
require 'debug'

class WeatherService
  RECORD_ROW_SIZE = 90

  def self.smallest_temperature_spread(text_input)
    ranking = Hash.new{ |hash, key| hash[key] = [] }
    extract_number = ->(str) { str.gsub(/\A\D*|\D*\z/, '') }

    text_input.each_line do |row|
      if row.size == RECORD_ROW_SIZE
        cols = row.tr_s(' ', ' ').split

        valid_record = (day = BigDecimal(extract_number[cols[0]]).to_i rescue nil) &&
                       (maximum = BigDecimal(extract_number[cols[1]]) rescue nil) &&
                       (minimum = BigDecimal(extract_number[cols[2]]) rescue nil)

        ranking[maximum - minimum] << day if valid_record
      end
    end

    smallest_spread, days = ranking.sort.first

    days&.last
  end

end
