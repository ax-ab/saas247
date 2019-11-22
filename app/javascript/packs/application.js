import "bootstrap";
import { leftNavInteractivity } from "./leftnav.js";
import { tableStyleOverride } from "./table.js";
import { initCharts } from "../plugins/charts.js";
// import { periodSelect } from "./sub-period-selector.js";

tableStyleOverride();
leftNavInteractivity();
initCharts();
// periodSelect();
