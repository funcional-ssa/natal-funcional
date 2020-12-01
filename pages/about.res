@react.component
let make = () => {
  let text = j`A Funcional Salvador é um grupo de estudos de Salvador, Bahia, tudo intuito é trazer conhecimento
sobre o paradigma funcional de programação para as pessoas de forma acessível e agradável.
Neste Natal, estamos traduzindo os posts feitos pela Bekk no Functional Christmas de 2019 para português, com o objetivo de 
torná-lo mais acessível.`

  <React.Fragment>
    <Navbar />
    <main className="article">
      <h1> {j`Sobre nós`->React.string} </h1>
      <p className="article__content article__content--justified"> {React.string(text)} </p>
    </main>
  </React.Fragment>
}

let default = make
