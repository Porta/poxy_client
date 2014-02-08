# poxy_client

[Poxy](http://poxy.ws) is a web application that captures HTTP requests to let you do fun stuff with them.

Fun things like proxying, forwarding, emailing and some sort of processing (soon!).

In order to use it first you'll need to [create an account](http://poxy.ws/register) into the site.


## Installation

### Bundler

Add this line to your application's Gemfile:

    gem 'poxy_client'

And then execute:

    $ bundle

### Manual

    $ gem install poxy_client

## API Blueprint and Documentation

Courtesy of the great service [Apiary.io](http://apiary.io/), here it is:
[http://docs.poxy.apiary.io/](http://docs.poxy.apiary.io/)

## Usage

There are a few different ways to use the client.

The distribution includes an executable file that you can use. It requires a .config file.

Or, you can implement your own client suited to your particular needs. Take a look at the executable file, or check the code documentation.



### Executable

In the /lib folder of the distribution, there's a file named [poxyd.rb](bin/poxyd.rb) which you can run from the commandline.

It requires a mandatory config file (included in the distribution you'll find a sample one, here [poxy.conf](./poxy.conf).

You can use that as a start (it points to a test endpoint in the poxy api).

Optionally, you can pass a -d parameter, and the executable will run as a daemon.

Sample run:
	
	$ ruby poxyd.rb -c poxy.conf -d

Being poxy.conf a config file with your own API and Bucket keys.

### Custom implementation

The code for [PoxyClient](lib/poxy_client.rb) it's pretty straightforward.

The [PoxyClient#perform](lib/poxy_client.rb#perform) perform method encapsulates the 3 important operations the client does.

#### Retrieve

#### Parse

#### Repeat


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
