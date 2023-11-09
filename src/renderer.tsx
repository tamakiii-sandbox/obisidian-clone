import * as React from 'react'
import * as ReactDOM from 'react-dom/client'

((async() => {
  const response = await window.versions.ping()
  console.log(response)
})());

document.addEventListener('DOMContentLoaded', () => {
  const element = <h1>Hello, world</h1>;

  const root = ReactDOM.createRoot(
    document.getElementById('root')
  )
  root.render(element)
})
