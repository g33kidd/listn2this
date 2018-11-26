import "phoenix_html";
import React from "react";

import { render } from "react-dom";

import Application from "./Application";

// Render the application and inject global styles.
render(<Application />, document.getElementById("app"));
