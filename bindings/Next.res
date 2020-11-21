module Link = {
  @module("next/link") @react.component
  external make: (
    ~href: string=?,
    ~_as: string=?,
    ~prefetch: option<bool>=?,
    ~replace: option<bool>=?,
    ~shallow: option<bool>=?,
    ~passHref: option<bool>=?,
    ~children: React.element,
  ) => React.element = "default"
}

module Head = {
  @module("next/head") @react.component
  external make: (~children: React.element) => React.element = "default"
}

module Image = {
  type layout = [#fixed | #intrisic | #responsive | #fill]

  @module("next/image") @react.component
  external make: (
    ~src: string,
    ~width: int,
    ~height: int,
    ~layout: layout=?,
    ~quality: int=?,
  ) => React.element = "default"
}

module Error = {
  @module("next/head") @react.component
  external make: (~statusCode: int, ~children: React.element) => React.element = "default"
}

module Router = {
  type t<'a> = {
    pathname: string,
    query: Js.t<'a>,
    asPath: string,
  }

  @module("next/router") external use: unit => t<'a> = "useRouter"
}

module GetStaticProps = {
  type context<'props, 'params> = {
    params: 'params,
    query: Js.Dict.t<string>,
    req: Js.Nullable.t<Js.t<'props>>,
  }

  type t<'props, 'params> = context<'props, 'params> => Promise.t<{"props": 'props}>
}

module GetServerProps = {
  type context<'props, 'params> = {
    params: 'params,
    query: string,
    preview: bool,
    previewData: 'props,
    resolvedUrl: string,
  }

  type t<'props, 'params> = context<'props, 'params> => Promise.t<{"props": 'props}>
}

module GetStaticPaths = {
  type path<'params> = {params: 'params}

  type return<'params> = {
    paths: array<path<'params>>,
    fallback: bool,
  }

  type t<'params> = unit => Promise.t<return<'params>>
}
