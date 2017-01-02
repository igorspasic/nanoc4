# nanoc4

[Nanoc 4](https://nanoc.ws/) static website template.

## Features

+ static folder for static content
+ SASS compiler
+ CSS minifier
+ [kramdown](https://kramdown.gettalong.org/) markdown compiler
+ converter of *.md links to *.html
+ html compressor
+ Collections: ordered set of items of the same kind, prev/next
+ Tags
+ Blog extension

## TODO

+ Tag pages (for each tag)

## Frontmatter

### `kind`

Defines name of the collection. If not specified, kind will is equal to first directory name.
Root items does not have implicit kind. Kind can be specified in `Rules`, too.

## Development

### Gems

	bundle install
	bundle update

### Compile

    bundle exec nanoc compile

### Guard

	bundle exec guard

### View

    bundle exec nanoc view

