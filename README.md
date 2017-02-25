# nanoc4

[Nanoc 4](https://nanoc.ws/) static website template, packed with features.

## Features

### Static folder

Static folder: `/static` with content that will be blindly copied to the root.

### SASS & CSS

SASS compiler is enabled on `*.scss`. CSS files are simply copied as they are.

Resulting CSS files are minified.

TODO: Ignore partial SASS files (starting with `_`).

### Kramdown

We use [kramdown](https://kramdown.gettalong.org/) markdown compiler, as it is
very cool!

### MD links

Links in MD files can be Markdown links (`*.md`), i.e. can reference other MD file.
On output generation, these links will be changed to `*.html`.

This way your MD files on e.g. github will be linked; but also the generated site
will be linked as well.

### HTML

Generated HTML files are compressed.

### Collections

Collection is an ordered set of items of the same `kind`. For example, it may
be collection of short stories.

Collections are built for every root folder (i.e. only level-1 folders)
which items (i.e. MD files) has frontmatter attribute `date` defined.

Collection name is set by the name of the `kind`, if exist. If missing,
collection name is equal to root folder name.

Since they are ordered, each collection item has prev/next link with
ids of previous and next items.

### Tags

Tags are defined in `tags` attribute that is an array of strings.

Each tag has it's own tags page under `/tags/` folder.

### Blog extension

Default nanoc Blog extension is enabled. Blogs are stored in the `/blogs/`
folder. Each blog entry is in one subfolder. Root page contains the list of
all blogs.

Blogs are ordered by date/time, similar to collections.

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

