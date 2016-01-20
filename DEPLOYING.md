## Deploying

1. Update `lib/ph_utility/version.rb`
2. Commit the changed files with the version number eg: `1.8.0`
3. Push this to git
4. Run `rake release`
5. Run `rake changelog` (has to be ran after release since its based on github tagging)
6. Commit the changed changelog named something like `changelog for 1.8.0`
7. Push this to git
