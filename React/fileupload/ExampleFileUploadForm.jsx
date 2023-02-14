import React from "react";
import FileUpload from "./FileUpload";
import { useFormik } from "formik";
import debug from "sabio-debug";
import { Button } from "react-bootstrap";

const _logger = debug.extend("FileUploadForm");

function FileUploadForm() {
  const formik = useFormik({
    initialValues: { files: [] },
    onSubmit: (values) => {
      _logger("form onSubmit", values);
    },
  });

  const fileUploadSuccess = (value) => {
    _logger(value);
    formik.setFieldValue("files", value);
  };

  return (
    <React.Fragment>
      <form onSubmit={formik.handleSubmit}>
        <div className="container">
          <label htmlFor="file m-3">File Upload Example</label>
          <FileUpload fileUploadSuccess={fileUploadSuccess} />
        </div>
        <Button type="submit">Submit</Button>
      </form>
    </React.Fragment>
  );
}

export default FileUploadForm;
