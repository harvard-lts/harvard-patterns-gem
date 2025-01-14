# Harvard Patterns Gem

The **Harvard Patterns Gem** provides built assets from Harvard Library's design system patterns, including fonts and stylesheets. This gem makes it easy to integrate these assets into your Ruby projects, such as Rails applications, without needing to manually manage individual files.

Loosely based on these tutorials:
* [Wrap Your Assets In A Gem](https://medium.com/@paulfarino/wrap-your-assets-in-a-gem-3ad7ecf5b075)
* [Publishing Your Gem](https://guides.rubygems.org/publishing/)


## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Local Development](#local-development)
- [Creating a New Version and Updating in Projects](#creating-a-new-version-and-updating-in-projects)


## Features

- **Fonts**: Includes Harvard Library's custom fonts.
- **Stylesheets**: Provides precompiled stylesheets for quick integration.
- **Bootstrap 5 Customizations**: Incorporates variable names and Harvard Library customizations based on [Bootstrap 5](LINK!).
- **Modular Development**: Link the gem for local development to customize or extend the assets.


## Installation

Add the gem to your project's `Gemfile` with the most up-to-date or appropriate version:

```ruby
gem 'harvard-patterns-gem', git: 'https://github.com/harvard-lts/harvard-patterns-gem', tag '1.1.0'
```

Run `bundle install` to install the gem.


## Usage

### 1. Add the Stylesheets
Include the gem's stylesheets in your project. In Rails, add the following line to your application stylesheet file (`app/assets/stylesheets/application.css` or similar):

```scss
@import "harvard-patterns-gem/stylesheets";
```

This will include all the stylesheets from the Harvard Patterns Gem.

### 2. Add Fonts
Ensure the fonts provided by the gem are being served correctly. Rails will automatically include fonts placed in the asset pipeline.

### 3. Verify Integration
Run your application and check that the styles and fonts are correctly applied.


## Local Development
If you want to modify the gem for local development and test it in another project, follow these steps:

### 1. Clone the Repository
Clone the gem's repository to your local machine:
```zsh
git clone https://github.com/harvard-lts/harvard-patterns-gem ~/dev/harvard-patterns-gem
```

### 2. Link the Gem Locally
In the target project's `Gemfile`, link the gem to your local version:
```ruby
gem 'harvard-patterns-gem', path: '~/dev/harvard-patterns-gem'
```

Run `bundle install` to use the local version of the gem.

### 3. Make Changes
Navigate to the local gem directory and make your changes:

```zsh
cd ~/dev/harvard-patterns-gem
```

Changes will immediately reflect in the project using the local gem after a restart or asset recompile.

[TODO: Doesn't seem to be working when repo is set to `INTERNAL`, needs further testing to see if works when set to `PUBLIC`] 
NOTE: You can also link to a specific Gem branch for further testing and review:
```ruby
gem 'harvard-patterns-gem', git: 'https://github.com/harvard-lts/harvard-patterns-gem', branch: 'LTSARC-#'
```

### 4. Revert to Remote Version
Once you're done with local development, switch back to the remote gem in the Gemfile:

```ruby
gem 'harvard-patterns-gem', git: 'https://github.com/harvard-lts/harvard-patterns-gem', tag: '1.1.0'
```

Run `bundle install` to apply the change.


## Creating a New Version and Updating in Projects

### 1. Bump the Version

Update the version in the gem's `version.rb` file:

```ruby
# lib/harvard-patterns-gem/version.rb
module HarvardPatternsGem
  VERSION = '1.1.0' # Update to the new version
end
```

Commit the version bump:
```zsh
git commit -am "Bump version to 1.1.0"
```

### 2. Tag the Release
Create a new Git tag for the version using your terminal or the GitHub interface:
```zsh
git tag -a 1.1.0 -m "Release version 1.1.0"
git push origin 1.1.0
```

### 3. Update the Gem in Your Projects
In your project’s `Gemfile`, specify the new version tag from the GitHub repository:

```ruby
gem 'harvard-patterns-gem', git: 'https://github.com/harvard-lts/harvard-patterns-gem.git', tag: '1.1.0'
```

Run `bundle install` to use the updated version.

### 4. Verify the Update
Ensure that the project is using the updated version:

```zsh
bundle list | grep harvard-patterns-gem
```

Test the integration in your project to confirm that the new version works as expected.
