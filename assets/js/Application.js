import React, { Component } from "react";
import { ApolloProvider } from "react-apollo";
import GlobalStyle from "./display/global";
import createApolloClient from "./fn/createApolloClient";

const Root = () => <h1>I Am Root.</h1>;
const client = createApolloClient();

class Application extends Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <>
          <Root />
          <GlobalStyle />
        </>
      </ApolloProvider>
    );
  }
}

export default Application;
