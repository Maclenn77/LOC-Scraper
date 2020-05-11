# Library of Congress - Scraper of Image Sets

This web scraper was designed for the [Free to Use and Reuse Sets](https://www.loc.gov/free-to-use/),  a webpage from the Library of Congress (LOC).  The scraper takes the name and URL of each set of images and their items.

## Free to Use and Reuse Sets

The web scraper will help anybody that wants to do queries and get URLs from the LOC image sets and their items.

> This page features items from the Library's digital collections that are free to use and reuse. The Library believes that this content is either in the public domain, has no known copyright, or has been cleared by the copyright owner for public use. Each set of content is based on a theme and is first featured on the Library's home page.

Source: Portal '[Free to Use and Reuse Sets](https://www.loc.gov/free-to-use/)'

### Why Free to Use and Reuse Sets

They are public domain images that can be reutilized by everyone. They don't have any tricky JavaScript code for banning scrapers.

### Options

- Start: The program will scrap the webpage and take the name of the sets

![screenshot](/screenshots/start.png)

- Check a set: Review the set's URL and its total images.

![screenshot](/screenshots/check_a_set.png)

- Explore the set: Get the description and URL from an image or all the images

![screenshot](/screenshots/explore_a_set_image.png)
![screenshot](/screenshots/explore_all_images.png)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

- Ruby
- Nokogiri)

Before running this web scraper, check if you have Ruby installed. You can do this with

`$ ruby --version`

If Ruby is not installed, you can install it with [these following instructions](https://www.theodinproject.com/courses/ruby-programming/lessons/installing-ruby-ruby-programming).

You can install Nokogiri With

`$ gem install nokogiri`

### Installing

1. Download this repository. You can download a zip file and extract it or you can write in the command line:

`$ git remote add origin git@github.com:Maclenn77/Scraper.git`

2. Run the logscraper file. You can also create an absolute path with:

`$ sudo ln -s $PWD/logscraper /usr/local/bin/`

If there's any /usr/local/bin directory, you can create it with:

`$ sudo mkdir /usr/local/bin`

## Running the tests

If you want to help in the development of this project, you can run tests with RSpec.

`/Scraper$ rspec`

If RSpec is not installed, you can install it easily with:

`gem install rspec`

### Break down into end to end tests

RSpec check the following cases:

#### Scraper

- #parsing returns a Nokogiri::HTML::Document object
- #imgsets_size returns the number of sets
- #names returns an array
- #names returns an array with names of the sets, like 'Horses'
- #urls_array returns an array
- #urls_array returns an array with urls, like 'https://www.loc.gov/free-to-use/horses/'

#### SetsCreator

- #check_urls returns the url of a set
- #check_urls doesn't return the url of a set if set is 0.
- #check_set_size returns the number of images of a set
- #check_set_size doesn't return a value if set is 0

#### ImgSet

- #display_description returns a string
- #display_description returns description if index given
- #display_description returns 'No image chosen' if index is 0
- #display_url returns a string
- #display_url returns an URL if index given
- #display_url returns 'No image chosen' if index is 0
- #display_url_nd_description returns a string
- #display_url_nd_description returns 'No image chosen' if index is 0
- #display_url_nd_description returns description and URL if index is given
- #all_items returns a string
- #all_items doesn't return 'No image chosen'
- #all_items returns description and URL

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - A programming language.
* [Nokogiri](https://nokogiri.org/) - An HTML, XML, SAX, and Reader parser.
* [OpenURI](https://ruby-doc.org/stdlib-2.6.3/libdoc/open-uri/rdoc/OpenURI.html) - A wrapper for Net::HTTP, Net::HTTPS and Net::FTP.
* [RSpec](https://rspec.info/) - Behaviour Driven Development for Ruby.

## Contributing

Contribute to this project with:

- Code reviews
- Open new issues
- Suggest new features
- Debugging
- Share this project
- If you want to collaborate with coding, contact the author for getting permission to this repository.

## Author

👤 **Juan Paulo Perez Tejada**

- Github: [@Maclenn77](https://github.com/Maclenn77)
- Twitter: [@srjuanpapas](https://twitter.com/srjuanpapas)
- Linkedin: [Juan Paulo Perez Tejada](https://mx.linkedin.com/in/juanpaulopereztejada)

Visit [my blog](https://developerz.software/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
