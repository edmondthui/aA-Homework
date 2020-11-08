import React from 'react'

function GiphysIndexItem({giphy}) {
    return (
        <li><img src={giphy.images.fixed_height.url}/></li>
    )
}

export default GiphysIndexItem