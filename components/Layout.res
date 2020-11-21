@react.component
let make = (~children, ~title=?) => {
  @JSX
  list{
    <Next.Head>
      <title>
        {switch title {
        | Some(t) => t
        | None => "Natal Funcional"
        }->React.string}
      </title>
      <meta name="viewport" content="initial-scale=1.0, width=device-width" />
    </Next.Head>,
    {children},
  }
}
