#!/usr/bin/env bash
bundle check || bundle install --jobs=8 --retry=3
bundle exec rake
