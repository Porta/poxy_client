# poxy_client

# submodule

Poxy (http://poxy.porta.sh) is a web application that captures web requests and let's you do fun stuff with them.

Fun things like forwarding, emailing and some sort of processing (soon!).

In order to use it, first you'll need to [register](http://poxy.porta.sh/users/sign_up) into the site.


## Installation

### Bundler

Add this line to your application's Gemfile:

    gem 'poxy_client'

And then execute:

    $ bundle

### Manual

    $ gem install poxy_client

## Usage

There are a few different ways to use the client.

The distribution includes a executable file that you can use just providing a .config file.

Or, you can implement your own client suited to your particular needs. Take a look at the executable file, or check the code documentation.


### Executable

In the /lib folder of the distribution, there's a file named {file:bin/poxyd.rb poxyd.rb} which you can run from the commandline.

It requires a mandatory config file (included in the distribution you'll find a sample one, here {file:poxy.conf ./poxy.conf}).

You can use that as a start (it points to a test endpoint in the poxy api).

Optionally, you can pass a -d parameter, and the executable will run as a daemon.

Sample run:
	
	$ ruby poxyd.rb -c poxy.conf -d

Being poxy.conf a config file with your own API and Bucket keys.

### Custom implementation

Though the code for {PoxyClient poxy_client} it's pretty straightforward, in case you want to take a look.

The {PoxyClient.perform perform} method encapsulates the 3 important operations the client performs.

#### Retrieve

#### Parse

#### Repeat


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



















