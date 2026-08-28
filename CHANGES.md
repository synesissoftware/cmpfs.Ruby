# cmpfs.Ruby - Changes <!-- omit in toc -->


## 0.2.6 - 28th August 2026

* removed unused local variable assignments from text stream comparison;
* parenthesised the regular expression argument in the version test to eliminate an ambiguous regular expression warning under Ruby 3.4 `-W`;
* added the `warnings` branch to CI push triggers and upgraded **actions/checkout** to v7;
* centralised the project URL in **cmpfs-ruby.gemspec** for the homepage and metadata URLs;


## 0.2.5 - 27th August 2026

* renamed **cmpfs.gemspec** to **cmpfs-ruby.gemspec** so the filename stem matches `spec.name`;
* **cmpfs-ruby.gemspec**: `spec.summary` matches the README tagline; packaged **AUTHORS**, **CHANGES**, **CONTRIBUTING**, **EXAMPLES**, **FAQ**, **INSTALL**, **NEWS**, **SECURITY**, and **TODO**; **Gemfile.lock** and **.ruby-version** excluded from `spec.files`;
* stop tracking **Gemfile.lock**; **Gemfile** sets `lockfile false` when Bundler supports it; CI uses `bundler-cache: false` because Bundler 4 then writes no lockfile and **ruby/setup-ruby** cache cats **Gemfile.lock**;
* CI **Warnings** job now runs on Ruby **3.4**; `gem build cmpfs-ruby.gemspec`;
* updated **run_all_unit_tests.sh** (from https://github.com/synesissoftware/misc-dev-scripts) to skip **tput** when **$TERM** is unset or stdout is not a TTY;
* reordered **README.md** (tagline before badges; TOC after badges), added Language / License / Last Commit badges and **Dependencies** (Efferent / Afferent);
* **EXAMPLES.md** example links are repo-relative (`./examples/…`);
* library source **Home:** URLs now use `https`;


## 0.2.4 - 15th August 2026

* added `# frozen_string_literal: true` to all **lib/** sources;
* completed **EXAMPLES.md** catalogue for existing examples;


## 0.2.3 - 4th April 2024

* fixed restrictive Ruby 2.x dependency in gemspec;


## 0.2.2.1 - 4th April 2024

* fixed license to canonical form;


## 0.2.2 - 4th April 2024

* fixed restrictive Ruby 2.x dependency in gemspec;


## 0.2.1.4 - 3rd April 2024

* tidying and documentation;


## 0.2.1.3 - 3rd April 2024

* tidying and documentation;


## 0.2.1.2 - 2nd April 2024

* tidying, documentation, and project boilerplate;


## 0.2.1.1 - 2nd April 2024

* merged **boilerplate** into **master**;


## 0.2.1 - 11th April 2019

* tidyings;


## 0.2.0 - 13th March 2019

* added `Compare.compare_text_files()`, `Compare.compare_text_streams()`, and `Compare.compare_text()`;


## 0.1.0 - 13th March 2019

* sorted modules correctly for including and extending;


## 0.0.1 - 12th March 2019

* added missing `VERSION_REVISION`;


## 0.0.0 - 12th March 2019

* initial version;


<!-- ########################### end of file ########################### -->
