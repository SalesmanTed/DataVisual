<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="<%=path%>/example/css/bootstrap.css">
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries-->
		<!--[if lt IE 9]><script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script><script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
		<link rel="stylesheet" type="text/css" href="<%=path%>/example/css/main.css">
		<title>数据展示软件</title>
		<script src="<%=path%>/example/js/hm.js"></script>
		<script type="text/javascript">
			window.EC_DEMO_LANG = 'cn';
		</script>
		<style type="text/css">
			.dg {
				/** Clear list styles */
				/* Auto-place container */
				/* Auto-placed GUI's */
				/* Line items that don't contain folders. */
				/** Folder names */
				/** Hides closed items */
				/** Controller row */
				/** Name-half (left) */
				/** Controller-half (right) */
				/** Controller placement */
				/** Shorter number boxes when slider is present. */
				/** Ensure the entire boolean and function row shows a hand */
			}
			
			.dg ul {
				list-style: none;
				margin: 0;
				padding: 0;
				width: 100%;
				clear: both;
			}
			
			.dg.ac {
				position: fixed;
				top: 0;
				left: 0;
				right: 0;
				height: 0;
				z-index: 0;
			}
			
			.dg:not(.ac) .main {
				/** Exclude mains in ac so that we don't hide close button */
				overflow: hidden;
			}
			
			.dg.main {
				-webkit-transition: opacity 0.1s linear;
				-o-transition: opacity 0.1s linear;
				-moz-transition: opacity 0.1s linear;
				transition: opacity 0.1s linear;
			}
			
			.dg.main.taller-than-window {
				overflow-y: auto;
			}
			
			.dg.main.taller-than-window .close-button {
				opacity: 1;
				/* TODO, these are style notes */
				margin-top: -1px;
				border-top: 1px solid #2c2c2c;
			}
			
			.dg.main ul.closed .close-button {
				opacity: 1 !important;
			}
			
			.dg.main:hover .close-button,
			.dg.main .close-button.drag {
				opacity: 1;
			}
			
			.dg.main .close-button {
				/*opacity: 0;*/
				-webkit-transition: opacity 0.1s linear;
				-o-transition: opacity 0.1s linear;
				-moz-transition: opacity 0.1s linear;
				transition: opacity 0.1s linear;
				border: 0;
				position: absolute;
				line-height: 19px;
				height: 20px;
				/* TODO, these are style notes */
				cursor: pointer;
				text-align: center;
				background-color: #000;
			}
			
			.dg.main .close-button:hover {
				background-color: #111;
			}
			
			.dg.a {
				float: right;
				margin-right: 15px;
				overflow-x: hidden;
			}
			
			.dg.a.has-save>ul {
				margin-top: 27px;
			}
			
			.dg.a.has-save>ul.closed {
				margin-top: 0;
			}
			
			.dg.a .save-row {
				position: fixed;
				top: 0;
				z-index: 1002;
			}
			
			.dg li {
				-webkit-transition: height 0.1s ease-out;
				-o-transition: height 0.1s ease-out;
				-moz-transition: height 0.1s ease-out;
				transition: height 0.1s ease-out;
			}
			
			.dg li:not(.folder) {
				cursor: auto;
				height: 27px;
				line-height: 27px;
				overflow: hidden;
				padding: 0 4px 0 5px;
			}
			
			.dg li.folder {
				padding: 0;
				border-left: 4px solid rgba(0, 0, 0, 0);
			}
			
			.dg li.title {
				cursor: pointer;
				margin-left: -4px;
			}
			
			.dg .closed li:not(.title),
			.dg .closed ul li,
			.dg .closed ul li>* {
				height: 0;
				overflow: hidden;
				border: 0;
			}
			
			.dg .cr {
				clear: both;
				padding-left: 3px;
				height: 27px;
			}
			
			.dg .property-name {
				cursor: default;
				float: left;
				clear: left;
				width: 40%;
				overflow: hidden;
				text-overflow: ellipsis;
			}
			
			.dg .c {
				float: left;
				width: 60%;
			}
			
			.dg .c input[type=text] {
				border: 0;
				margin-top: 4px;
				padding: 3px;
				width: 100%;
				float: right;
			}
			
			.dg .has-slider input[type=text] {
				width: 30%;
				/*display: none;*/
				margin-left: 0;
			}
			
			.dg .slider {
				float: left;
				width: 66%;
				margin-left: -5px;
				margin-right: 0;
				height: 19px;
				margin-top: 4px;
			}
			
			.dg .slider-fg {
				height: 100%;
			}
			
			.dg .c input[type=checkbox] {
				margin-top: 9px;
			}
			
			.dg .c select {
				margin-top: 5px;
			}
			
			.dg .cr.function,
			.dg .cr.function .property-name,
			.dg .cr.function *,
			.dg .cr.boolean,
			.dg .cr.boolean * {
				cursor: pointer;
			}
			
			.dg .selector {
				display: none;
				position: absolute;
				margin-left: -9px;
				margin-top: 23px;
				z-index: 10;
			}
			
			.dg .c:hover .selector,
			.dg .selector.drag {
				display: block;
			}
			
			.dg li.save-row {
				padding: 0;
			}
			
			.dg li.save-row .button {
				display: inline-block;
				padding: 0px 6px;
			}
			
			.dg.dialogue {
				background-color: #222;
				width: 460px;
				padding: 15px;
				font-size: 13px;
				line-height: 15px;
			}
			/* TODO Separate style and structure */
			
			#dg-new-constructor {
				padding: 10px;
				color: #222;
				font-family: Monaco, monospace;
				font-size: 10px;
				border: 0;
				resize: none;
				box-shadow: inset 1px 1px 1px #888;
				word-wrap: break-word;
				margin: 12px 0;
				display: block;
				width: 440px;
				overflow-y: scroll;
				height: 100px;
				position: relative;
			}
			
			#dg-local-explain {
				display: none;
				font-size: 11px;
				line-height: 17px;
				border-radius: 3px;
				background-color: #333;
				padding: 8px;
				margin-top: 10px;
			}
			
			#dg-local-explain code {
				font-size: 10px;
			}
			
			#dat-gui-save-locally {
				display: none;
			}
			/** Main type */
			
			.dg {
				color: #eee;
				font: 11px 'Lucida Grande', sans-serif;
				text-shadow: 0 -1px 0 #111;
				/** Auto place */
				/* Controller row, <li> */
				/** Controllers */
			}
			
			.dg.main {
				/** Scrollbar */
			}
			
			.dg.main::-webkit-scrollbar {
				width: 5px;
				background: #1a1a1a;
			}
			
			.dg.main::-webkit-scrollbar-corner {
				height: 0;
				display: none;
			}
			
			.dg.main::-webkit-scrollbar-thumb {
				border-radius: 5px;
				background: #676767;
			}
			
			.dg li:not(.folder) {
				background: #1a1a1a;
				border-bottom: 1px solid #2c2c2c;
			}
			
			.dg li.save-row {
				line-height: 25px;
				background: #dad5cb;
				border: 0;
			}
			
			.dg li.save-row select {
				margin-left: 5px;
				width: 108px;
			}
			
			.dg li.save-row .button {
				margin-left: 5px;
				margin-top: 1px;
				border-radius: 2px;
				font-size: 9px;
				line-height: 7px;
				padding: 4px 4px 5px 4px;
				background: #c5bdad;
				color: #fff;
				text-shadow: 0 1px 0 #b0a58f;
				box-shadow: 0 -1px 0 #b0a58f;
				cursor: pointer;
			}
			
			.dg li.save-row .button.gears {
				background: #c5bdad url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAsAAAANCAYAAAB/9ZQ7AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAQJJREFUeNpiYKAU/P//PwGIC/ApCABiBSAW+I8AClAcgKxQ4T9hoMAEUrxx2QSGN6+egDX+/vWT4e7N82AMYoPAx/evwWoYoSYbACX2s7KxCxzcsezDh3evFoDEBYTEEqycggWAzA9AuUSQQgeYPa9fPv6/YWm/Acx5IPb7ty/fw+QZblw67vDs8R0YHyQhgObx+yAJkBqmG5dPPDh1aPOGR/eugW0G4vlIoTIfyFcA+QekhhHJhPdQxbiAIguMBTQZrPD7108M6roWYDFQiIAAv6Aow/1bFwXgis+f2LUAynwoIaNcz8XNx3Dl7MEJUDGQpx9gtQ8YCueB+D26OECAAQDadt7e46D42QAAAABJRU5ErkJggg==) 2px 1px no-repeat;
				height: 7px;
				width: 8px;
			}
			
			.dg li.save-row .button:hover {
				background-color: #bab19e;
				box-shadow: 0 -1px 0 #b0a58f;
			}
			
			.dg li.folder {
				border-bottom: 0;
			}
			
			.dg li.title {
				padding-left: 16px;
				background: black url(data:image/gif;base64,R0lGODlhBQAFAJEAAP////Pz8////////yH5BAEAAAIALAAAAAAFAAUAAAIIlI+hKgFxoCgAOw==) 6px 10px no-repeat;
				cursor: pointer;
				border-bottom: 1px solid rgba(255, 255, 255, 0.2);
			}
			
			.dg .closed li.title {
				background-image: url(data:image/gif;base64,R0lGODlhBQAFAJEAAP////Pz8////////yH5BAEAAAIALAAAAAAFAAUAAAIIlGIWqMCbWAEAOw==);
			}
			
			.dg .cr.boolean {
				border-left: 3px solid #806787;
			}
			
			.dg .cr.function {
				border-left: 3px solid #e61d5f;
			}
			
			.dg .cr.number {
				border-left: 3px solid #2fa1d6;
			}
			
			.dg .cr.number input[type=text] {
				color: #2fa1d6;
			}
			
			.dg .cr.string {
				border-left: 3px solid #1ed36f;
			}
			
			.dg .cr.string input[type=text] {
				color: #1ed36f;
			}
			
			.dg .cr.function:hover,
			.dg .cr.boolean:hover {
				background: #111;
			}
			
			.dg .c input[type=text] {
				background: #303030;
				outline: none;
			}
			
			.dg .c input[type=text]:hover {
				background: #3c3c3c;
			}
			
			.dg .c input[type=text]:focus {
				background: #494949;
				color: #fff;
			}
			
			.dg .c .slider {
				background: #303030;
				cursor: ew-resize;
			}
			
			.dg .c .slider-fg {
				background: #2fa1d6;
			}
			
			.dg .c .slider:hover {
				background: #3c3c3c;
			}
			
			.dg .c .slider:hover .slider-fg {
				background: #44abda;
			}
		</style>
		<style id="ace_editor.css">
			.ace_editor {
				position: relative;
				overflow: hidden;
				font: 12px/normal 'Monaco', 'Menlo', 'Ubuntu Mono', 'Consolas', 'source-code-pro', monospace;
				direction: ltr;
				text-align: left;
			}
			
			.ace_scroller {
				position: absolute;
				overflow: hidden;
				top: 0;
				bottom: 0;
				background-color: inherit;
				-ms-user-select: none;
				-moz-user-select: none;
				-webkit-user-select: none;
				user-select: none;
				cursor: text;
			}
			
			.ace_content {
				position: absolute;
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
				min-width: 100%;
			}
			
			.ace_dragging .ace_scroller:before {
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				content: '';
				background: rgba(250, 250, 250, 0.01);
				z-index: 1000;
			}
			
			.ace_dragging.ace_dark .ace_scroller:before {
				background: rgba(0, 0, 0, 0.01);
			}
			
			.ace_selecting,
			.ace_selecting * {
				cursor: text !important;
			}
			
			.ace_gutter {
				position: absolute;
				overflow: hidden;
				width: auto;
				top: 0;
				bottom: 0;
				left: 0;
				cursor: default;
				z-index: 4;
				-ms-user-select: none;
				-moz-user-select: none;
				-webkit-user-select: none;
				user-select: none;
			}
			
			.ace_gutter-active-line {
				position: absolute;
				left: 0;
				right: 0;
			}
			
			.ace_scroller.ace_scroll-left {
				box-shadow: 17px 0 16px -16px rgba(0, 0, 0, 0.4) inset;
			}
			
			.ace_gutter-cell {
				padding-left: 19px;
				padding-right: 6px;
				background-repeat: no-repeat;
			}
			
			.ace_gutter-cell.ace_error {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAABOFBMVEX/////////QRswFAb/Ui4wFAYwFAYwFAaWGAfDRymzOSH/PxswFAb/SiUwFAYwFAbUPRvjQiDllog5HhHdRybsTi3/Tyv9Tir+Syj/UC3////XurebMBIwFAb/RSHbPx/gUzfdwL3kzMivKBAwFAbbvbnhPx66NhowFAYwFAaZJg8wFAaxKBDZurf/RB6mMxb/SCMwFAYwFAbxQB3+RB4wFAb/Qhy4Oh+4QifbNRcwFAYwFAYwFAb/QRzdNhgwFAYwFAbav7v/Uy7oaE68MBK5LxLewr/r2NXewLswFAaxJw4wFAbkPRy2PyYwFAaxKhLm1tMwFAazPiQwFAaUGAb/QBrfOx3bvrv/VC/maE4wFAbRPBq6MRO8Qynew8Dp2tjfwb0wFAbx6eju5+by6uns4uH9/f36+vr/GkHjAAAAYnRSTlMAGt+64rnWu/bo8eAA4InH3+DwoN7j4eLi4xP99Nfg4+b+/u9B/eDs1MD1mO7+4PHg2MXa347g7vDizMLN4eG+Pv7i5evs/v79yu7S3/DV7/498Yv24eH+4ufQ3Ozu/v7+y13sRqwAAADLSURBVHjaZc/XDsFgGIBhtDrshlitmk2IrbHFqL2pvXf/+78DPokj7+Fz9qpU/9UXJIlhmPaTaQ6QPaz0mm+5gwkgovcV6GZzd5JtCQwgsxoHOvJO15kleRLAnMgHFIESUEPmawB9ngmelTtipwwfASilxOLyiV5UVUyVAfbG0cCPHig+GBkzAENHS0AstVF6bacZIOzgLmxsHbt2OecNgJC83JERmePUYq8ARGkJx6XtFsdddBQgZE2nPR6CICZhawjA4Fb/chv+399kfR+MMMDGOQAAAABJRU5ErkJggg==");
				background-repeat: no-repeat;
				background-position: 2px center;
			}
			
			.ace_gutter-cell.ace_warning {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAmVBMVEX///8AAAD///8AAAAAAABPSzb/5sAAAAB/blH/73z/ulkAAAAAAAD85pkAAAAAAAACAgP/vGz/rkDerGbGrV7/pkQICAf////e0IsAAAD/oED/qTvhrnUAAAD/yHD/njcAAADuv2r/nz//oTj/p064oGf/zHAAAAA9Nir/tFIAAAD/tlTiuWf/tkIAAACynXEAAAAAAAAtIRW7zBpBAAAAM3RSTlMAABR1m7RXO8Ln31Z36zT+neXe5OzooRDfn+TZ4p3h2hTf4t3k3ucyrN1K5+Xaks52Sfs9CXgrAAAAjklEQVR42o3PbQ+CIBQFYEwboPhSYgoYunIqqLn6/z8uYdH8Vmdnu9vz4WwXgN/xTPRD2+sgOcZjsge/whXZgUaYYvT8QnuJaUrjrHUQreGczuEafQCO/SJTufTbroWsPgsllVhq3wJEk2jUSzX3CUEDJC84707djRc5MTAQxoLgupWRwW6UB5fS++NV8AbOZgnsC7BpEAAAAABJRU5ErkJggg==");
				background-position: 2px center;
			}
			
			.ace_gutter-cell.ace_info {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAAAAAA6mKC9AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAAJ0Uk5TAAB2k804AAAAPklEQVQY02NgIB68QuO3tiLznjAwpKTgNyDbMegwisCHZUETUZV0ZqOquBpXj2rtnpSJT1AEnnRmL2OgGgAAIKkRQap2htgAAAAASUVORK5CYII=");
				background-position: 2px center;
			}
			
			.ace_dark .ace_gutter-cell.ace_info {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQBAMAAADt3eJSAAAAJFBMVEUAAAChoaGAgIAqKiq+vr6tra1ZWVmUlJSbm5s8PDxubm56enrdgzg3AAAAAXRSTlMAQObYZgAAAClJREFUeNpjYMAPdsMYHegyJZFQBlsUlMFVCWUYKkAZMxZAGdxlDMQBAG+TBP4B6RyJAAAAAElFTkSuQmCC");
			}
			
			.ace_scrollbar {
				position: absolute;
				right: 0;
				bottom: 0;
				z-index: 6;
			}
			
			.ace_scrollbar-inner {
				position: absolute;
				cursor: text;
				left: 0;
				top: 0;
			}
			
			.ace_scrollbar-v {
				overflow-x: hidden;
				overflow-y: scroll;
				top: 0;
			}
			
			.ace_scrollbar-h {
				overflow-x: scroll;
				overflow-y: hidden;
				left: 0;
			}
			
			.ace_print-margin {
				position: absolute;
				height: 100%;
			}
			
			.ace_text-input {
				position: absolute;
				z-index: 0;
				width: 0.5em;
				height: 1em;
				opacity: 0;
				background: transparent;
				-moz-appearance: none;
				appearance: none;
				border: none;
				resize: none;
				outline: none;
				overflow: hidden;
				font: inherit;
				padding: 0 1px;
				margin: 0 -1px;
				text-indent: -1em;
				-ms-user-select: text;
				-moz-user-select: text;
				-webkit-user-select: text;
				user-select: text;
				white-space: pre!important;
			}
			
			.ace_text-input.ace_composition {
				background: inherit;
				color: inherit;
				z-index: 1000;
				opacity: 1;
				text-indent: 0;
			}
			
			.ace_layer {
				z-index: 1;
				position: absolute;
				overflow: hidden;
				word-wrap: normal;
				white-space: pre;
				height: 100%;
				width: 100%;
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
				pointer-events: none;
			}
			
			.ace_gutter-layer {
				position: relative;
				width: auto;
				text-align: right;
				pointer-events: auto;
			}
			
			.ace_text-layer {
				font: inherit !important;
			}
			
			.ace_cjk {
				display: inline-block;
				text-align: center;
			}
			
			.ace_cursor-layer {
				z-index: 4;
			}
			
			.ace_cursor {
				z-index: 4;
				position: absolute;
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
				border-left: 2px solid;
				transform: translatez(0);
			}
			
			.ace_slim-cursors .ace_cursor {
				border-left-width: 1px;
			}
			
			.ace_overwrite-cursors .ace_cursor {
				border-left-width: 0;
				border-bottom: 1px solid;
			}
			
			.ace_hidden-cursors .ace_cursor {
				opacity: 0.2;
			}
			
			.ace_smooth-blinking .ace_cursor {
				-webkit-transition: opacity 0.18s;
				transition: opacity 0.18s;
			}
			
			.ace_editor.ace_multiselect .ace_cursor {
				border-left-width: 1px;
			}
			
			.ace_marker-layer .ace_step,
			.ace_marker-layer .ace_stack {
				position: absolute;
				z-index: 3;
			}
			
			.ace_marker-layer .ace_selection {
				position: absolute;
				z-index: 5;
			}
			
			.ace_marker-layer .ace_bracket {
				position: absolute;
				z-index: 6;
			}
			
			.ace_marker-layer .ace_active-line {
				position: absolute;
				z-index: 2;
			}
			
			.ace_marker-layer .ace_selected-word {
				position: absolute;
				z-index: 4;
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
			}
			
			.ace_line .ace_fold {
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
				display: inline-block;
				height: 11px;
				margin-top: -2px;
				vertical-align: middle;
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAAJCAYAAADU6McMAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAJpJREFUeNpi/P//PwOlgAXGYGRklAVSokD8GmjwY1wasKljQpYACtpCFeADcHVQfQyMQAwzwAZI3wJKvCLkfKBaMSClBlR7BOQikCFGQEErIH0VqkabiGCAqwUadAzZJRxQr/0gwiXIal8zQQPnNVTgJ1TdawL0T5gBIP1MUJNhBv2HKoQHHjqNrA4WO4zY0glyNKLT2KIfIMAAQsdgGiXvgnYAAAAASUVORK5CYII="), url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAA3CAYAAADNNiA5AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAACJJREFUeNpi+P//fxgTAwPDBxDxD078RSX+YeEyDFMCIMAAI3INmXiwf2YAAAAASUVORK5CYII=");
				background-repeat: no-repeat, repeat-x;
				background-position: center center, top left;
				color: transparent;
				border: 1px solid black;
				border-radius: 2px;
				cursor: pointer;
				pointer-events: auto;
			}
			
			.ace_dark .ace_fold {}
			
			.ace_fold:hover {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAAJCAYAAADU6McMAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAJpJREFUeNpi/P//PwOlgAXGYGRklAVSokD8GmjwY1wasKljQpYACtpCFeADcHVQfQyMQAwzwAZI3wJKvCLkfKBaMSClBlR7BOQikCFGQEErIH0VqkabiGCAqwUadAzZJRxQr/0gwiXIal8zQQPnNVTgJ1TdawL0T5gBIP1MUJNhBv2HKoQHHjqNrA4WO4zY0glyNKLT2KIfIMAAQsdgGiXvgnYAAAAASUVORK5CYII="), url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAA3CAYAAADNNiA5AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAACBJREFUeNpi+P//fz4TAwPDZxDxD5X4i5fLMEwJgAADAEPVDbjNw87ZAAAAAElFTkSuQmCC");
			}
			
			.ace_tooltip {
				background-color: #FFF;
				background-image: -webkit-linear-gradient(top, transparent, rgba(0, 0, 0, 0.1));
				background-image: linear-gradient(to bottom, transparent, rgba(0, 0, 0, 0.1));
				border: 1px solid gray;
				border-radius: 1px;
				box-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
				color: black;
				max-width: 100%;
				padding: 3px 4px;
				position: fixed;
				z-index: 999999;
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
				cursor: default;
				white-space: pre;
				word-wrap: break-word;
				line-height: normal;
				font-style: normal;
				font-weight: normal;
				letter-spacing: normal;
				pointer-events: none;
			}
			
			.ace_folding-enabled>.ace_gutter-cell {
				padding-right: 13px;
			}
			
			.ace_fold-widget {
				-moz-box-sizing: border-box;
				-webkit-box-sizing: border-box;
				box-sizing: border-box;
				margin: 0 -12px 0 1px;
				display: none;
				width: 11px;
				vertical-align: top;
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAANElEQVR42mWKsQ0AMAzC8ixLlrzQjzmBiEjp0A6WwBCSPgKAXoLkqSot7nN3yMwR7pZ32NzpKkVoDBUxKAAAAABJRU5ErkJggg==");
				background-repeat: no-repeat;
				background-position: center;
				border-radius: 3px;
				border: 1px solid transparent;
				cursor: pointer;
			}
			
			.ace_folding-enabled .ace_fold-widget {
				display: inline-block;
			}
			
			.ace_fold-widget.ace_end {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAANElEQVR42m3HwQkAMAhD0YzsRchFKI7sAikeWkrxwScEB0nh5e7KTPWimZki4tYfVbX+MNl4pyZXejUO1QAAAABJRU5ErkJggg==");
			}
			
			.ace_fold-widget.ace_closed {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAMAAAAGCAYAAAAG5SQMAAAAOUlEQVR42jXKwQkAMAgDwKwqKD4EwQ26sSOkVWjgIIHAzPiCgaqiqnJHZnKICBERHN194O5b9vbLuAVRL+l0YWnZAAAAAElFTkSuQmCCXA==");
			}
			
			.ace_fold-widget:hover {
				border: 1px solid rgba(0, 0, 0, 0.3);
				background-color: rgba(255, 255, 255, 0.2);
				box-shadow: 0 1px 1px rgba(255, 255, 255, 0.7);
			}
			
			.ace_fold-widget:active {
				border: 1px solid rgba(0, 0, 0, 0.4);
				background-color: rgba(0, 0, 0, 0.05);
				box-shadow: 0 1px 1px rgba(255, 255, 255, 0.8);
			}
			
			.ace_dark .ace_fold-widget {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHklEQVQIW2P4//8/AzoGEQ7oGCaLLAhWiSwB146BAQCSTPYocqT0AAAAAElFTkSuQmCC");
			}
			
			.ace_dark .ace_fold-widget.ace_end {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAH0lEQVQIW2P4//8/AxQ7wNjIAjDMgC4AxjCVKBirIAAF0kz2rlhxpAAAAABJRU5ErkJggg==");
			}
			
			.ace_dark .ace_fold-widget.ace_closed {
				background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAMAAAAFCAYAAACAcVaiAAAAHElEQVQIW2P4//+/AxAzgDADlOOAznHAKgPWAwARji8UIDTfQQAAAABJRU5ErkJggg==");
			}
			
			.ace_dark .ace_fold-widget:hover {
				box-shadow: 0 1px 1px rgba(255, 255, 255, 0.2);
				background-color: rgba(255, 255, 255, 0.1);
			}
			
			.ace_dark .ace_fold-widget:active {
				box-shadow: 0 1px 1px rgba(255, 255, 255, 0.2);
			}
			
			.ace_fold-widget.ace_invalid {
				background-color: #FFB4B4;
				border-color: #DE5555;
			}
			
			.ace_fade-fold-widgets .ace_fold-widget {
				-webkit-transition: opacity 0.4s ease 0.05s;
				transition: opacity 0.4s ease 0.05s;
				opacity: 0;
			}
			
			.ace_fade-fold-widgets:hover .ace_fold-widget {
				-webkit-transition: opacity 0.05s ease 0.05s;
				transition: opacity 0.05s ease 0.05s;
				opacity: 1;
			}
			
			.ace_underline {
				text-decoration: underline;
			}
			
			.ace_bold {
				font-weight: bold;
			}
			
			.ace_nobold .ace_bold {
				font-weight: normal;
			}
			
			.ace_italic {
				font-style: italic;
			}
			
			.ace_error-marker {
				background-color: rgba(255, 0, 0, 0.2);
				position: absolute;
				z-index: 9;
			}
			
			.ace_highlight-marker {
				background-color: rgba(255, 255, 0, 0.2);
				position: absolute;
				z-index: 8;
			}
			
			.ace_br1 {
				border-top-left-radius: 3px;
			}
			
			.ace_br2 {
				border-top-right-radius: 3px;
			}
			
			.ace_br3 {
				border-top-left-radius: 3px;
				border-top-right-radius: 3px;
			}
			
			.ace_br4 {
				border-bottom-right-radius: 3px;
			}
			
			.ace_br5 {
				border-top-left-radius: 3px;
				border-bottom-right-radius: 3px;
			}
			
			.ace_br6 {
				border-top-right-radius: 3px;
				border-bottom-right-radius: 3px;
			}
			
			.ace_br7 {
				border-top-left-radius: 3px;
				border-top-right-radius: 3px;
				border-bottom-right-radius: 3px;
			}
			
			.ace_br8 {
				border-bottom-left-radius: 3px;
			}
			
			.ace_br9 {
				border-top-left-radius: 3px;
				border-bottom-left-radius: 3px;
			}
			
			.ace_br10 {
				border-top-right-radius: 3px;
				border-bottom-left-radius: 3px;
			}
			
			.ace_br11 {
				border-top-left-radius: 3px;
				border-top-right-radius: 3px;
				border-bottom-left-radius: 3px;
			}
			
			.ace_br12 {
				border-bottom-right-radius: 3px;
				border-bottom-left-radius: 3px;
			}
			
			.ace_br13 {
				border-top-left-radius: 3px;
				border-bottom-right-radius: 3px;
				border-bottom-left-radius: 3px;
			}
			
			.ace_br14 {
				border-top-right-radius: 3px;
				border-bottom-right-radius: 3px;
				border-bottom-left-radius: 3px;
			}
			
			.ace_br15 {
				border-top-left-radius: 3px;
				border-top-right-radius: 3px;
				border-bottom-right-radius: 3px;
				border-bottom-left-radius: 3px;
			}
			/*# sourceURL=ace/css/ace_editor.css */
		</style>
		<style id="ace-tm">
			.ace-tm .ace_gutter {
				background: #f0f0f0;
				color: #333;
			}
			
			.ace-tm .ace_print-margin {
				width: 1px;
				background: #e8e8e8;
			}
			
			.ace-tm .ace_fold {
				background-color: #6B72E6;
			}
			
			.ace-tm {
				background-color: #FFFFFF;
				color: black;
			}
			
			.ace-tm .ace_cursor {
				color: black;
			}
			
			.ace-tm .ace_invisible {
				color: rgb(191, 191, 191);
			}
			
			.ace-tm .ace_storage,
			.ace-tm .ace_keyword {
				color: blue;
			}
			
			.ace-tm .ace_constant {
				color: rgb(197, 6, 11);
			}
			
			.ace-tm .ace_constant.ace_buildin {
				color: rgb(88, 72, 246);
			}
			
			.ace-tm .ace_constant.ace_language {
				color: rgb(88, 92, 
\6);
			}
			
			.ace-tm .ace_constant.ace_library {
				color: rgb(6, 150, 14);
			}
			
			.ace-tm .ace_invalid {
				background-color: rgba(255, 0, 0, 0.1);
				color: red;
			}
			
			.ace-tm .ace_support.ace_function {
				color: rgb(60, 76, 114);
			}
			
			.ace-tm .ace_support.ace_constant {
				color: rgb(6, 150, 14);
			}
			
			.ace-tm .ace_support.ace_type,
			.ace-tm .ace_support.ace_class {
				color: rgb(109, 121, 222);
			}
			
			.ace-tm .ace_keyword.ace_operator {
				color: rgb(104, 118, 135);
			}
			
			.ace-tm .ace_string {
				color: rgb(3, 106, 7);
			}
			
			.ace-tm .ace_comment {
				color: rgb(76, 136, 107);
			}
			
			.ace-tm .ace_comment.ace_doc {
				color: rgb(0, 102, 255);
			}
			
			.ace-tm .ace_comment.ace_doc.ace_tag {
				color: rgb(128, 159, 191);
			}
			
			.ace-tm .ace_constant.ace_numeric {
				color: rgb(0, 0, 205);
			}
			
			.ace-tm .ace_variable {
				color: rgb(49, 132, 149);
			}
			
			.ace-tm .ace_xml-pe {
				color: rgb(104, 104, 91);
			}
			
			.ace-tm .ace_entity.ace_name.ace_function {
				color: #0000A2;
			}
			
			.ace-tm .ace_heading {
				color: rgb(12, 7, 255);
			}
			
			.ace-tm .ace_list {
				color: rgb(185, 6, 144);
			}
			
			.ace-tm .ace_meta.ace_tag {
				color: rgb(0, 22, 142);
			}
			
			.ace-tm .ace_string.ace_regex {
				color: rgb(255, 0, 0)
			}
			
			.ace-tm .ace_marker-layer .ace_selection {
				background: rgb(181, 213, 255);
			}
			
			.ace-tm.ace_multiselect .ace_selection.ace_start {
				box-shadow: 0 0 3px 0px white;
			}
			
			.ace-tm .ace_marker-layer .ace_step {
				background: rgb(252, 255, 0);
			}
			
			.ace-tm .ace_marker-layer .ace_stack {
				background: rgb(164, 229, 101);
			}
			
			.ace-tm .ace_marker-layer .ace_bracket {
				margin: -1px 0 0 -1px;
				border: 1px solid rgb(192, 192, 192);
			}
			
			.ace-tm .ace_marker-layer .ace_active-line {
				background: rgba(0, 0, 0, 0.07);
			}
			
			.ace-tm .ace_gutter-active-line {
				background-color: #dcdcdc;
			}
			
			.ace-tm .ace_marker-layer .ace_selected-word {
				background: rgb(250, 250, 255);
				border: 1px solid rgb(200, 200, 250);
			}
			
			.ace-tm .ace_indent-guide {
				background: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAACCAYAAACZgbYnAAAAE0lEQVQImWP4////f4bLly//BwAmVgd1/w11/gAAAABJRU5ErkJggg==") right repeat-y;
			}
			/*# sourceURL=ace/css/ace-tm */
		</style>
		<style>
			.error_widget_wrapper {
				background: inherit;
				color: inherit;
				border: none
			}
			
			.error_widget {
				border-top: solid 2px;
				border-bottom: solid 2px;
				margin: 5px 0;
				padding: 10px 40px;
				white-space: pre-wrap;
			}
			
			.error_widget.ace_error,
			.error_widget_arrow.ace_error {
				border-color: #ff5a5a
			}
			
			.error_widget.ace_warning,
			.error_widget_arrow.ace_warning {
				border-color: #F1D817
			}
			
			.error_widget.ace_info,
			.error_widget_arrow.ace_info {
				border-color: #5a5a5a
			}
			
			.error_widget.ace_ok,
			.error_widget_arrow.ace_ok {
				border-color: #5aaa5a
			}
			
			.error_widget_arrow {
				position: absolute;
				border: solid 5px;
				border-top-color: transparent!important;
				border-right-color: transparent!important;
				border-left-color: transparent!important;
				top: -5px;
			}
		</style>
		<style>
			.ace_snippet-marker {
				-moz-box-sizing: border-box;
				box-sizing: border-box;
				background: rgba(194, 193, 208, 0.09);
				border: 1px dotted rgba(211, 208, 235, 0.62);
				position: absolute;
			}
		</style>
		<style>
			.ace_editor.ace_autocomplete .ace_marker-layer .ace_active-line {
				background-color: #CAD6FA;
				z-index: 1;
			}
			
			.ace_editor.ace_autocomplete .ace_line-hover {
				border: 1px solid #abbffe;
				margin-top: -1px;
				background: rgba(233, 233, 253, 0.4);
			}
			
			.ace_editor.ace_autocomplete .ace_line-hover {
				position: absolute;
				z-index: 2;
			}
			
			.ace_editor.ace_autocomplete .ace_scroller {
				background: none;
				border: none;
				box-shadow: none;
			}
			
			.ace_rightAlignedText {
				color: gray;
				display: inline-block;
				position: absolute;
				right: 4px;
				text-align: right;
				z-index: -1;
			}
			
			.ace_editor.ace_autocomplete .ace_completion-highlight {
				color: #000;
				text-shadow: 0 0 0.01em;
			}
			
			.ace_editor.ace_autocomplete {
				width: 280px;
				z-index: 200000;
				background: #fbfbfb;
				color: #444;
				border: 1px lightgray solid;
				position: fixed;
				box-shadow: 2px 3px 5px rgba(0, 0, 0, .2);
				line-height: 1.4;
			}
		</style>
		<script src="<%=path%>/example/js/mode-javascript.js"></script>
		<script src="<%=path%>/example/js/text.js"></script>
		<script src="<%=path%>/example/js/javascript.js"></script>
	</head>
  </head>
  
  <body>
    	<div id="main-container">
			<nav class="navbar navbar-default navbar-fixed-top">
				
					
					  <a href="/DataVisual/example/index.jsp"><img src="<%=path%>/resources/images/back.png"></a>
					
				
			</nav>
			<div id="code-container" style="width: 40%;">
				<div id="control-panel">
					<div id="code-info"><span class="code-info-time">10:16:08</span><span class="code-info-type-info">图表已生成, 184ms</span></div>
					<div class="control-btn-panel">
						<a href="javascript:;" onclick="disposeAndRun()" class="btn btn-default btn-sm">运行</a>
					</div>
				</div>
				<div id="code-panel" class=	" ace_editor ace-tm"><textarea class="ace_text-input" wrap="off" autocorrect="off" autocapitalize="off" spellcheck="false" style="opacity: 0; height: 14px; width: 6.59781px; left: 51px; top: 0px;"></textarea>
					<div class="ace_gutter">
						<div class="ace_layer ace_gutter-layer ace_folding-enabled" style="margin-top: 0px; height: 543px; width: 47px;">
							<div class="ace_gutter-cell " style="height: 14px;">1</div>
							<div class="ace_gutter-cell " style="height: 14px;">2</div>
							<div class="ace_gutter-cell " style="height: 14px;">3</div>
							<div class="ace_gutter-cell " style="height: 14px;">4</div>
							<div class="ace_gutter-cell " style="height: 14px;">5</div>
							<div class="ace_gutter-cell " style="height: 14px;">6</div>
							<div class="ace_gutter-cell " style="height: 14px;">7<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">8</div>
							<div class="ace_gutter-cell " style="height: 14px;">9</div>
							<div class="ace_gutter-cell " style="height: 14px;">10</div>
							<div class="ace_gutter-cell " style="height: 14px;">11</div>
							<div class="ace_gutter-cell " style="height: 14px;">12</div>
							<div class="ace_gutter-cell " style="height: 14px;">13<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">14<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">15</div>
							<div class="ace_gutter-cell " style="height: 14px;">16<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">17</div>
							<div class="ace_gutter-cell " style="height: 14px;">18</div>
							<div class="ace_gutter-cell " style="height: 14px;">19</div>
							<div class="ace_gutter-cell " style="height: 14px;">20<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">21</div>
							<div class="ace_gutter-cell " style="height: 14px;">22</div>
							<div class="ace_gutter-cell " style="height: 14px;">23</div>
							<div class="ace_gutter-cell " style="height: 14px;">24<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">25<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">26<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">27</div>
							<div class="ace_gutter-cell " style="height: 14px;">28</div>
							<div class="ace_gutter-cell " style="height: 14px;">29</div>
							<div class="ace_gutter-cell " style="height: 14px;">30</div>
							<div class="ace_gutter-cell " style="height: 14px;">31</div>
							<div class="ace_gutter-cell " style="height: 14px;">32</div>
							<div class="ace_gutter-cell " style="height: 14px;">33<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">34</div>
							<div class="ace_gutter-cell " style="height: 14px;">35</div>
							<div class="ace_gutter-cell " style="height: 14px;">36</div>
							<div class="ace_gutter-cell " style="height: 14px;">37</div>
							<div class="ace_gutter-cell " style="height: 14px;">38<span class="ace_fold-widget ace_start ace_open" style="height: 14px;"></span></div>
							<div class="ace_gutter-cell " style="height: 14px;">39</div>
							<div class="ace_gutter-cell " style="height: 14px;">40</div>
						</div>
						<div class="ace_gutter-active-line" style="top: 0px; height: 14px;"></div>
					</div>
					<div class="ace_scroller" style="left: 47px; right: 17px; bottom: 17px;">
						<div class="ace_content" style="margin-top: 0px; width: 1440px; height: 543px; margin-left: 0px;">
							<div class="ace_layer ace_print-margin-layer">
								<div class="ace_print-margin" style="left: 531.825px; visibility: visible;"></div>
							</div>
							<div class="ace_layer ace_marker-layer">
								<div class="ace_active-line" style="height:14px;top:0px;left:0;right:0;"></div>
							</div>
							
							<div class="ace_layer ace_marker-layer"></div>
							<div class="ace_layer ace_cursor-layer ace_hidden-cursors">
								<div class="ace_cursor" style="left: 4px; top: 0px; width: 6.59781px; height: 14px;"></div>
							</div>
						</div>
					</div>
					<div class="ace_scrollbar ace_scrollbar-v" style="width: 22px; bottom: 17px;">
						<div class="ace_scrollbar-inner" style="width: 22px; height: 1204px;"></div>
					</div>
					<div class="ace_scrollbar ace_scrollbar-h" style="height: 22px; left: 47px; right: 17px;">
						<div class="ace_scrollbar-inner" style="height: 22px; width: 546px;"></div>
					</div>
					<div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; overflow: hidden;">
						<div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; overflow: visible;"></div>
						<div style="height: auto; width: auto; top: 0px; left: 0px; visibility: hidden; position: absolute; white-space: pre; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; overflow: visible;">XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</div>
					</div>
				</div>
			</div>
			<div id="h-handler" class="handler" style="left: 40%;"></div>
			<div class="right-container" style="width: 60%; left: 40%;">
				<div id="chart-panel" class="right-panel" _echarts_instance_="ec_1522721767108" style="-webkit-tap-highlight-color: transparent; user-select: none;">
					<div style="position: relative; overflow: hidden; width: 800px; height: 492px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="800" height="492" style="position: absolute; left: 0px; top: 0px; width: 800px; height: 492px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div>
									</div>
				<div id="tool-panel">
					<div id="theme">
						
					</div><button id="download" class="btn btn-sm">Download</button></div>
			</div>
		</div>
		<script>
			if(window !== top) {
				var nav = document.getElementsByClassName('navbar')[0];
				nav.parentNode.removeChild(nav);
				document.getElementById('main-container').style.top = 0;
			}
		</script>
		<script type="text/javascript" src="<%=path%>/example/js/jquery.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/bootstrap.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/lodash.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/dat.gui.min.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/echarts.min.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/ecStat.min.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/china.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/world.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/dataTool.js"></script>
		<script type="text/javascript" src="<%=path%>/example/api/api.js"></script>
		<script type="text/javascript" src="<%=path%>/example/api/getscript.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/bmap.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/ace.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/ext-language_tools.js"></script>
		<script type="text/javascript" src="<%=path%>/example/parallel-aqi/editor.js"></script>
		<script type="text/javascript" src="<%=path%>/example/js/hm(1).js"></script>
		<script type="text/javascript">
			document.getElementById('nav-examples').className = 'active';
		</script>
  </body>
    
</html>
