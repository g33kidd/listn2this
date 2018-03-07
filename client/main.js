import React from 'react'
import { render } from 'react-dom'
import Root from 'containers/Root'
import { injectGlobal } from 'styled-components'

const rootEl = document.getElementById('root')

const Application = () => (
  <Root />
)

render(<Application />, rootEl)

injectGlobal`
  * {
    box-sizing: border-box;
  }

  html, body {
    margin: 0;
    padding: 0;
  }
`
