require 'csv'
require 'bigdecimal'
require 'debug'

class SoccerService
  RECORD_ROW_SIZE = 59

  ### Time complexity O(n)
  def self.smallest_absolute_goal_difference(text_input)
    smallest_goal_difference = BigDecimal::INFINITY
    extract_number = ->(str) { str.delete('^0-9.') }

    text_input.each_line.reduce(nil) do |selected_team, row|
      next selected_team if row.size != RECORD_ROW_SIZE

      cols = row.tr_s(' ', ' ').split
      valid_record = ((current_team = cols[1].to_s.strip).length > 0) &&
                     (goals_for = BigDecimal(extract_number[cols[6]]) rescue nil) &&
                     (goals_against = BigDecimal(extract_number[cols[8]]) rescue nil)

      next selected_team unless valid_record

      absolute_goal_difference = (goals_for - goals_against).abs
      if absolute_goal_difference < smallest_goal_difference
        smallest_goal_difference = absolute_goal_difference
        selected_team = current_team
      end

      selected_team
    end
  end
end
