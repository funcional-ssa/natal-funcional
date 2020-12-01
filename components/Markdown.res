open ReactMarkdown

let renderers = {
  code: ({language, value}) =>
    <SyntaxHighlighter style=SyntaxHighlighter.dark language> value </SyntaxHighlighter>,
}

@react.component
let make = (~children) => {
  <ReactMarkdown renderers> children </ReactMarkdown>
}
