import React, { Component } from 'react'
import styled from 'styled-components'
import ReactPlayer from 'react-player'

import { gql } from 'apollo-boost'
import { Query } from 'react-apollo'

import Header from 'components/Header'
import TracksList from 'components/Test'

const PlayerContainer = styled.div`display: none;`
const Container = styled.div`display: block;`

export default class Root extends Component {

  state = {
    player: {
      volume: 0.8,
      muted: true,
      playing: false,
      url: "",
      duration: 0,
      progress: {
        played: 0,
        loaded: 0
      }
    }
  }

  render () {
    const { player } = this.state
    const { url, volume, muted, playing, duration, progress } = this.state.player

    return (
      <Container>
        <Header playerState={player} changeUrl={this.changeUrl} seek={this.onSeek} />

        <PlayerContainer>
          <ReactPlayer
            ref={(player) => this.player = player}
            url={url}
            playing={playing}
            volume={volume}
            muted={muted}
            progressInterval={100}
            onDuration={this.onDuration}
            onProgress={this.onProgress} />
        </PlayerContainer>

        <TracksList />
      </Container>
    )
  }

  changeUrl = (url) => this.setState({ player: { url, ...this.state.player } })
  onSeek = (newTime) => { this.player.seekTo(newTime) }
}
