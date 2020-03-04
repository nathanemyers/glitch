import React, {useCallback} from 'react'
import PropTypes from 'prop-types'
import {useDropzone} from 'react-dropzone'

const propTypes = {
  onUpload: PropTypes.func.isRequired,
}

export default function DropUpload(props) {
  const { onUpload } = props

  const onDrop = useCallback(acceptedFiles => {
    const file = acceptedFiles[0]

    console.log(file)
    onUpload(file)
  }, [onUpload])

  const {getRootProps, getInputProps, isDragActive} = useDropzone({onDrop})

  return (
    <div {...getRootProps()}>
      <input {...getInputProps()} />
      {
        isDragActive ?
          <p>Drop the files here ...</p> :
          <p>Drag 'n' drop some files here, or click to select files</p>
      }
    </div>
  )
}

DropUpload.propTypes = propTypes
