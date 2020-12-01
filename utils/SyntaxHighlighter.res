type style

@module("react-syntax-highlighter/dist/esm/styles/prism/vs-dark")
external dark: style = "default"

@module("react-syntax-highlighter") @react.component
external make: (~style: style, ~language: string, ~children: string) => React.element = "Prism"
