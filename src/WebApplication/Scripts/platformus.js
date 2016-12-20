// Copyright © 2015 Dmitry Sikorsky. All rights reserved.
// Licensed under the Apache License, Version 2.0. See License.txt in the project root for license information.

function getCulture() {
  if (location.href.indexOf("/ru/") != -1) {
    return "ru";
  }

  if (location.href.indexOf("/uk/") != -1) {
    return "uk";
  }

  return "en";
}

function highlightCulture() {
  $(".header > .cultures > .culture a[href='/" + getCulture() + "/']").parent().addClass("active");
}

function highlightMenuItem() {
  var url = null;

  if (location.href.indexOf("/" + getCulture() + "/") == -1) {
    url = "/" + getCulture() + "/";
  }

  else {
    url = location.href.substring(location.href.indexOf("/" + getCulture() + "/"));
  }

  $(".header > .menu > .menu-items > .menu-item a[href='" + url + "']").parent().addClass("active");
}