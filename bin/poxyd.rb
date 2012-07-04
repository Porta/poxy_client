$:.unshift(*Dir[File.expand_path("../lib", File.dirname(__FILE__))])

# Dependencies

require 'clap'
require 'poxy_client'
require 'json'

@continue = true

trap(:INT) do
  @continue = false
end

trap(0) do
  puts "\nclosing up..."
end

opts = {}
config = {}

args = Clap.run ARGV,
  "-c" => lambda { |file|
    opts[:config_file] = file
  },
  "-d" => lambda {
    opts[:daemonize] = true
  }

$stdout.sync = true


if opts[:daemonize]
  pid_path = File.expand_path("poxy.pid", File.dirname(__FILE__))
  Process.daemon(true)
  File.open(pid_path, File::RDWR|File::EXCL|File::CREAT, 0600) { |io| io.write(Process.pid) }
  at_exit do
    File.delete(pid_path) if File.exists?(pid_path)
  end
end

if opts[:config_file]

  File.read( opts[:config_file] ).scan(/(.*?)="?(.*)"?$/).each do |key, value|
    config[key] ||= value
  end

  PoxyClient.configure do |c|
    c.origin = config["origin"]
    c.api_key = config["api"]
    c.bucket_key = config["bucket"]
    c.destination = config["destination"]
  end

end



#run code here
while @continue do
  #requests = PoxyClient.retriever.get(:all)
  #parsed = PoxyClient.processor.parse(requests)
  #result = PoxyClient.repeater.set(parsed)
  PoxyClient.perform
  sleep config["interval"].to_i
end
