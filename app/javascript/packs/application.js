import "bootstrap";
import { leftNavInteractivity } from "./leftnav.js";
import { tableStyleOverride } from "./table.js";
import { initCharts } from "../plugins/charts.js";

tableStyleOverride();
leftNavInteractivity();
initCharts();
