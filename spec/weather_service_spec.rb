require_relative "../app/weather_service"

BASE_SAMPLE = """
<pre>
 MMU June 2002

  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8
  mo  82.9  81.5  71.7    16  58.8       0.00              6.9          5.3
</pre>
"""

DRAW_SAMPLE = """
<pre>
 MMU June 2002

  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
   3  77    55    66          39.6       0.00         350  5.0 350   9  2.8  59 24 1016.8
   4  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5
  mo  82.9  81.5  71.7    16  58.8       0.00              6.9          5.3
</pre>
"""


describe WeatherService do
  # In the attached file (w_data.dat), you’ll find daily weather data.
  # Download this text file, then write a program to output
  # the day number (column one) with the smallest temperature spread
  # (the maximum temperature is the second column, the minimum is the third column).

  describe '#smallest_temperature_spread' do
    it "outputs the day number with the smallest temperature spread" do
      output = WeatherService.smallest_temperature_spread(BASE_SAMPLE)
      expect(output).to eq(2)
    end

    context "in case of draw" do
      it "outputs the greatest day number" do
        output = WeatherService.smallest_temperature_spread(DRAW_SAMPLE)
        expect(output).to eq(4)
      end
    end

    context "when the file is empty" do
      it "outputs nil" do
        output = WeatherService.smallest_temperature_spread("")
        expect(output).to eq(nil)
      end
    end
  end
end
