@react.component
let make = (~children, ~title=?, ~description=?) => {
  let title = Belt.Option.getWithDefault(title, "Natal Funcional")

  <>
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
      <meta property="og:image" content="/logo.png" />
    </Next.Head>
    {children}
  </>
}
