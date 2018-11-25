import React from 'react'
import { render } from 'react-dom'
import Root from 'containers/Root'
import { injectGlobal } from 'styled-components'
import ApolloClient from 'apollo-boost'
import { ApolloProvider } from 'react-apollo'

const rootEl = document.getElementById('root')

const apolloClient = new ApolloClient({
  uri: 'http://localhost:4000/api/graphql'
})

const Application = () => (
  <ApolloProvider client={apolloClient}>
    <Root />
  </ApolloProvider>
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