import React, { Component } from 'react'
import { graphql } from "react-apollo";
import { gql } from 'apollo-boost'

const GET_TRACKS = gql`
  query GetTracks {
    tracks {
      id,
      link,
      name,
      provider
    }
  }
`

const TracksList = ({ data: { tracks } }) => {
  return (
    <div>
      {tracks && tracks.map(track => track.name)}
    </div>
  )
}

export default graphql(GET_TRACKS)(TracksList)
