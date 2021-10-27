import React from "react"
import ShowTempleDetails from './ShowTempleDetails'
import { BrowserRouter } from 'react-router-dom'

const TempleDisplay = () => {
  return (
    <BrowserRouter>
      <ShowTempleDetails/>
    </BrowserRouter>
  )
}

export default TempleDisplay