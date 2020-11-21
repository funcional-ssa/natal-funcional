type t<'properties> = {
  data: 'properties,
  content: string,
  excerpt: string,
  empty: string,
  isEmpty: bool,
}

@module("gray-matter") external parse: string => t<'properties> = "default"
