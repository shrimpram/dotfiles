require('pears').setup(function(conf)
  conf.expand_on_enter(true)
  conf.preset 'tag_matching'

  conf.pair("<", {
    close = ">",
  })

  conf.pair("{", {
    filetypes = {
      exclude = { 'tex' }
    }
  })

  conf.pair("(", {
    filetypes = {
      exclude = { 'tex' }
    }
  })

  conf.pair("[", {
    filetypes = {
      exclude = { 'tex' }
    }
  })

  conf.pair("$", {
    close = "$",
    filetypes = {
      include = { 'tex' }
    }
  })

  conf.pair("`", {
    close = "'",
    filetypes = {
      include = { 'tex' }
    }
  })

  conf.pair("`", {
    close = "`",
    filetypes = {
      include = { 'markdown', 'asciidoc' }
    }
  })

  conf.pair("_", {
    close = "_",
    filetypes = {
      include = { 'markdown', 'asciidoc' }
    }
  })

end)
