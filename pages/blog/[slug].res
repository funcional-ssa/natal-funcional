open Next

type params = {slug: string}

type postData = {
  title: string,
  author: string,
  translatedBy: string,
  date: string,
}

type props = {
  data: postData,
  content: string,
  slug: string,
}

let default = (props: props) => {
  let {data, content} = props

  <Layout>
    <div>
      <h1> {data.title->React.string} </h1>
      <p> {React.string("escrito por " ++ data.author)} </p>
      <p> {React.string("traduzido por " ++ data.translatedBy)} </p>
    </div>
    <ReactMarkdown source=content />
  </Layout>
}

let getStaticProps: GetStaticProps.t<props, params> = ctx => {
  let {slug} = ctx.params

  let contentPromise = %raw(`import('../../posts/' + slug + '.md')`)

  contentPromise
  ->Promise.map(content => GrayMatter.parse(content["default"]))
  ->Promise.map(body => {
    let props = {data: body.data, content: body.content, slug: slug}

    {"props": props}
  })
}

let getStaticPaths: GetStaticPaths.t<params> = () => {
  open GetStaticPaths
  open Webpack

  let paths =
    Require.make("../../posts", ~useSubdirectories=true, ~regExp=%re("/\\.md$/"))
    ->Require.keys
    ->Belt.Array.map(path => {
      let slug = Slug.get(path)

      {
        params: {
          slug: slug,
        },
      }
    })

  let response = {paths: paths, fallback: false}

  Promise.resolved(response)
}
