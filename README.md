# NewRelic Unicorn Plugin

![Logo](docs/images/unicorn.png)

Report Unicorn idle worker ratio & memory usage to NewRelic.

## Install

1. Download the latest tagged version from `https://github.com/DianthuDia/newrelic_unicorn_plugin/tags`
2. Extract to the location you want to run the unicorn agent from
3. Copy `config/template_newrelic_plugin.yml` to `config/newrelic_plugin.yml`
4. Edit `config/newrelic_plugin.yml` and replace "YOUR_LICENSE_KEY_HERE"
5. run `bundle install`
6. run `bin/newrelic_unicorn_agent`

## Requirements

Ruby 2.0 or greater.

## Credits
- [Shinji Furuya](https://github.com/dfuruya), creator of [Unicon Munin Plugin](https://github.com/munin-monitoring/contrib/tree/master/plugins/unicorn)
- Logo by [Dcj1018 – Unicorn Condom Logo](https://commons.wikimedia.org/wiki/File:Unicorn_Condom_Logo.png) / Adapted

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
