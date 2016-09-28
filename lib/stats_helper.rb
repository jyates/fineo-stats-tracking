
require 'descriptive_statistics'

module StatsHelper

  def set_stats(stats, build_number, name, value)
    current = stats[name]
    # no previous stats for that name
    if current.nil?
      current = {}
      stats[name] = current
      current["data"] = {}
    end

    set_stat(current, build_number, value)
  end

  def set_stat(current, build_number, value)
    data = current["data"]
    data[build_number] = value
    calculate_statistics(current)
  end

  def calculate_statistics(current)
    data = current["data"]

    # calculate the statistics
    current["mean"] = data.mean
    current["median"] = data.median
    current["variance"] = data.variance
    current["standard_deviation"] = data.standard_deviation
    current["percentile_50"] = data.percentile(50)
    current["percentile_75"] = data.percentile(75)
    current["percentile_90"] = data.percentile(90)
    current["percentile_95"] = data.percentile(95)
    current["percentile_99"] = data.percentile(99)
    return current
  end
end