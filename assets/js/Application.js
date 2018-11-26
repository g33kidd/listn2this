import React, { Component } from "react";

const Root = () => <h1>I Am Root.</h1>;

class Application extends Component {
  render() {
    return (
      <ApolloProvider>
        <Root />
      </ApolloProvider>
    );
  }
}
