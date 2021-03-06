# Marvel Rails

Marvel Rails is a ruby on rails implementation of a comic book browser from Marvel, with functionalities such as Basic Auth, favorites and search.

## Requirements

* Ruby version: 3.1.2
* Rails version: 7.0.3
* Database: PostgreSQL 14.4

## Usage

First, install all the necessary gems with bundle

```bash
bundle install
```

Second, save the Marvel API keys in your ENV

```bash
export MARVEL_PRIVATE_KEY=<your_private_key>
export MARVEL_PUBLIC_KEY=<your_public_key>
```

Update your console either by reopening it or by running
If on macOS Catalina or newer:
```bash
source ~/.zshrc
```
If on Windows, Linux or older versions of macOS:
```bash
source ~/.bashrc
```

To run the application first run the following command, after installing ruby and rails gem

```bash
rails db:create db:migrate db:seed
```

To then run the application use the following command
```bash
rails s
```

## How to run the test suite

To test the application, use the command:
```bash
rails test
```

To test individual modules, use
```bash
rails test:models
```
```bash
rails test:controllers
```

To test individual files, use (for example)
```bash
rails test test/models/comic_test.rb
```

## Extra
To make the pagination of the application I used the gem Pagy, which according to them is the fastest one, compared to the most used ones (Ransack/WillPaginate).

Also this gem is very simple to use and very versatile. 

To learn more about the gem, visit their git: [Pagy Git](https://github.com/ddnexus/pagy)

## License
[MIT](https://choosealicense.com/licenses/mit/)
