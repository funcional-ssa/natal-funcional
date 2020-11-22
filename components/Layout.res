@react.component
let make = (~children, ~title=?, ~description=?) => {
  let title = Belt.Option.getWithDefault(title, "Natal Funcional")

  <React.Fragment>
    <Next.Head>
      <title> {React.string(title)} </title>
      <meta name="viewport" content="initial-scale=1.0, width=device-width" />
      <meta property="og:site_name" content="Funcional Salvador" />
      <meta property="og:title" content=title />
      <meta
        property="og:description"
        content={Belt.Option.getWithDefault(
          description,
          j`Olá, nós somos a Funcional Salvador e vamos trazer diversos conteúdos sobre programação funcional para vocês durante o mês de dezembro. Interessado? Cola com a gente no nosso canal do Telegram! ;)`,
        )}
      />
      <meta property="og:image" content="https://natal.fpssa.com.br/logo.png" />
      <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png" />
      <link rel="icon" type_="image/png" sizes="32x32" href="/favicon-32x32.png" />
      <link rel="icon" type_="image/png" sizes="16x16" href="/favicon-16x16.png" />
      <link rel="manifest" href="/site.webmanifest" />
      <link rel="mask-icon" href="/safari-pinned-tab.svg" />
      <meta name="msapplication-TileColor" content="#da532c" />
      <meta name="theme-color" content="#ffffff" />
      <meta name="twitter:card" content="summary" />
      <meta name="twitter:site" content="@fp_ssa" />
      <meta name="twitter:image" content="https://natal.fpssa.com.br/logo.png" />
    </Next.Head>
    {children}
  </React.Fragment>
}
