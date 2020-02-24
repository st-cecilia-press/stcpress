/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
require('jquery-ui/themes/base/core.css');
require('jquery-ui/themes/base/menu.css');
require('jquery-ui/themes/base/autocomplete.css');
require('jquery-ui/themes/base/theme.css');
import "jquery-ui/ui/widgets/autocomplete";
import 'styles/application.scss'

import Rails from 'rails-ujs';
Rails.start();

import 'bootstrap'
import 'modules/datatable'
import 'modules/simplemde'
import 'modules/list'
import 'modules/copy'
import 'modules/cpdl'
import 'modules/video'
import 'modules/autocomplete/home-search'
import 'modules/autocomplete/dance-search'
import 'modules/autocomplete/pieces-search'
import 'modules/autocomplete/simple'
import 'modules/datesort/main'

import { library, dom } from "@fortawesome/fontawesome-svg-core";
import {fas} from '@fortawesome/free-solid-svg-icons';
import {faFilePdf} from '@fortawesome/free-regular-svg-icons/faFilePdf';
library.add(fas)
library.add(faFilePdf)
dom.watch();
