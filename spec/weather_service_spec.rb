require_relative '../app/service/weather_service'

describe WeatherService do
  # In the attached file (w_data.dat), you’ll find daily weather data.
  # Download this text file, then write a program to output
  # the day number (column one) with the smallest temperature spread
  # (the maximum temperature is the second column, the minimum is the third column).

  let(:input) { subject.each_line }
  let(:output) { described_class.smallest_temperature_spread_day(input) }

  describe '#smallest_temperature_spread_day' do
    subject { WEATHER_BASE_SAMPLE }

    it 'outputs the day number with the smallest temperature spread' do
      expect(output).to eq(12)
    end

    context 'in case of draw' do
      subject { WEATHER_DRAW_SAMPLE }

      it 'outputs the greatest day number' do
        expect(output).to eq(3)
      end
    end

    context 'when the line has an invalid number format' do
      subject { WEATHER_INVALID_NUMBER_SAMPLE }

      it 'skips the line' do
        expect(output).to eq(1)
      end
    end

    context 'when the file is empty' do
      subject { '' }

      it 'outputs nil' do
        expect(output).to eq(nil)
      end
    end

    context 'when there is no row with the expected format' do
      subject { WEATHER_NO_RECORD_SAMPLE }

      it 'outputs nil' do
        expect(output).to eq(nil)
      end
    end
  end
end

WEATHER_BASE_SAMPLE = '''
<pre>
 MMU June 2002

  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8
   4  77    59    68          51.1       0.00         110  9.1 130  12  8.6  62 40 1021.1
   5  90    66    78          68.3       0.00 TFH     220  8.3 260  12  6.9  84 55 1014.4
   6  81    61    71          63.7       0.00 RFH     030  6.2 030  13  9.7  93 60 1012.7
   7  73    57    65          53.0       0.00 RF      050  9.5 050  17  5.3  90 48 1021.8
   8  75    54    65          50.0       0.00 FH      160  4.2 150  10  2.6  93 41 1026.3
   9  86    32*   59       6  61.5       0.00         240  7.6 220  12  6.0  78 46 1018.6
  10  84    64    74          57.5       0.00 F       210  6.6 050   9  3.4  84 40 1019.0
  11  91    59    75          66.3       0.00 H       250  7.1 230  12  2.5  93 45 1012.6
  12  88    73    81          68.7       0.00 RTH     250  8.1 270  21  7.9  94 51 1007.0
  mo  82.9  81.5  71.7    16  58.8       0.00              6.9          5.3
</pre>
'''

WEATHER_DRAW_SAMPLE = '''
<pre>
 MMU June 2002

  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
   3  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
   4  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8
  mo  82.9  81.5  71.7    16  58.8       0.00              6.9          5.3
</pre>
'''

WEATHER_INVALID_NUMBER_SAMPLE = '''
<pre>
 MMU June 2002

  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
   A  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
   3  BC    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8
   4  79    DE    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
  mo  82.9  81.5  71.7    16  58.8       0.00              6.9          5.3
</pre>
'''

WEATHER_NO_RECORD_SAMPLE = '''
<pre>
 MMU June 2002

  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

  mo  82.9  81.5  71.7    16  58.8       0.00              6.9          5.3
</pre>
'''
