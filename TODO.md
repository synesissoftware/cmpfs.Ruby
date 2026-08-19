# cmpfs.Ruby - TODO <!-- omit in toc -->


## Functional improvements

* [ ] quiet assigned-but-unused variable warnings in **lib/cmpfs/compare/text/internal_.rb** (`lhs_ix`, `rhs_ix`, `lhs_nr`, `rhs_nr`; Ruby 3.4 `-W` / CI **Warnings** job);
* [ ] quiet the ambiguous `/` regexp warning in **test/unit/tc_version.rb** (Ruby 3.4 `-W` / CI **Warnings** job);


## Performance improvements

* \<none>


## Packaging improvements

* [x] ~~~updated **run_all_unit_tests.sh** (from **misc-dev-scripts**) to skip `tput` when `$TERM` is unset or stdout is not a TTY~~~;
* [x] ~~~**Gemfile** `lockfile false`; stop tracking **Gemfile.lock**; CI `bundler-cache: false`~~~;
* [x] ~~~gemspec polish: README tagline as `spec.summary`, package docs, exclude **Gemfile.lock** / **.ruby-version**; renamed **cmpfs.gemspec** → **cmpfs-ruby.gemspec**~~~;
* [x] ~~~README canonical structure (tagline before badges; **Dependencies**; CI badge → **ruby.yml**)~~~;
* [x] ~~~after the packaging/boilerplate/CI baseline: bump **VERSION** and align **CHANGES**/**NEWS**~~~;


<!-- ########################### end of file ########################### -->
