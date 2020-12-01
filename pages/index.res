type params = unit

type postData = {title: string, published: bool}

type props = {posts: array<string>}

let default = (props: props) => {
  <Layout>
    <main>
      <Next.Image src="/logo.svg" quality={100} height={340} width={340} />
      <h1> {React.string("Natal Funcional")} </h1>
      <a href="/about"> {j`Sobre nós`->React.string} </a>
      {switch props.posts {
      | [] => <h2> {React.string("Em breve...")} </h2>
      | posts => <ol className="article-list"> {posts->Belt.Array.mapWithIndex((index, title) => {
            <Next.Link href={"/blog/" ++ string_of_int(index + 1)} key=title>
              <a>
                <li>
                  <article>
                    <h2 className="article-list__item"> {React.string(title)} </h2>
                  </article>
                </li>
              </a>
            </Next.Link>
          })->React.array} </ol>
      }}
    </main>
  </Layout>
}

let getStaticProps: Next.GetStaticProps.t<props, params> = _ => {
  open Webpack

  let context = Require.make("../", ~useSubdirectories=true, ~regExp=%re("/\\/posts\\/.*\\.md/"))

  let titles = Require.keys(context)->Require.map(context)->Belt.Array.keepMap(file => {
    let content = file["default"]
    let {data}: GrayMatter.t<postData> = GrayMatter.parse(content)
    if data.published {
      Some(data.title)
    } else {
      None
    }
  })

  let props = {posts: titles}

  Promise.resolved({
    "props": props,
  })
}
