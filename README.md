# GitHub Web Presentation

A simple template for creating presentations on the web hosted by GitHub. You can also serve it locally if you don't want to upload your presentation online.

## Getting started

Fork the repo and edit `_config.yml` and then activate [GitHub Pages](https://help.github.com/articles/configuring-a-publishing-source-for-github-pages/) in the repo settings on the `master` branch.

This project depends on Ruby and github-pages gem.

### **1. Installing Ruby and dependencies:**

For Windows (using Chocolatey package manager):

```bash
$ choco install ruby
...
```

For macOS (using Homebrew package manager):

```bash
$ brew install ruby
...
```

For Ubuntu (using apt):

```bash
$ sudo apt-get install ruby-full
...
```

After installing please verify the version by running:

```bash
$ ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x64-mingw32]
```

Life should be great right now, install the project dependencies
```
$ gem install github-pages
...
```

### **2. Running the project**

Clone the forked repository to your computer

```bash
$ git clone https://github.com/username/gh-presentation.git
$ cd gh-presentation
$ jekyll serve
...
```

The site should now be served on http://localhost:4000 and it should be listening for changes in your markup.

## **3. Creating content**

To create new slides you will have to use [GitHub Markdown](https://guides.github.com/features/mastering-markdown/).

All the slides are located under the `_posts` folder. To see an overview of all the slides you can use `esc` on your keyboard to get an idea of how the numbers (e.g. `1000-01-01-intro.md`) work on each slide.

## **Upcoming features:**

* Exporting to PDF
* WebSockets for broadcasting the presentation to multiple users
