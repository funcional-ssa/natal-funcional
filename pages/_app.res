%%raw(`import '../styles/main.scss'`)

type pageComponent = React.component<Js.t<{.}>>
type pageProps = Js.t<{.}>

type props = {
  @as("Component")
  component: pageComponent,
  pageProps: pageProps,
}

let make = (props: props) => {
  let component = props.component
  let pageProps = props.pageProps

  React.createElement(component, pageProps)
}

let default = make
