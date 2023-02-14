import React, { useState, useEffect } from "react";
import PropTypes from "prop-types";
import { useDropzone } from "react-dropzone";
import { Image } from "react-bootstrap";
import "./fileupload.css";
import debug from "sabio-debug";
import * as fileService from "../../services/fileService";
import pricingService from "services/pricingService";
import toastr from "toastr";

const _logger = debug.extend("FileUpload");

function FileUpload(props) {
  const [files, setFiles] = useState([]);
  const { getRootProps, getInputProps } = useDropzone({
    onDrop: acceptedFiles => {
      setFiles(
        acceptedFiles.map(file =>
          Object.assign(file, {
            preview: URL.createObjectURL(file),
          })
        )
      );
      if (props.isPricingImport) {
        pricingService
          .pricingImport(acceptedFiles)
          .then(onSuccess)
          .catch(onError);
      } else {
        fileService.addFiles(acceptedFiles).then(onSuccess).catch(onError);
      }

      _logger("onDrop", acceptedFiles);
    },
  });

  const onSuccess = response => {
    _logger("success", response.items);
    toastr.success("Upload success!");
    if (!props.isPricingImport) {
      props.fileUploadSuccess(response.items);
    }
  };

  const onError = error => {
    _logger("error", error);
    toastr.error("Upload error");
  };

  const thumbs = files.map(file => (
    <div className="thumb-upload" key={file.name}>
      <div className="thumbInner-upload">
        <Image
          src={file.preview}
          className="img-upload mt-2"
          width="100px"
          alt={file.name}
        />
      </div>
    </div>
  ));

  useEffect(
    () => () => {
      files.forEach(file => URL.revokeObjectURL(file.preview));
    },
    [files]
  );

  return (
    <React.Fragment>
      <section className="container-upload">
        <div {...getRootProps({ className: "dropzone" })}>
          <input {...getInputProps()} />
          <p>Drag & drop some files here, or click to select files</p>
        </div>
        <aside className="thumbsContainer-upload">{thumbs}</aside>
      </section>
    </React.Fragment>
  );
}

export default FileUpload;

FileUpload.propTypes = {
  fileUploadSuccess: PropTypes.func,
  isPricingImport: PropTypes.bool,
};
