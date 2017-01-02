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

## Frontmatter

### `kind`

Defines name of the collection. If not specified, kind will is equal to first directory name.
Root items does not have implicit kind. Kind can be specified in `Rules`, too.

### `date` and `created_at`

Defines article timestamp. If not specified, files timestamp will be used.
Both metadata are identical.

### `updated_at`

Optional timestamp of last update.

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

