import React, { Component } from 'react'
import styled from 'styled-components'
import Player from 'components/Player'

const Container = styled.div`
  background: #391b6c;
  color: #fff;
  height: 60px;
  display: flex;
  flex-direction: row;
  width: 100%;
  position: relative;
  padding: 0 20px;
`

const Logo = styled.div`
  margin: 8px 0;
  background: #eee;
  height: 40px;
  width: 40px;
  border-radius: 2px;
`

export default class Header extends Component {
  render () {
    return (
      <Container>
        <Logo />
        <Player />
      </Container>
    )
  }
}
