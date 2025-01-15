# Harvard Patterns Gem

The **Harvard Patterns Gem** provides built assets from Harvard Library's design system patterns, including fonts and stylesheets, and customizations for a Bootstrap 5 application. This gem makes it easy to integrate these assets into your Ruby projects, such as Rails applications, without needing to manually manage individual files.

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
- **Bootstrap 5 Customizations**: Incorporates variable names and Harvard Library customizations based on [Bootstrap 5](https://getbootstrap.com/).
- **Modular Development**: Link the gem for local development to customize or extend the assets.


## Installation

Add the gem to your project's `Gemfile` with the most up-to-date or appropriate version:

```ruby
gem 'harvard-patterns-gem', git: 'https://github.com/harvard-lts/harvard-patterns-gem', tag '1.1.0'
```

Run `bundle install` to install the gem.

Check your `Gemfile.lock` to confirm the gem has been added.


## Usage

### 1. Add the Stylesheets and Fonts
Include the gem's stylesheets in your project. In Rails, add the following line to your application stylesheet file (`app/assets/stylesheets/application.css` or similar):

```scss
@import "harvard-patterns";
```

This will include all the stylesheets from the Harvard Patterns Gem.

Ensure the fonts provided by the gem are being served correctly. Rails will automatically include fonts placed in the asset pipeline.

### 2. Verify Integration
Run your application and check that the styles and fonts are correctly applied.


## Local Development
If you want to modify the gem for local development and test it in another project, follow these steps:

### 1. Make Changes in a New Branch
Create a new branch and add your changes there. Commit changes.

### 2. Link the Gem
In the target project's `Gemfile`, link the gem to your branch name:
```ruby
gem "harvard-patterns-gem", git: "https://github.com/harvard-lts/harvard-patterns-gem", branch: "BRANCH-NAME"
```

Run `bundle install` to use this version of the gem.

Check your `Gemfile.lock` to confirm the change has been made. You should see the branch name.

Changes will immediately reflect in the project using this version of the gem after a restart or asset recompile.

### 3. Iterate on Changes (optional)
I recommend the following steps after every new commit you want to test to ensure you are testing the newest changes. 

In the gem:
* Make and commit additional changes.
* Update the version of your gem in `version.rb` (can be anything, just different from the previous version). This helps to visually recognize that you are using the most up-to-date code in your branch.

In the target project:
* Remove your `Gemfile.lock`.
* Reinstall with `bundle install` and confirm the new `Gemfile.lock` includes the version you just created.
* Restart the gem to view your changes.

### 4. Revert to Remote Version
Once you're done with local development and testing, switch back to the remote gem in the Gemfile:

```ruby
gem 'harvard-patterns-gem', git: 'https://github.com/harvard-lts/harvard-patterns-gem', tag: '1.1.0'
```

Run `bundle install` to apply the change.

Check your `Gemfile.lock` to confirm the change has been made. You should see a tag number instead of a branch name.


## Creating a New Version and Updating in Projects

### 1. Bump the Version

Update the version in the gem's `version.rb` file. Best practice is to have this align with your Git tag.

```ruby
# lib/harvard-patterns-gem/version.rb
module HarvardPatternsGem
  VERSION = '1.1.0' # Update to the new version
end
```

Commit the version bump using your terminal or the GitHub interface:
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
