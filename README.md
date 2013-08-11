# Asphalt

Asphalt paves the way for your (Sass) stylesheets!


## Introduction

The cruft of Asphalt comes from [this post on The Sass Way blog](http://www.thesassway.com/beginner/how-to-structure-a-sass-project). I wanted to try out structuring and breaking up my Sass files, but it took too much time to create all the directories and files just to get started. I created Asphalt to cut down on the time by generating the files to get started.

Feel free to read the blog post and try Asphalt out!


## Installation

Install it from RubyGems:

    $ gem install asphalt

or clone and install from this repo

    $ git clone https://github.com/donokuda/asphalt.git
    $ cd asphalt
    $ rake install


## Usage

In the directory of your stylesheets:

    $ asphalt init

This will generate a folder structure of partialized Scss files.

If you prefer the indented sass syntax, you can run

    $ asphalt init --sass

That's it! Run `sass -w main.scss` to compile your sass files!


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
