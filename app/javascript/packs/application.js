import "bootstrap";
import "../plugins/flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { initAutocompleteLocation } from "../plugins/init_autocomplete";
import { initAutocompleteCity } from "../plugins/init_autocomplete";
initAutocompleteLocation();
initAutocompleteCity();
