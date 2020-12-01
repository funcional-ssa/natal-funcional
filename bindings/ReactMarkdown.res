type codeRendererArgs = {
  language: string,
  value: string,
}

type renderers = {code: codeRendererArgs => React.element}

@module("react-markdown") @react.component
external make: (~children: string, ~renderers: renderers) => React.element = "default"
