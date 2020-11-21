%%raw(`import '../styles/main.scss'`)

type pageComponent = React.component<Js.t<{.}>>
type pageProps = Js.t<{.}>

type props = {"Component": pageComponent, "pageProps": pageProps}

@obj
external makeProps: (
  ~component: pageComponent,
  ~pageProps: pageProps,
  ~key: string=?,
  unit,
) => props = ""

let make = (props: props) => {
  let component = props["Component"]
  let pageProps = props["pageProps"]

  React.createElement(component, pageProps)
}

let default = make
