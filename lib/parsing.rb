
require 'json'
require 'optparse'
require 'ostruct'

module Parsing

  def parse(args)
    options = OpenStruct.new(files: [], fail_on_err: false)
    OptionParser.new do |opts|
      opts.banner = "Usage: #{File.basename($0)} [options]"
      opts.separator "Update statistics for a job"

      opts.on("--stats FILE", "Statistics file to update") do |file|
        options.file = file
        options.stats = JSON.parse(File.read(file))
      end

      opts.on("--file STATS_FILE", "File containing statistics. Format: <stat name>.latency. REPEATABLE") do |s|
        options.files << s
      end

      opts.on("--err FILE", "File to store any error informaton") do |f|
        options.err = f
      end

      opts.on("--build BUILD_NUMBER", "The build number from which this value came") do |num|
        options.number = num
      end

      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options.verbose = v
      end

      opts.on("--fail-on-error", "If we should raise an exception if there is an error. If false, just outputs errors to specified error file. Default: #{options.fail_on_err}") do |e|
        options.fail_on_err = true
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end
    end.parse!(args)
    return options
  end
end