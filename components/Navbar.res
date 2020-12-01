@react.component
let make = () => {
  <nav className="navbar">
    <Next.Link href="/">
      <a> <Next.Image src="/navbar-logo.svg" quality={100} height={96} width={328} /> </a>
    </Next.Link>
    <div className="navbar__links">
      <Next.Link href="/about">
        <a className="navbar__link"> {React.string(j`Sobre nós`)} </a>
      </Next.Link>
      <a className="navbar__link" href="https://functional.christmas/2019">
        {React.string("Visite o blog original")}
      </a>
      <a className="navbar__link" href="https://functional.christmas/2020">
        {React.string(j`...ou sua versão de 2020`)}
      </a>
    </div>
  </nav>
}
