require_relative '../../app/service/soccer_service'

describe SoccerService do
  # The attached soccer.dat file contains the results from the English Premier League.
  # The columns labeled ‘F’ and ‘A’ contain the total number of goals scored for and against each team in that season
  # (for example, Arsenal scored 79 goals and had 36 goals scored against them).
  # Write a program to print the name of the team with the smallest difference between goals ‘for’ and ‘against’.

  let(:input) { subject.each_line }
  let(:output) { described_class.smallest_absolute_goal_difference(input) }

  describe '#smallest_absolute_goal_difference' do
    subject { SOCCER_BASE_SAMPLE }

    it 'outputs the team with the smallest difference between goals for and against' do
      expect(output).to eq("Aston_Villa")
    end

    context 'in case of draw' do
      subject { SOCCER_DRAW_SAMPLE }

      it 'outputs the better ranked team' do
        expect(output).to eq("Liverpool")
      end
    end

    context 'when the line has an invalid number format' do
      subject { SOCCER_INVALID_NUMBER_SAMPLE }

      it 'skips the line' do
        expect(output).to eq("Tottenham")
      end
    end

    context 'when the file is empty' do
      subject { '' }

      it 'outputs nil' do
        expect(output).to eq(nil)
      end
    end

    context 'when there is no row with the expected format' do
      subject { SOCCER_NO_RECORD_SAMPLE }

      it 'outputs nil' do
        expect(output).to eq(nil)
      end
    end
  end
end

SOCCER_BASE_SAMPLE = '''
<pre>
       Team            P     W    L   D    F      A     Pts
    1. Arsenal         38    26   9   3    79  -  36    87
    2. Liverpool       38    24   8   6    67  -  30    80
    3. Manchester_U    38    24   5   9    87  -  45    77
    4. Newcastle       38    21   8   9    74  -  52    71
    5. Leeds           38    18  12   8    53  -  37    66
    6. Chelsea         38    17  13   8    66  -  38    64
    7. West_Ham        38    15   8  15    48  -  57    53
    8. Aston_Villa     38    12  14  12    46  -  47    50
    9. Tottenham       38    14   8  16    49  -  53    50
   10. Blackburn       38    12  10  16    55  -  51    46
   11. Southampton     38    12   9  17    46  -  54    45
   12. Middlesbrough   38    12   9  17    35  -  47    45
   13. Fulham          38    10  14  14    36  -  44    44
   14. Charlton        38    10  14  14    38  -  49    44
   15. Everton         38    11  10  17    45  -  57    43
   16. Bolton          38     9  13  16    44  -  62    40
   17. Sunderland      38    10  10  18    29  -  51    40
   -------------------------------------------------------
   18. Ipswich         38     9   9  20    41  -  64    36
   19. Derby           38     8   6  24    33  -  63    30
   20. Leicester       38     5  13  20    30  -  64    28
</pre>
'''

SOCCER_DRAW_SAMPLE = '''
<pre>
       Team            P     W    L   D    F      A     Pts
    1. Arsenal         38    26   9   3    79  -  36    87
    2. Liverpool       38    12  14  12    46  -  47    50
    3. Manchester_U    38    24   5   9    87  -  45    77
    4. Newcastle       38    21   8   9    74  -  52    71
    5. Leeds           38    18  12   8    53  -  37    66
    6. Chelsea         38    17  13   8    66  -  38    64
    7. West_Ham        38    15   8  15    48  -  57    53
    8. Aston_Villa     38    12  14  12    46  -  47    50
    9. Tottenham       38    14   8  16    49  -  53    50
   10. Blackburn       38    12  10  16    55  -  51    46
   11. Southampton     38    12   9  17    46  -  54    45
   12. Middlesbrough   38    12   9  17    35  -  47    45
   13. Fulham          38    10  14  14    36  -  44    44
   14. Charlton        38    10  14  14    38  -  49    44
   15. Everton         38    11  10  17    45  -  57    43
   16. Bolton          38     9  13  16    44  -  62    40
   17. Sunderland      38    10  10  18    29  -  51    40
   -------------------------------------------------------
   18. Ipswich         38     9   9  20    41  -  64    36
   19. Derby           38     8   6  24    33  -  63    30
   20. Leicester       38     5  13  20    30  -  64    28
</pre>
'''

SOCCER_INVALID_NUMBER_SAMPLE = '''
<pre>
       Team            P     W    L   D    F      A     Pts
    1. Arsenal         38    26   9   3    NC  -  36    87
    2. Liverpool       38    12  14  12    46  -  NC    50
    3. Manchester_U    38    24   5   9    NC  -  45    77
    4. Newcastle       38    21   8   9    74  -  NC    71
    5. Leeds           38    18  12   8    NC  -  37    66
    6. Chelsea         38    17  13   8    66  -  NC    64
    7. West_Ham        38    15   8  15    NC  -  57    53
    8. Aston_Villa     38    12  14  12    46  -  NC    50
    9. Tottenham       38    14   8  16    49  -  53    50
   10. Blackburn       38    12  10  16    55  -  51    46
   11. Southampton     38    12   9  17    46  -  54    45
   12. Middlesbrough   38    12   9  17    35  -  47    45
   13. Fulham          38    10  14  14    36  -  44    44
   14. Charlton        38    10  14  14    38  -  49    44
   15. Everton         38    11  10  17    45  -  57    43
   16. Bolton          38     9  13  16    44  -  62    40
   17. Sunderland      38    10  10  18    29  -  51    40
   -------------------------------------------------------
   18. Ipswich         38     9   9  20    41  -  64    36
   19. Derby           38     8   6  24    33  -  63    30
   20. Leicester       38     5  13  20    30  -  64    28
</pre>
'''

SOCCER_NO_RECORD_SAMPLE = '''
<pre>
       Team            P     W    L   D    F      A     Pts
   -------------------------------------------------------
</pre>
'''
