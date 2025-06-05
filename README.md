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

### 1. Adding Stylesheets and Fonts
Include the gem's stylesheets in your project. In your Rails app, add the following line to your application stylesheet file (`app/assets/stylesheets/application.css` or similar):

```scss
@import "harvard-patterns";
```

This will include all the stylesheets from the Harvard Patterns Gem. If you only want a subset, you can also import them individually.

Ensure the fonts provided by the gem are being served correctly. Rails will automatically include fonts placed in the asset pipeline.

### 2. Referencing Images

Images should be referenced using standard Rails asset helpers:

In ERB Views:

```zsh
<%= image_tag "logo.png" %>
```

In SCSS/CSS:

```scss
.your-component {
  background: image-url("logo.png");
}
```

In JavaScript:

```js
const logoPath = asset_path("logo.png");
```

Note: Images may also need to be declared in your `manifest.js` file:
```js
//= link your-image-name.png
//= link your-image-game.svg
```

## Local Development
If you want to modify the gem for local development and test it in another project, follow these steps:

### 1. Build Gem Locally in New Branch
Create a new branch and build the gem locally:

```zsh
gem build harvard-patterns-gem.gemspec
```

### 2. Unpack Gem in Target Project
Navigate to the target project and unpack the gem:

```zsh
cd /path/to/target-project
gem unpack /path/to/harvard-patterns-gem-0.1.0.gem
```

Note: Numbers at the end should match the gem's version number.

### 3. Import Stylesheets from Local Gem
In your target project, update the stylesheet file (`app/assets/stylesheets/application.css` or similar) to point to the unpacked stylesheets.

Instead of:

```scss
@import 'harvard-patterns';
```

Use a relative path that points to the unpacked stylesheets (adjust path as needed):

```scss
@import '../harvard-patterns-gem-0.1.0/vendor/assets/stylesheets/harvard-patterns.scss';
```

### 4. Make SCSS Changes in Target Project (Temporary)
Edit the unpacked SCSS files directly inside your target project to test styling changes live in the UI.

### 5. Preview and Sync Changes
Preview changes between the unpacked gem in your target project and original gem:

View line-by-line differences in the terminal (similar to git diff)
```zsh
diff -ruN \
  /path/to/target-project/harvard-patterns-gem-0.1.0/vendor/assets/stylesheets/ \
  /path/to/harvard-patterns-gem/vendor/assets/stylesheets/
```

or use a GUI tool to get a side-by-side comparison of all file differences
```zsh
meld /path/to/target-project/harvard-patterns-gem-0.1.0/vendor/assets/stylesheets/ /path/to/harvard-patterns-gem/vendor/assets/stylesheets/
```

If happy with preview, sync changes:
```zsh
# From target project
cp -R /path/to/harvard-patterns-gem-0.1.0/vendor/assets/stylesheets/* /path/to/harvard-patterns-gem/vendor/assets/stylesheets/
```

### 6. Commit Changes and Test New Branch

#### In `harvard-patterns-gem`
* Remove the built gemspec (`harvard-patterns-gem-0.1.0.gemspec`).
* View synced changes to confirm they're what you want.
* Commit changes into your new branch.

#### In Target Project
Remove all local references to harvard-patterns-gem-0.1.0:
* Delete unpacked gem (`harvard-patterns-gem-0.1.0`)
* Change your stylesheet import back to `@import 'harvard-patterns'`

In the `Gemfile`, link the gem to your branch name:
```ruby
gem "harvard-patterns-gem", git: "https://github.com/harvard-lts/harvard-patterns-gem", branch: "BRANCH-NAME"
```

Run `bundle install` to use this version of the gem.

Check your `Gemfile.lock` to confirm the change has been made. You should see the branch name.

Changes will immediately reflect in the project using this version of the gem after a restart or asset recompile.

### 7. Revert to Remote Version
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
# lib/harvard/patterns/gem/version.rb
module HarvardPatternsGem
  VERSION = '1.1.0' # Update to the new version
end
```

Run `bundle install` to apply the change.

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
