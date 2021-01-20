#!/usr/bin/env ruby

require './lib/yugis_card_shop'

YugisCardShop::CLI.new.call

#With setting up this file like this, we dont have to add anything more to this. 
#We can now just work on our cli.rb which will be holding all the information, or at least most of it.