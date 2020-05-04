<%@page import="com.notice.model.dao.NoticeDao"%>
<%@page import="com.notice.model.vo.Notice"%>
<%@page import="com.notice.model.service.NoticeService"%>
<%@page import="com.board.model.vo.Board"%>
<%@page import="com.member.model.vo.Attachment"%>
<%@page import="com.member.service.MemberService"%>
<%@page import="com.foodlist.service.FoodListService"%>
<%@page import="com.foodlist.model.vo.FoodList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  Member m = (Member)session.getAttribute("member");
	  
  	  FoodListService fs = new FoodListService();
	  NoticeService ns = new NoticeService();
	  
	  ArrayList<Notice> nlist = ns.selectList(1, 11);
  	  ArrayList<FoodList> flist = fs.fooddayList();
	  
	  Attachment at = (Attachment)session.getAttribute("at");
	  
	%>
<!doctype html>

<html lang="en">
  <head>
    
    <meta charset="utf-8">
    
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>메인 페이지</title>
    


    <!-- 게시판 부트스트랩 cnd-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <!-- 게시판 부트스트랩 cnd-->
    <!--제이쿼리 cnd-->
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!--제이쿼리 cnd-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

  
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.deep_purple-pink.min.css">
    <link rel="stylesheet" href="./css/mainstyles.css">
<!--캘린더 css-->
<style>
      @import url('https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i');
      td.fc-day {

      background:#FFF !important;
      font-family: 'Roboto', sans-serif;

      }
      td.fc-today {
        background:#FFF !important;
        position: relative;


      }

    .fc-first th{
      font-family: 'Roboto', sans-serif;
        background:#9675ce !important;
      color:#FFF;
      font-size:14px !important;
      font-weight:500 !important;

      }
.fc-event-inner {
	font-family: 'Roboto', sans-serif;
    background: #03a9f3!important;
    color: #FFF!important;
    font-size: 12px!important;
    font-weight: 500!important;
    padding: 5px 0px!important;
}

.fc {
	direction: ltr;
	text-align: left;
	}
	
.fc table {
	border-collapse: collapse;
	border-spacing: 0;
	}
	
html .fc,
.fc table {
	font-size: 1em;
	font-family: "Helvetica Neue",Helvetica;

	}
	
.fc td,
.fc th {
	padding: 0;
	vertical-align: top;
	}

/* Header
------------------------------------------------------------------------*/

.fc-header td {
	white-space: nowrap;
	padding: 15px 10px 0px;
}

.fc-header-left {
	width: 25%;
	text-align: left;
}
	
.fc-header-center {
	text-align: center;
	}
	
.fc-header-right {
	width: 25%;
	text-align: right;
	}
	
.fc-header-title {
	display: inline-block;
	vertical-align: top;
	margin-top: -5px;
}
	
.fc-header-title h2 {
	margin-top: 0;
	white-space: nowrap;
	font-size: 32px;
    font-weight: 100;
    margin-bottom: 10px;
		font-family: 'Roboto', sans-serif;
}
	span.fc-button {
    font-family: 'Roboto', sans-serif;
    border-color: #9675ce;
	color: #9675ce;
}
.fc-state-down, .fc-state-active {
    background-color: #9675ce !important;
	color: #FFF !important;
}
.fc .fc-header-space {
	padding-left: 10px;
	}
	
.fc-header .fc-button {
	margin-bottom: 1em;
	vertical-align: top;
	}
	
/* buttons edges butting together */

.fc-header .fc-button {
	margin-right: -1px;
	}
	
.fc-header .fc-corner-right,  /* non-theme */
.fc-header .ui-corner-right { /* theme */
	margin-right: 0; /* back to normal */
	}
	
/* button layering (for border precedence) */
	
.fc-header .fc-state-hover,
.fc-header .ui-state-hover {
	z-index: 2;
	}
	
.fc-header .fc-state-down {
	z-index: 3;
	}

.fc-header .fc-state-active,
.fc-header .ui-state-active {
	z-index: 4;
	}
	
	
	
/* Content
------------------------------------------------------------------------*/
	
.fc-content {
	clear: both;
	zoom: 1; /* for IE7, gives accurate coordinates for [un]freezeContentHeight */
	}
	
.fc-view {
	width: 100%;
	overflow: hidden;
	}
	
	

/* Cell Styles
------------------------------------------------------------------------*/

    /* <th>, usually */
.fc-widget-content {  /* <td>, usually */
	border: 1px solid #e5e5e5;
	}
.fc-widget-header{
    border-bottom: 1px solid #EEE; 
}	
.fc-state-highlight { /* <td> today cell */ /* TODO: add .fc-today to <th> */
	/* background: #fcf8e3; */
}

.fc-state-highlight > div > div.fc-day-number{
    background-color: #ff3b30;
    color: #FFFFFF;
    border-radius: 50%;
    margin: 4px;
}
	
.fc-cell-overlay { /* semi-transparent rectangle while dragging */
	background: #bce8f1;
	opacity: .3;
	filter: alpha(opacity=30); /* for IE */
	}
	


/* Buttons
------------------------------------------------------------------------*/

.fc-button {
	position: relative;
	display: inline-block;
	padding: 0 .6em;
	overflow: hidden;
	height: 1.9em;
	line-height: 1.9em;
	white-space: nowrap;
	cursor: pointer;
	}
	
.fc-state-default { /* non-theme */
	border: 1px solid;
	}

.fc-state-default.fc-corner-left { /* non-theme */
	border-top-left-radius: 4px;
	border-bottom-left-radius: 4px;
	}

.fc-state-default.fc-corner-right { /* non-theme */
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	}

/*
	Our default prev/next buttons use HTML entities like ‹ › « »
	and we'll try to make them look good cross-browser.
*/

.fc-text-arrow {
	margin: 0 .4em;
	font-size: 2em;
	line-height: 23px;
	vertical-align: baseline; /* for IE7 */
	}

.fc-button-prev .fc-text-arrow,
.fc-button-next .fc-text-arrow { /* for ‹ › */
	font-weight: bold;
	}
	
/* icon (for jquery ui) */
	
.fc-button .fc-icon-wrap {
	position: relative;
	float: left;
	top: 50%;
	}
	
.fc-button .ui-icon {
	position: relative;
	float: left;
	margin-top: -50%;
	
	*margin-top: 0;
	*top: -50%;
	}


.fc-state-default {
	border-color: #ff3b30;
	color: #ff3b30;	
}
.fc-button-month.fc-state-default, .fc-button-agendaWeek.fc-state-default, .fc-button-agendaDay.fc-state-default{
    min-width: 67px;
	text-align: center;
	transition: all 0.2s;
	-webkit-transition: all 0.2s;
}
.fc-state-hover,
.fc-state-down,
.fc-state-active,
.fc-state-disabled {
	color: #333333;
	background-color: #FFE3E3;
	}

.fc-state-hover {
	color: #ff3b30;
	text-decoration: none;
	background-position: 0 -15px;
	-webkit-transition: background-position 0.1s linear;
	   -moz-transition: background-position 0.1s linear;
	     -o-transition: background-position 0.1s linear;
	        transition: background-position 0.1s linear;
	}

.fc-state-down,
.fc-state-active {
	background-color: #ff3b30;
	background-image: none;
	outline: 0;
	color: #FFFFFF;
}

.fc-state-disabled {
	cursor: default;
	background-image: none;
	background-color: #FFE3E3;
	filter: alpha(opacity=65);
	box-shadow: none;
	border:1px solid #FFE3E3;
	color: #ff3b30;
	}

	

/* Global Event Styles
------------------------------------------------------------------------*/

.fc-event-container > * {
	z-index: 8;
	}

.fc-event-container > .ui-draggable-dragging,
.fc-event-container > .ui-resizable-resizing {
	z-index: 9;
	}
	 
.fc-event {
	border: 1px solid #FFF; /* default BORDER color */
	background-color: #FFF; /* default BACKGROUND color */
	color: #919191;               /* default TEXT color */
	font-size: 12px;
	cursor: default;
}
.fc-event.chill{
    background-color: #f3dcf8;
}
.fc-event.info{
    background-color: #c6ebfe;
}
.fc-event.important{
    background-color: #FFBEBE;
}
.fc-event.success{
    background-color: #BEFFBF;
}
.fc-event:hover{
    opacity: 0.7;
}
a.fc-event {
	text-decoration: none;
	}
	
a.fc-event,
.fc-event-draggable {
	cursor: pointer;
	}
	
.fc-rtl .fc-event {
	text-align: right;
	}

.fc-event-inner {
	width: 100%;
	height: 100%;
	overflow: hidden;
	line-height: 15px;
	}
	
.fc-event-time,
.fc-event-title {
	padding: 0 1px;
	}
	
.fc .ui-resizable-handle {
	display: block;
	position: absolute;
	z-index: 99999;
	overflow: hidden; /* hacky spaces (IE6/7) */
	font-size: 300%;  /* */
	line-height: 50%; /* */
	}
	
	
	
/* Horizontal Events
------------------------------------------------------------------------*/

.fc-event-hori {
	border-width: 1px 0;
	margin-bottom: 1px;
	}

.fc-ltr .fc-event-hori.fc-event-start,
.fc-rtl .fc-event-hori.fc-event-end {
	border-left-width: 1px;
	/*
border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
*/
	}

.fc-ltr .fc-event-hori.fc-event-end,
.fc-rtl .fc-event-hori.fc-event-start {
	border-right-width: 1px;
	/*
border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
*/
	}
	
/* resizable */
	
.fc-event-hori .ui-resizable-e {
	top: 0           !important; /* importants override pre jquery ui 1.7 styles */
	right: -3px      !important;
	width: 7px       !important;
	height: 100%     !important;
	cursor: e-resize;
	}
	
.fc-event-hori .ui-resizable-w {
	top: 0           !important;
	left: -3px       !important;
	width: 7px       !important;
	height: 100%     !important;
	cursor: w-resize;
	}
	
.fc-event-hori .ui-resizable-handle {
	_padding-bottom: 14px; /* IE6 had 0 height */
	}
	
	
	
/* Reusable Separate-border Table
------------------------------------------------------------*/

table.fc-border-separate {
	border-collapse: separate;
	}
	
.fc-border-separate th,
.fc-border-separate td {
	border-width: 1px 0 0 1px;
	}
	
.fc-border-separate th.fc-last,
.fc-border-separate td.fc-last {
	border-right-width: 1px;
	}
	

.fc-border-separate tr.fc-last td {
	
}
.fc-border-separate .fc-week .fc-first{
    border-left: 0;
}
.fc-border-separate .fc-week .fc-last{
    border-right: 0;
}
.fc-border-separate tr.fc-last th{
    border-bottom-width: 1px;
    border-color: #cdcdcd;
    font-size: 16px;
    font-weight: 300;
	line-height: 30px;
}
.fc-border-separate tbody tr.fc-first td,
.fc-border-separate tbody tr.fc-first th {
	border-top-width: 0;
	}
	
	

/* Month View, Basic Week View, Basic Day View
------------------------------------------------------------------------*/

.fc-grid th {
	text-align: center;
	}

.fc .fc-week-number {
	width: 22px;
	text-align: center;
	}

.fc .fc-week-number div {
	padding: 0 2px;
	}
	
.fc-grid .fc-day-number {
	float: right;
	padding: 0 2px;
	}
	
.fc-grid .fc-other-month .fc-day-number {
	opacity: 0.3;
	filter: alpha(opacity=30); /* for IE */
	/* opacity with small font can sometimes look too faded
	   might want to set the 'color' property instead
	   making day-numbers bold also fixes the problem */
	}
	
.fc-grid .fc-day-content {
	clear: both;
	padding: 2px 2px 1px; /* distance between events and day edges */
	}
	
/* event styles */
	
.fc-grid .fc-event-time {
	font-weight: bold;
	}
	
/* right-to-left */
	
.fc-rtl .fc-grid .fc-day-number {
	float: left;
	}
	
.fc-rtl .fc-grid .fc-event-time {
	float: right;
	}
	
	

/* Agenda Week View, Agenda Day View
------------------------------------------------------------------------*/

.fc-agenda table {
	border-collapse: separate;
	}
	
.fc-agenda-days th {
	text-align: center;
	}
	
.fc-agenda .fc-agenda-axis {
	width: 50px;
	padding: 0 4px;
	vertical-align: middle;
	text-align: right;
	white-space: nowrap;
	font-weight: normal;
	}

.fc-agenda .fc-week-number {
	font-weight: bold;
	}
	
.fc-agenda .fc-day-content {
	padding: 2px 2px 1px;
	}
	
/* make axis border take precedence */
	
.fc-agenda-days .fc-agenda-axis {
	border-right-width: 1px;
	}
	
.fc-agenda-days .fc-col0 {
	border-left-width: 0;
	}
	
/* all-day area */
	
.fc-agenda-allday th {
	border-width: 0 1px;
	}
	
.fc-agenda-allday .fc-day-content {
	min-height: 34px; /* TODO: doesnt work well in quirksmode */
	_height: 34px;
	}
	
/* divider (between all-day and slots) */
	
.fc-agenda-divider-inner {
	height: 2px;
	overflow: hidden;
	}
	
.fc-widget-header .fc-agenda-divider-inner {
	background: #eee;
	}
	
/* slot rows */
	
.fc-agenda-slots th {
	border-width: 1px 1px 0;
	}
	
.fc-agenda-slots td {
	border-width: 1px 0 0;
	background: none;
	}
	
.fc-agenda-slots td div {
	height: 20px;
	}
	
.fc-agenda-slots tr.fc-slot0 th,
.fc-agenda-slots tr.fc-slot0 td {
	border-top-width: 0;
	}
	
.fc-agenda-slots tr.fc-minor th.ui-widget-header {
	*border-top-style: solid; /* doesn't work with background in IE6/7 */
	}
	


/* Vertical Events
------------------------------------------------------------------------*/

.fc-event-vert {
	border-width: 0 1px;
	}

.fc-event-vert.fc-event-start {
	border-top-width: 1px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	}

.fc-event-vert.fc-event-end {
	border-bottom-width: 1px;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	}
	
.fc-event-vert .fc-event-time {
	white-space: nowrap;
	font-size: 10px;
	}

.fc-event-vert .fc-event-inner {
	position: relative;
	z-index: 2;
	}
	
.fc-event-vert .fc-event-bg { /* makes the event lighter w/ a semi-transparent overlay  */
	position: absolute;
	z-index: 1;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #fff;
	opacity: .25;
	filter: alpha(opacity=25);
	}
	
.fc .ui-draggable-dragging .fc-event-bg, /* TODO: something nicer like .fc-opacity */
.fc-select-helper .fc-event-bg {
	display: none\9; /* for IE6/7/8. nested opacity filters while dragging don't work */
	}
	
/* resizable */
	
.fc-event-vert .ui-resizable-s {
	bottom: 0        !important; /* importants override pre jquery ui 1.7 styles */
	width: 100%      !important;
	height: 8px      !important;
	overflow: hidden !important;
	line-height: 8px !important;
	font-size: 11px  !important;
	font-family: monospace;
	text-align: center;
	cursor: s-resize;
	}
	
.fc-agenda .ui-resizable-resizing { /* TODO: better selector */
	_overflow: hidden;
	}
	
thead tr.fc-first{
    background-color: #f7f7f7;
}
table.fc-header{
    background-color: #FFFFFF;
    border-radius: 6px 6px 0 0;
}

.fc-week .fc-day > div .fc-day-number{
    font-size: 15px;
    margin: 2px;
    min-width: 19px;
    padding: 6px;
    text-align: center;
       width: 30px;
    height: 30px;
}
.fc-sun, .fc-sat{
    color: #b8b8b8;
}

.fc-week .fc-day:hover .fc-day-number{
    background-color: #B8B8B8;
    border-radius: 50%;
    color: #FFFFFF;
    transition: background-color 0.2s;
}
.fc-week .fc-day.fc-state-highlight:hover .fc-day-number{
    background-color:  #ff3b30;
}
.fc-button-today{
    border: 1px solid rgba(255,255,255,.0);
}
.fc-view-agendaDay thead tr.fc-first .fc-widget-header{
    text-align: right;
    padding-right: 10px;
}

/*!
 * FullCalendar v1.6.4 Print Stylesheet
 * Docs & License: http://arshaw.com/fullcalendar/
 * (c) 2013 Adam Shaw
 */

/*
 * Include this stylesheet on your page to get a more printer-friendly calendar.
 * When including this stylesheet, use the media='print' attribute of the <link> tag.
 * Make sure to include this stylesheet IN ADDITION to the regular fullcalendar.css.
 */
 
 
 /* Events
-----------------------------------------------------*/
 
.fc-event {
	background: #fff !important;
	color: #000 !important;
	}
	
/* for vertical events */
	
.fc-event-bg {
	display: none !important;
	}
	
.fc-event .ui-resizable-handle {
	display: none !important;
	}
	
	

	body {
	    margin-bottom: 40px;
		margin-top: 40px;
		text-align: center;
		font-size: 14px;
		font-family: 'Roboto', sans-serif;
		}
		
	#wrap {
	
		margin: 0 auto;
		}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}
		
	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
height: 600px;

        margin: 0 auto;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		-webkit-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
-moz-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
		}
</style>      
<!--캘린더 CSS-->   

<!--날씨 JS-->
<script>
        $(document).ready(function(){

var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=37.56826&lon=126.977829&APPID=43fce1207e607871d1c04e909ab2b499";
$.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function(resp) {

        $('#cityName').text(resp.name);	
        var cityTemp= resp.main.temp- 273.15
        $('#cityTemp').text(cityTemp.toFixed(2));
        $('#cityWeather').text(resp.weather[0].main);  
    }
})
})
    $(function(){
       
       window.setInterval(function(){

        var d = new Date();
        var day = d.getFullYear()+"년"+(d.getMonth()+1)+"월"+d.getDate()+"일";
        var time = d.getHours()+"시"+d.getMinutes()+"분"
         
        document.getElementById('realTime').innerHTML = day+"<br>"+time;
       },1000);

        
    });
</script>
<!--날씨 JS-->    
 <style>
/**
 * Copyright 2015 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

html, body {
  font-family: 'Roboto', 'Helvetica', sans-serif;
  margin: 0;
  padding: 0;
}
.mdl-demo .mdl-layout__header-row {
  padding-left: 40px;
}
.mdl-demo .mdl-layout.is-small-screen .mdl-layout__header-row h3 {
  font-size: inherit;
}
.mdl-demo .mdl-layout__tab-bar-button {
  display: none;
}
.mdl-demo .mdl-layout.is-small-screen .mdl-layout__tab-bar .mdl-button {
  display: none;
}
.mdl-demo .mdl-layout:not(.is-small-screen) .mdl-layout__tab-bar,
.mdl-demo .mdl-layout:not(.is-small-screen) .mdl-layout__tab-bar-container {
  overflow: visible;
}
.mdl-demo .mdl-layout__tab-bar-container {
  height: 64px;
}
.mdl-demo .mdl-layout__tab-bar {
  padding: 0;
  padding-left: 16px;
  box-sizing: border-box;
  height: 100%;
  width: 100%;
}
.mdl-demo .mdl-layout__tab-bar .mdl-layout__tab {
  height: 64px;
  line-height: 64px;
}
.mdl-demo .mdl-layout__tab-bar .mdl-layout__tab.is-active::after {
  background-color: white;
  height: 4px;
}
.mdl-demo main > .mdl-layout__tab-panel {
  padding: 0px;
  padding-top: 8px;
 
}
.mdl-demo .mdl-card {
  height: auto;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column;
}
.mdl-demo .mdl-card > * {
  height: auto;
}
.mdl-demo .mdl-card .mdl-card__supporting-text {
  margin: 40px;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1;
  padding: 0;
  color: inherit;
  width: calc(100% - 80px);
}
.mdl-demo.mdl-demo .mdl-card__supporting-text h4 {
  margin-top: 0;
  margin-bottom: 20px;
}
.mdl-demo .mdl-card__actions {
  margin: 0;
  padding: 4px 40px;
  color: inherit;
}
.mdl-demo .mdl-card__actions a {
  color: #00BCD4;
  margin: 0;
}
.mdl-demo .mdl-card__actions a:hover,
.mdl-demo .mdl-card__actions a:active {
  color: inherit;
  background-color: transparent;
}
.mdl-demo .mdl-card__supporting-text + .mdl-card__actions {
  border-top: 1px solid rgba(0, 0, 0, 0.12);
}
.mdl-demo #add {
  position: absolute;
  right: 40px;
  top: 36px;
  z-index: 999;
}

.mdl-demo .mdl-layout__content section:not(:last-of-type) {
  position: relative;
  margin-bottom: 48px;
}
.mdl-demo section.section--center {
  max-width: 860px;
}
.mdl-demo #features section.section--center {
  max-width: 620px;
}
.mdl-demo section > header{
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}
.mdl-demo section > .section__play-btn {
  min-height: 200px;
}
.mdl-demo section > header > .material-icons {
  font-size: 3rem;
}
.mdl-demo section > button {
  position: absolute;
  z-index: 99;
  top: 8px;
  right: 8px;
}
.mdl-demo section .section__circle {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  -webkit-justify-content: flex-start;
      -ms-flex-pack: start;
          justify-content: flex-start;
  -webkit-flex-grow: 0;
      -ms-flex-positive: 0;
          flex-grow: 0;
  -webkit-flex-shrink: 1;
      -ms-flex-negative: 1;
          flex-shrink: 1;
}
.mdl-demo section .section__text {
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1;
  -webkit-flex-shrink: 0;
      -ms-flex-negative: 0;
          flex-shrink: 0;
  padding-top: 8px;
}
.mdl-demo section .section__text h5 {
  font-size: inherit;
  margin: 0;
  margin-bottom: 0.5em;
}
.mdl-demo section .section__text a {
  text-decoration: none;
}
.mdl-demo section .section__circle-container > .section__circle-container__circle {
  width: 64px;
  height: 64px;
  border-radius: 32px;
  margin: 8px 0;
}
.mdl-demo section.section--footer .section__circle--big {
  width: 100px;
  height: 100px;
  border-radius: 50px;
  margin: 8px 32px;
}
.mdl-demo .is-small-screen section.section--footer .section__circle--big {
  width: 50px;
  height: 50px;
  border-radius: 25px;
  margin: 8px 16px;
}
.mdl-demo section.section--footer {
  padding: 64px 0;
  margin: 0 -8px -8px -8px;
}
.mdl-demo section.section--center .section__text:not(:last-child) {
  border-bottom: 1px solid rgba(0,0,0,.13);
}
.mdl-demo .mdl-card .mdl-card__supporting-text > h3:first-child {
  margin-bottom: 24px;
}
.mdl-demo .mdl-layout__tab-panel:not(#overview) {
  background-color: white;
}
.mdl-demo #features section {
  margin-bottom: 72px;
}
.mdl-demo #features h4, #features h5 {
  margin-bottom: 16px;
}
.mdl-demo .toc {
  border-left: 4px solid #C1EEF4;
  margin: 24px;
  padding: 0;
  padding-left: 8px;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column;
}
.mdl-demo .toc h4 {
  font-size: 0.9rem;
  margin-top: 0;
}
.mdl-demo .toc a {
  color: #4DD0E1;
  text-decoration: none;
  font-size: 16px;
  line-height: 28px;
  display: block;
}
.mdl-demo .mdl-menu__container {
  z-index: 99;
}
<!--태환 css-->
    body { margin-left: 0px; margin-top: 0px; margin-right: 0px; margin-bottom: 0px; }
    
    #view-source {
      position: fixed;
      display: block;
      right: 0;
      bottom: 0;
      margin-right: 40px;
      margin-bottom: 0px;
      z-index: 900;
    }
    #login{
        position: absolute;
        
        right: 30px;
    }
    .article{
      display: inline-block;
      margin: 5px;
      padding: 5px;
      position: relative;
    }
    .main{ position: relative; height: 1480px; padding: 10px; }
    .left{  position: absolute;  margin-left:33px; left: 0px}
    .center{  position: absolute; left: 440px;} 
    .right{ position: absolute; left: 1300px;}
    .profile{position: relative;
            width: 375px;
            height: 500px;
          
            background: white;
            border: 1px solid rgb(192, 189, 189);
           }
     .name{
            position: absolute;
      width: 110px;
      height: 40px;
      left: 130.58px;
      top: 236.75px;

      font-family: Comfortaa;
      font-style: normal;
      font-weight: normal;
      font-size: 30px;
      line-height: 40px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: -0.015em;

      color: #000000;

      transform: rotate(0.31deg);
     } 
     .myphoto{
      position: absolute;
      width: 128px;
      height: 128px;
      left: 126.45px;
      top: 76.68px;

      background: url(photo-1542103749-8ef59b94f47e.jpg);
      transform: rotate(0.31deg);
     }
     .title{
      position: absolute;
      width: 80px;
      height: 15px;
      left: 148.27px;
      top: 300.84px;

      font-family: Roboto;
      font-style: normal;
      font-weight: 900;
      font-size: 13px;
      line-height: 15px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: 0.04em;
      text-transform: uppercase;

      color: #000000;

      transform: rotate(0.31deg);
     }
     .todaycheck{
      position: absolute;
      width: 200px;
      height: 20px;
      left: 50px;
      top: 354.02px;

     
      font-style: normal;
      font-weight: 900;
      font-size: 15px;
      line-height: 15px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: 0.04em;
      text-transform: uppercase;

      color: #000000;
    
     }
     .todaycheck1{
      position: absolute;
      width: 200px;
      height: 150px;
      top: 354.02px;
      left: 50px;

     
      font-style: normal;
      font-weight: 900;
      font-size: 15px;
      line-height: 15px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: 0.04em;
      text-transform: uppercase;

      color: #000000;
    
     }
    .checkpaper{
      position: relative;
      left: 24.27px;
      top: 9px;
      font-style: normal;
      font-weight: 900;
      font-size: 20px;
      line-height: 46px;
      display: flex;
      align-items: center;
      text-align: center;
      letter-spacing: 0.04em;
      text-transform: uppercase;
      color: #000000;
    }
      .non{
        width: 800px;height: 670px; 
      padding: 10px;  background:white;

      }
    .board{    width: 800px;
    height: 670px;
    border: 1px solid rgb(192, 189, 189);
    padding: 10px;
    background: white;
    position: relative;
    top: 54px;}
      .write{
        position: relative left 1px;
      }
    .calendar{width: 380px; height: 550px;}
    
    #chat{ position:relative; width: 500px;height: 950px; background:none; border:none;
    }
    #chattext{
        position: relative;
    top: -15px;
    left: -7px;
    width: 405px;
    height: 65px;
    padding: 10px;
    } 
    #chatbutton{
        position: relative;
    top: -15px;
    width: 90px;
    height: 64px;
    left: -7px;
    }
    .emergency{position: relative width 500px; height: 300px;}
    .check{position: relative;
            width: 375px;
            height: 350px;

            background: white;
          
            
            border: 1px solid rgb(192, 189, 189); }

      
      .checklist>li{
        font-style: normal;
    font-weight: 500;
    font-size: 15px;
    line-height: 25px;
    display: flex;
    align-items: center;
    text-align: center;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    color: #000000;
    }        
    .foodlist{
      
    position: relative;
    width: 380px;
    height: 482px;
    background:white;
    border: 1px solid rgb(192, 189, 189);
    padding-left: 10px;
    padding-right: 10px;
    padding-bottom: 10px;
    
    }        

    #logo{
      position: absolute;
      width: 120px;
      height: 120px;
      right: 70px;
    }
    #top{
      background: rgb(60, 0, 109);
      border-radius: 15px;
    }
   
   #foodtable tr,#foodtable td 
    {
  padding: 9px;
     }
  #boardtable tr,#boardtable td 
    {
    padding: 11px;
    border-top: 3px solid #ddd;
     }
     .emergency{
        position: relative;
        height: 400px;
        padding: 10px;
     }     
  <!--날씨 CSS-->


.col-sm-4 {
    -ms-flex: 0 0 33.333333%;
    flex: 0 0 33.333333%;
    max-width: 550px;
}     
.row{
    display: flex;
 
    height: 105px;
    flex-wrap: wrap;
    margin-right: -30px;
    margin-left: -37px;
} 

.row-no-gutter {
	margin-right: 0;
	margin-left: 0;

}

.row-no-gutter [class*="col-"] {
	padding-right: 0;
	padding-left: 0;
}


#card {
	
	    position: relative;
   		 top: 50px;

	-webkit-box-shadow: 0px 1px 10px 0px rgba(207,207,207,1);
	-moz-box-shadow: 0px 1px 10px 0px rgba(207,207,207,1);
	box-shadow: 0px 1px 10px 0px rgba(207,207,207,1);

	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;	
}

.city-selected {
	position: relative;
    width: 500px;
    overflow: hidden;
    min-height: 200px;
   
}


.info .city,
.night {
	font-size: 24px;
	font-weight: 200;
	position: relative;


	-webkit-order: 0;
	-ms-flex-order: 0;
	order: 0;
	-webkit-flex: 0 1 auto;
	-ms-flex: 0 1 auto;
	flex: 0 1 auto;
	-webkit-align-self: auto;
	-ms-flex-item-align: auto;
	align-self: auto;
}

.info .city:after {
	content: '';
	width: 15px;
	height: 2px;
	background: #fff;
	position: relative;
	display: inline-block;
	vertical-align: middle;
	margin-left: 10px;
}

.city span {
	color: #fff;
	font-size: 13px;
	font-weight: bold;

	
	text-align: left;
}

.night {
	font-size: 15px;
	text-transform: uppercase;
}

.icon {
	width: 84px;
	height: 84px;
	-webkit-order: 0;
	-ms-flex-order: 0;
	order: 0;
	-webkit-flex: 0 0 auto;
	-ms-flex: 0 0 auto;
	flex: 0 0 auto;
	-webkit-align-self: center;
	-ms-flex-item-align: center;
	align-self: center;

	overflow: visible;

}


.temp {
	font-size: 73px;
	display: block;
	position: relative;
	font-weight: bold;
}

svg {
	color: #fff;
	fill: currentColor;
}


.wind svg {
	width: 18px;
	height: 18px;
	margin-top: 20px;
	margin-right: 10px;
	vertical-align: bottom;
}

.wind span {
	font-size: 13px;
	text-transform: uppercase;
}

.city-selected:hover figure {
	opacity: 0.4;
}


figure {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    top: 0;
    background-position: center;
    background-size: cover;
    opacity: 0.1;
    z-index: 1;

    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

.days .row [class*="col-"]:nth-child(2) .day  {
    border-width: 0 1px 0 1px;
    border-style: solid;
    border-color: #eaeaea;
}

.days .row [class*="col-"] {
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;	
}

.days .row [class*="col-"]:hover{
	background: #eaeaea;
}

.day {
	padding: 10px 0px;
	text-align: center;

}

.day h1 {
	font-size: 14px;
	text-transform: uppercase;
	margin-top: 10px;
}

.day svg {
	color: #000;
	width: 32px;
	height: 32px;
}
.info div,span{
    font-weight: 600;
}
.weater{
    height: 424px;
    padding-top: 20px;
}
#realTime{
    font-size: 30px;
    font-weight: 700;
    line-height: 45px;
    margin-top: 21px;
}
.mdl-chip__contact{

    height: 32px;
    width: 105px;
    border-radius: 16px;
    margin-right: 8px;
    font-size: 18px;
    line-height: 32px;
} 
#info{
    list-style-type: none;
}

</style>
</head>

 <body>
	 
    <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
        <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
        
        	<%@ include file="/views/common/header.jsp" %> 
     
          <div class="mdl-layout__tab-panel is-active" id="overview">
            
            <div class="main">
            <div class="article left">
              <div class="profile">
            <div class="mdl-layout--large-screen-only mdl-layout__header-row" id="top">
            
        		<div style="position: relative ;top: 120px;left: 86px"><%if(at.getChangename()!=null){ System.out.println(at.getChangename());%>
                <img src="../resource/images/<%=at.getChangename() %>" width="130px" height="130px" style="border-radius: 17px";> 
              <%}else{ %>
              	<img src="../resource/images/캡처.PNG" width="130px" height="130px" style="border-radius: 17px;"> 
              	
              <%} %> </div>   
              </div>   
                <p class="name" style="left: 143.58px;"><%=m.getEmpName() %></p>
                <p class="title"><%=m.getDeptName() %> <%=m.getJobName() %></p>
                <p class="todaycheck"> º 오늘의 일정 : <span>0 건</span></p>
                <p class="todaycheck1"> º 오늘 근무현황 : <span>휴가</span></p>
              </div> <br>
              <div class="check">

                <p class="checkpaper">※전자결제 알림창</p><hr><br><br>
                <ul class="checklist">
                  <li>º 내가 올린 문서 : <span id='cfCount0'></span></li><br>
                  <li>º 결재할 문서 : <span id='cfCount1'></span></li><br>
                  <li>º 결재 완료 문서 : <span id='cfCount2'></span></li><br>
                  <li>º 반려된 문서 : <span id='cfCount3'></span></li><br>
                  <li>º 참조 문서 : <span id='cfCount4'></span></li>
                </ul>
                
                <script>
                	$(document).ready(function(){
                		
                		$.ajax({
                			url:"/Semi/MainServlet.cb",
                			type:"get",
                			data:{
                				empNo:<%=m.getEmpNo()%>
                			},success:function(data){
                				
                				$('#cfCount0').text(data[0] + " 건");
                				$('#cfCount1').text(data[1] + " 건");
                				$('#cfCount2').text(data[2] + " 건");
                				$('#cfCount3').text(data[3] + " 건");
                				$('#cfCount4').text(data[4] + " 건");
                				
                			},error:function(){
                				alert("오류");
                			}
                		});
                		
                	});
                </script>
                
              </div><br><br>
                <div class="foodlist" align="center" style="font-size: 15px; font-weight: 30px;"><br> 
                  <label style="  
                  position: relative;
                  top: -5px;
                  left: -87px;
                  font-weight: 900;
                  font-size: 16px;
                  line-height: 46px;
                  letter-spacing: 0.04em;
                  color: #000000;">※사내 식당 메뉴</label>
                  <table  id="foodtable"class="table table-hover" style="font-size: 13px;">
                  <thead>
                    <tr>
                      <th>날짜</th>
                      <th colspan="3">메뉴</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%for(FoodList f : flist) {%>
                    <tr >
                      <td ><%=f.getDay() %></td>
                      <td><%=f.getRice() %></td>
                      <td><%=f.getSoup() %></td>
                      <td><%=f.getMainfood() %></td>
                    </tr>
                    <%} %>
                  </tbody>
                </table>
                </div>
            </div>
          <div class="article center">
            <div class="non"> <!--메인-->
              <div id='wrap'>
                  <div id='calendar'>
                  
                  <%@include file = "/views/common/mainWorkingHour.jsp"  %>
                  </div>
                  <div style='clear:both'></div>
                  </div>
            </div> 
            
            <div class="board"> <p style=" font-weight: 900;
                font-size: 20px;
                line-height: 46px;
                letter-spacing: 0.04em;
                color: #000000;">※ 사내 전체공지</p>
                 <a style="padding-right:670px; color: red;" href="javascript:void(0)"onclick="goNotice()">+더보기</a>
               <table id="boardtable" class="table table-hover"><hr>
                <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>날짜</th>
                        </tr>
                    </thead>
                    <% for(Notice n : nlist){ %>
                    <tbody>
                        <tr>      
                          <input type="hidden" value="<%= n.getNno() %>"/>  
                            <td><%= n.getRnum() %></td>                     	        	
                            <td><%= n.getNtitle() %></td> 
                            <td><%= n.getNwriter() %></td>
                            <td><%= n.getnCount() %></td>
                            <td><%= n.getNdate() %></td>
                        </tr>                        
                    </tbody>
                   
                    <% } %>
                </table>
             
              </div> <br>
          </div>
          <div class="article right" style="width:600px; border:0px;" >

            <div id="chat" style="text-align:left; background:none; border:none;"  >
         <%@include file="/views/common/chat.jsp"%>
          </div>  <br>
       
            <script>
              

function AMPM(D){
   var ampm = D.getHours() < 12 ?"오전" : "오후";

    return ampm;
}
            </script>
           
             <div class="emergency">
                <div class="container">
                    <div class="row">
                      
                            <div id="card" class="weater" style="    height: 385px;;">
                                <div class="city-selected">
            
                                        <div class="info">
                                            <div class="city" style="height: 85px; color: black; padding: 15px;" ><span style=" color: black; font-size: 40px;">City : </span> 
                                                <!-- 도시이름 -->
                                                <span id="cityName" style="color: black; font-size: 40px;"></span> 
                                                <!-- 도시이름 -->
                                            </div>
                                            <div class="temp">
                                                <!-- 온도 -->
                                                <span id="cityTemp" style="font-size: 80px;
                                                color: black;"> </span><span style="color:black;">°</span> 
                                                <!-- 온도 -->
                                            </div>	
                                            <div class="weather" style="font-size: 35px;"><span style="font-size: 40px;"></span></div>
                                                <!--날씨-->
                                                <span id="cityWeather" style="font-size: 40px;
                                                color: black;"></span>
                                                <!--날씨-->
                                            <div class="Time">
                                                <div id="realTime"></div>
                                            </div>
                                        </div>
            
                                          </div>
                                    
                                </div>
                            
                        </div>
                    </div>
                </div>

                <!-- 날씨 넣기 지도 넣고 옆에 회사 위치 날씨 정보 집어 넣기 모자라다 싶으면 
                수도권 날씨 셀렉트 옵션으로 집어넣기 -->
            </div> 
         </div>
        </div> 
          </div>
              <%@ include file="./common/footer.jsp" %>
	
<form action="/Semi/msglist.do" name="msgfrm" id="msgfrm" >
	 <input name=my_emp_no type=hidden value=<%=m.getEmpNo()%>>
</form>

			<script>
				
			 $("#boardtable td").click(function(){
					var nno = $(this).parent().find("input").val();
		 			location.href="<%=request.getContextPath()%>/selectOne.no?nno=" + nno; 
				});
			
			</script>

            <script>
              window.onfocus=function(){
              }
              window.onload=function(){
               window.focus(); // 현재 window 즉 익스플러러를 윈도우 최상단에 위치
              window.moveTo(0,0); // 웹 페이지의 창 위치를 0,0 (왼쪽 최상단) 으로 고정
              window.resizeTo(1280,800); // 웹페이지의 크기를 가로 1280 , 세로 800 으로 고정(확장 및 축소)
              window.scrollTo(0,250); // 페이지 상단 광고를 바로 볼 수 있게 스크롤 위치를 조정
              }
              
              
              </script>
</body>
</html>